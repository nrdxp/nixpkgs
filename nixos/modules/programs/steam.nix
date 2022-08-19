{ config, lib, pkgs, ... }:

with lib;

let
  cfg = config.programs.steam;
  gsCfg = config.programs.gamescope;

  steam = pkgs.steam.override ({
    extraLibraries = pkgs: with config.hardware.opengl;
      if pkgs.hostPlatform.is64bit
      then [ package ] ++ extraPackages
      else [ package32 ] ++ extraPackages32;
  } // optionalAttrs
    (cfg.gamescopeSession && gsCfg.capSysNice) {
      buildFHSUserEnv = pkgs.buildFHSUserEnvBubblewrap.override {
        # use the setuid wrapped bubblewrap
        bubblewrap = "/run/wrappers";
      };
    }
  );

  gamescopeSessionFile = (pkgs.writeTextDir "share/wayland-sessions/steam.desktop" ''
    [Desktop Entry]
    Name=Steam
    Comment=A digital distribution platform
    Exec=${pkgs.writeShellScript "steam-gamescope" ''
      gamescope -- steam -tenfoot -pipewire-dmabuf
    ''}
    Type=Application
  '').overrideAttrs (_: { passthru.providedSessions = ["steam"]; });
in {
  options.programs.steam = {
    enable = mkEnableOption (lib.mdDoc "steam");

    remotePlay.openFirewall = mkOption {
      type = types.bool;
      default = false;
      description = lib.mdDoc ''
        Open ports in the firewall for Steam Remote Play.
      '';
    };

    dedicatedServer.openFirewall = mkOption {
      type = types.bool;
      default = false;
      description = lib.mdDoc ''
        Open ports in the firewall for Source Dedicated Server.
      '';
    };

    gamescopeSession = mkOption {
      type = types.bool;
      default = false;
      description = lib.mdDoc ''
        Configure GameScope to work well with Steam, and use it to setup a Steam session for your display-manager.
      '';
    };
  };

  config = mkIf cfg.enable {
    hardware.opengl = { # this fixes the "glXChooseVisual failed" bug, context: https://github.com/NixOS/nixpkgs/issues/47932
      enable = true;
      driSupport = true;
      driSupport32Bit = true;
    };

    security.wrappers = mkIf (cfg.gamescopeSession && gsCfg.capSysNice) {
      # needed or steam fails
      bwrap = {
        owner = "root";
        group = "root";
        source = "${pkgs.bubblewrap}/bin/bwrap";
        setuid = true;
      };
    };

    programs.gamescope.enable = mkIf cfg.gamescopeSession true;
    programs.gamescope.args = mkIf cfg.gamescopeSession [ "-e" ];
    services.xserver.displayManager.sessionPackages = mkIf cfg.gamescopeSession [gamescopeSessionFile];

    # optionally enable 32bit pulseaudio support if pulseaudio is enabled
    hardware.pulseaudio.support32Bit = config.hardware.pulseaudio.enable;

    hardware.steam-hardware.enable = true;

    environment.systemPackages = [ steam steam.run ];

    networking.firewall = lib.mkMerge [
      (mkIf cfg.remotePlay.openFirewall {
        allowedTCPPorts = [ 27036 ];
        allowedUDPPortRanges = [ { from = 27031; to = 27036; } ];
      })

      (mkIf cfg.dedicatedServer.openFirewall {
        allowedTCPPorts = [ 27015 ]; # SRCDS Rcon port
        allowedUDPPorts = [ 27015 ]; # Gameplay traffic
      })
    ];
  };

  meta.maintainers = with maintainers; [ mkg20001 ];
}
