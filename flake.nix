{
  description = "Grub2 preview";

  inputs = {
    nixpkgs.url = "https://mirrors.ustc.edu.cn/nix-channels/nixos-24.05/nixexprs.tar.xz";
  };

  outputs = { self , nixpkgs ,... }: let
    system = "x86_64-linux";
  in {
    devShells."${system}".default = let
      pkgs = import nixpkgs {
        inherit system;
      };
    in pkgs.mkShell {
      packages = with pkgs; [
        git
        grub2
        libisoburn
        qemu
        gnumake
      ];
      shellHook = ''
      '';
    };
  };
}