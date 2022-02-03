{
  fetchzip, stdenv, autoPatchelfHook,
  gdk-pixbuf, libX11, cairo, atk, pango, gtk2-x11, hidapi
}:

stdenv.mkDerivation {
  name = "keymouse";

  src = fetchzip {
    url = "https://www.keymouse.com/downloads/linux/keymouse-setup3.08.tar.gz";
    hash = "sha256-+BI8b3b5iM5jYPh0o1GfTVTTiCR03HmHDjljCXp7dSY=";
    stripRoot = false;
  };

  nativeBuildInputs = [
    autoPatchelfHook
  ];

  buildInputs = [
    gdk-pixbuf
    libX11
    cairo
    atk
    pango
    gtk2-x11
    hidapi
  ];

  installPhase = ''
    install -m755 -D keymouse-linux $out/share/keymouse/keymouse
    cp -r devices keysets layouts specialkeys $out/share/keymouse/

    mkdir $out/bin
    ln -s $out/share/keymouse/keymouse $out/bin/keymouse
  '';
}
