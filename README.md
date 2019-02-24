# Hacking the D-Link DCS-1130

This is a companion repository to a presentation about hacking the **D-Link DCS-1130**, it has the following inside:


1. Downloaded Firmware ZIP (what you get from the website)
2. Extracted Firmware Updater (immediately extracting the above)
3. Binary Blob from the Updater (getting the blob from the .bin)
4. Extracted Root FS (extracted rootfs from `binwalk`)

if you want to use the tools used in this presentation you must have the following installed:

```
unzip    python    binwalk    cramfsswap    cramfsprogs
```

## Installing Dependencies (Docker)

If you have docker you can just use the provided Dockerfile:

```bash
docker build -t dlink .
docker run -v "$(pwd):/work" -it dlink
cd /work
```

## Installing Dependencies (Nix)

Alternatively if you have or want to install [Nix](https://nixos.org/nix/) then all you have to do is run:

```bash
nix-shell shell.nix
```

## Extract the Blob

You can test and see if you got everything setup by running:

```
binwalk -e '3 Binary Blob from the Updater'/dcs-1130.dat
```
