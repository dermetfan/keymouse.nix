{
  outputs = { nixpkgs, ... }: rec {
    packages.x86_64-linux.keymouse = nixpkgs.legacyPackages.x86_64-linux.callPackage ./. {};

    defaultPackage.x86_64-linux = packages.x86_64-linux.keymouse;
  };
}
