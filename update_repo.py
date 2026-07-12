#!/usr/bin/env python3
import os
import subprocess
import hashlib
import time
import gzip
import shutil

repo_root = os.path.dirname(os.path.abspath(__file__))
pool_dir = os.path.join(repo_root, "pool", "main")
binary_dir = os.path.join(repo_root, "dists", "stable", "main", "binary-aarch64")
release_file = os.path.join(repo_root, "dists", "stable", "Release")

# 1. Copy new debs to pool/main/
new_debs_dir = os.path.expanduser("~/build-debs")
if os.path.isdir(new_debs_dir):
    for f in os.listdir(new_debs_dir):
        if f.endswith(".deb"):
            src = os.path.join(new_debs_dir, f)
            dst = os.path.join(pool_dir, f)
            print(f"Moving {f} to pool/main...")
            shutil.copy2(src, dst)

# 2. Get list of all debs
debs = sorted([f for f in os.listdir(pool_dir) if f.endswith(".deb")])

packages_content = ""

for deb in debs:
    deb_path = os.path.join(pool_dir, deb)
    
    # Run dpkg-deb -f to get control fields
    res = subprocess.run(["dpkg-deb", "-f", deb_path], capture_output=True, text=True, check=True)
    control = res.stdout.strip()
    
    # Calculate checksums and size
    size = os.path.getsize(deb_path)
    with open(deb_path, "rb") as f:
        data = f.read()
        md5 = hashlib.md5(data).hexdigest()
        sha256 = hashlib.sha256(data).hexdigest()
        
    packages_content += control + "\n"
    packages_content += f"Filename: pool/main/{deb}\n"
    packages_content += f"Size: {size}\n"
    packages_content += f"MD5sum: {md5}\n"
    packages_content += f"SHA256: {sha256}\n\n"

# Write Packages
packages_path = os.path.join(binary_dir, "Packages")
os.makedirs(binary_dir, exist_ok=True)
with open(packages_path, "w") as f:
    f.write(packages_content)
print("Wrote dists/stable/main/binary-aarch64/Packages")

# Write Packages.gz
packages_gz_path = packages_path + ".gz"
with open(packages_path, "rb") as f_in:
    with gzip.open(packages_gz_path, "wb") as f_out:
        shutil.copyfileobj(f_in, f_out)
print("Wrote dists/stable/main/binary-aarch64/Packages.gz")

# Helper for file checksums
def get_file_info(rel_path):
    abs_path = os.path.join(repo_root, "dists", "stable", rel_path)
    size = os.path.getsize(abs_path)
    with open(abs_path, "rb") as f:
        data = f.read()
        md5 = hashlib.md5(data).hexdigest()
        sha256 = hashlib.sha256(data).hexdigest()
    return size, md5, sha256

pkgs_size, pkgs_md5, pkgs_sha256 = get_file_info("main/binary-aarch64/Packages")
pkgs_gz_size, pkgs_gz_md5, pkgs_gz_sha256 = get_file_info("main/binary-aarch64/Packages.gz")

# Generate Release
date_str = time.strftime("%a, %d %b %Y %H:%M:%S +0000", time.gmtime())

release_content = f"""Origin: Anland Termux Repo
Label: Anland
Suite: stable
Codename: stable
Date: {date_str}
Architectures: aarch64
Components: main
Description: Experimental Hyprland + Plasma Mobile packages for Termux aarch64
MD5Sum:
 {pkgs_md5} {pkgs_size} main/binary-aarch64/Packages
 {pkgs_gz_md5} {pkgs_gz_size} main/binary-aarch64/Packages.gz
SHA256:
 {pkgs_sha256} {pkgs_size} main/binary-aarch64/Packages
 {pkgs_gz_sha256} {pkgs_gz_size} main/binary-aarch64/Packages.gz
"""

with open(release_file, "w") as f:
    f.write(release_content)
print("Wrote dists/stable/Release")
print("Repository updated successfully!")
