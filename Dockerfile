FROM nixos/nix:latest

ADD shell.nix .

RUN nix-shell shell.nix --run true

CMD ["nix-shell", "shell.nix"]
