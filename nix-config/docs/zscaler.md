# ZScaler Cert Fix

Source: https://github.com/NixOS/nix/issues/7808

```bash
# dump macOS cert bundle
sudo security export -t certs -p -o '/opt/zscaler.crt'

# ensure the zscaler cert bundle is world readable
sudo chmod 755 '/opt/zscaler.crt'

# install nix using the zscaler cert bundle
curl --proto '=https' --tlsv1.2 -sSf -L 'https://install.determinate.systems/nix' \
  | sh -s -- install --no-confirm --ssl-cert-file '/opt/zscaler.crt'

# merge Nix and zscaler cert bundles
# TODO: I expect this will break if/when nix updates their ca bundle?
cat '/opt/zscaler.crt' '/nix/var/nix/profiles/default/etc/ssl/certs/ca-bundle.crt' \
  | sudo tee '/opt/nix-and-zscaler.crt'
sudo chmod 755 '/opt/nix-and-zscaler.crt'

# reconfigure nix to use our combined cert bundle instead
sudo sed -i '' '/^ssl-cert-file /d' '/etc/nix/nix.conf'
printf "\nssl-cert-file = /opt/nix-and-zscaler.crt\n" | sudo tee -a '/etc/nix/nix.conf'

# make the current user a trusted user
printf "\ntrusted-users = root %s\n" "$USER" | sudo tee -a '/etc/nix/nix.conf'

# source the nix integration script
. '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
```
