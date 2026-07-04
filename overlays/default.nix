{inputs, ...}: {
  unstable-packages = final: _prev: {
    rpcs3Official = final.stdenvNoCC.mkDerivation rec {
      pname = "rpcs3";
      version = "0.0.41-19510";

      src = final.fetchurl {
        url = "https://github.com/RPCS3/rpcs3-binaries-linux/releases/download/build-42242b3c430934c1ee47c1406919658c96c6f579/rpcs3-v0.0.41-19510-42242b3c_linux64.AppImage";
        sha256 = "cad199134c9c29457736bf96c08e4ea2bd9b62c0dbf374313db9be8e229bcd34";
      };

      nativeBuildInputs = [
        final.makeWrapper
      ];

      runtimeLibraryPath = final.lib.makeLibraryPath [
        final.alsa-lib
        final.dbus
        final.e2fsprogs.out
        final.expat
        final.fontconfig
        final.freetype
        final.glib
        final.gmp
        final.libgpg-error
        final.libGL
        final.libICE
        final.libSM
        final.libdrm
        final.libkrb5
        final.libpulseaudio
        final.libx11
        final.libxcb
        final.libxcursor
        final.libxext
        final.libxi
        final.libxinerama
        final.libxkbcommon
        final.libxrandr
        final.libxrender
        final.stdenv.cc.cc.lib
        final.udev
        final.vulkan-loader
        final.wayland
        final.zlib
      ];

      dontUnpack = true;

      installPhase = ''
        runHook preInstall

        install -Dm755 $src $out/share/${pname}/${pname}.AppImage
        makeWrapper $out/share/${pname}/${pname}.AppImage $out/bin/rpcs3 \
          --prefix PATH : /run/wrappers/bin \
          --prefix LD_LIBRARY_PATH : ${runtimeLibraryPath}

        runHook postInstall
      '';

      meta = {
        description = "Official RPCS3 Linux AppImage";
        homepage = "https://rpcs3.net/";
        mainProgram = "rpcs3";
      };
    };

    unstable = import inputs.nixpkgs-unstable {
      system = final.stdenv.hostPlatform.system;
      config.allowUnfree = true;
    };
  };
}
