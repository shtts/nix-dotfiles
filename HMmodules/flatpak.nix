{ inputs, ... }:

{
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
  ];

  services.flatpak = {
    enable = true;

    packages = [
      "org.gnome.gitlab.ilhooq.Bookup"
     "io.github.redddfoxxyy.samaya" 
     "com.github.johnfactotum.Foliate"
    ];

    uninstallUnmanaged = false;
    
    update = {
      onActivation = true;
      auto.enable = false;
    };
  };
}
