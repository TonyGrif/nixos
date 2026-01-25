{
  browsers = import ./browsers.nix;
  textEditors = import ./textEditors.nix;

  gnome = import ./gnome.nix;
  coding = import ./coding;
}
