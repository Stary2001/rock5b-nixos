{inputs, ...}: {
  imports = [
    inputs.flake-parts.flakeModules.easyOverlay
  ];
  perSystem = {config, ...}: {
    overlayAttrs = {
      fan-control-rock5b = config.packages.fan-control;
      linux-rock5b = config.packages.linux-rock5b;
    };
  };
}
