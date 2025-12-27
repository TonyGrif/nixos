{
  browsers = import ./browsers.nix;

  gnome = import ./gnome.nix;
  creative = import ./creative;
  coding = import ./coding;
  office = import ./office;
  hyprland = import ./hyprland.nix;
}
