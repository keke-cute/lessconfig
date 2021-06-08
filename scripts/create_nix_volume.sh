echo 'nix' | sudo tee -a /etc/synthetic.conf
reboot  # Actually reboot your Mac.
diskutil list # Check your disk number!!!!!!!!!!!
sudo diskutil apfs addVolume disk2 APFSX Nix -mountpoint /nix

sudo diskutil enableOwnership /nix
sudo chflags hidden /nix
echo "LABEL=Nix /nix apfs rw" | sudo tee -a /etc/fstab

