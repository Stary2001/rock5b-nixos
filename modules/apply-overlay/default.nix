{
  config,
  lib,
  rock5bFlake,
  ...
}: let
  inherit (config.nixpkgs) localSystem;
  selectedPlatform = lib.systems.elaborate "aarch64-linux";
  isCross = localSystem != selectedPlatform.system;
  dynamicOverlay =
    if isCross
    then
      (self: super:
        with (rock5bFlake.packages.${localSystem.system}); {
          inherit linux-rock5b;
          fan-control-rock5b = fan-control;
          kodi-rock5b = kodi;
        })
    else rock5bFlake.overlays.default;
in {
  nixpkgs.overlays = [
    dynamicOverlay
  ];
}
