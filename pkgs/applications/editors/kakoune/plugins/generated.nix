# This file has been generated by ./pkgs/applications/editors/kakoune/plugins/update.py. Do not edit!
{ lib, buildKakounePluginFrom2Nix, fetchFromGitHub, overrides ? (self: super: {}) }:
let
  packages = ( self:
{
  active-window-kak = buildKakounePluginFrom2Nix {
    pname = "active-window-kak";
    version = "2020-05-13";
    src = fetchFromGitHub {
      owner = "greenfork";
      repo = "active-window.kak";
      rev = "988db69cfbb88bd741d089bb43b0be551693e7c1";
      sha256 = "1fv1cp9q212gamf9z2papl5xcl2w31fpcmbgdzbxcxdl1pvfsqp8";
    };
    meta.homepage = "https://github.com/greenfork/active-window.kak/";
  };

  auto-pairs-kak = buildKakounePluginFrom2Nix {
    pname = "auto-pairs-kak";
    version = "2021-03-28";
    src = fetchFromGitHub {
      owner = "alexherbo2";
      repo = "auto-pairs.kak";
      rev = "526779a26a5cf5f48e7c4f5c5fecca274968a737";
      sha256 = "0gkhvwxyh8pdfydrj7zkfidk0drrbhvdi1fq3pkzllna3vz8q181";
    };
    meta.homepage = "https://github.com/alexherbo2/auto-pairs.kak/";
  };

  connect-kak = buildKakounePluginFrom2Nix {
    pname = "connect-kak";
    version = "2021-02-24";
    src = fetchFromGitHub {
      owner = "kakounedotcom";
      repo = "connect.kak";
      rev = "a536605a208149eed58986bda54f3dda215dfe61";
      sha256 = "1svw64zk28sn271vjyzvq21zaln13vnx59rxnxah6adq8n5nkr4a";
    };
    meta.homepage = "https://github.com/kakounedotcom/connect.kak/";
  };

  fzf-kak = buildKakounePluginFrom2Nix {
    pname = "fzf-kak";
    version = "2021-03-19";
    src = fetchFromGitHub {
      owner = "andreyorst";
      repo = "fzf.kak";
      rev = "435cc240f3732770b19cc7dce9bdf65e22d6ed6a";
      sha256 = "0ahcz7z5i8bngjnkd6yr782wah873yxgm8xrwa9g8gkddvj3q6rw";
    };
    meta.homepage = "https://github.com/andreyorst/fzf.kak/";
  };

  kakoune-buffer-switcher = buildKakounePluginFrom2Nix {
    pname = "kakoune-buffer-switcher";
    version = "2020-12-27";
    src = fetchFromGitHub {
      owner = "occivink";
      repo = "kakoune-buffer-switcher";
      rev = "6a27c45db87a23070c34fab36d2f8d812cd002a6";
      sha256 = "1rmwy317908v8p54806m721bpzm8sgygb9abri34537ka6r05y5j";
    };
    meta.homepage = "https://github.com/occivink/kakoune-buffer-switcher/";
  };

  kakoune-buffers = buildKakounePluginFrom2Nix {
    pname = "kakoune-buffers";
    version = "2020-06-11";
    src = fetchFromGitHub {
      owner = "Delapouite";
      repo = "kakoune-buffers";
      rev = "67959fbad727ba8470fe8cd6361169560f4fb532";
      sha256 = "09prhzz4yzf6ryw0npd1gpcfp77681vgawpp1ilfvbf25xgbbz33";
    };
    meta.homepage = "https://github.com/Delapouite/kakoune-buffers/";
  };

  kakoune-colors = buildKakounePluginFrom2Nix {
    pname = "kakoune-colors";
    version = "2020-09-03";
    src = fetchFromGitHub {
      owner = "Delapouite";
      repo = "kakoune-colors";
      rev = "f506944c9d0149cec59582ad048ce08f8e965ac2";
      sha256 = "1vrzm2klbrdhxv4q5lx8xjzw2xbnyfr0gkqzfz65qplycm2j37kp";
    };
    meta.homepage = "https://github.com/Delapouite/kakoune-colors/";
  };

  kakoune-easymotion = buildKakounePluginFrom2Nix {
    pname = "kakoune-easymotion";
    version = "2020-03-09";
    src = fetchFromGitHub {
      owner = "danr";
      repo = "kakoune-easymotion";
      rev = "0ca75450023a149efc70e8e383e459b571355c70";
      sha256 = "15czvl0qj2k767pysr6xk2v31mkhvcbmv76xs2a8yrslchms70b5";
    };
    meta.homepage = "https://github.com/danr/kakoune-easymotion/";
  };

  kakoune-extra-filetypes = buildKakounePluginFrom2Nix {
    pname = "kakoune-extra-filetypes";
    version = "2021-01-15";
    src = fetchFromGitHub {
      owner = "kakoune-editor";
      repo = "kakoune-extra-filetypes";
      rev = "c6f8aaccd8c9cd6b487964c8943416e21fbe7c18";
      sha256 = "1vkff8xbycfgxv8x09cvc79qcg5fdzn2x77mbmifmkq236khrwrg";
    };
    meta.homepage = "https://github.com/kakoune-editor/kakoune-extra-filetypes/";
  };

  kakoune-gdb = buildKakounePluginFrom2Nix {
    pname = "kakoune-gdb";
    version = "2021-03-03";
    src = fetchFromGitHub {
      owner = "occivink";
      repo = "kakoune-gdb";
      rev = "e24d0eabbd0b6b277385448ff158434d249b9690";
      sha256 = "17g5bd7yk3d8j6qlbrz1knphjls2s47k6sj2c7a9nyzyiw8821yp";
    };
    meta.homepage = "https://github.com/occivink/kakoune-gdb/";
  };

  kakoune-rainbow = buildKakounePluginFrom2Nix {
    pname = "kakoune-rainbow";
    version = "2020-09-01";
    src = fetchFromGitHub {
      owner = "listentolist";
      repo = "kakoune-rainbow";
      rev = "d09103e8d268cf4621215bf162a0244c9482be3c";
      sha256 = "1i3id7xw0j4z1a14mscr68ckpgvcwsjpl86lr864wy7w7qcmblx6";
    };
    meta.homepage = "https://github.com/listentolist/kakoune-rainbow/";
  };

  kakoune-registers = buildKakounePluginFrom2Nix {
    pname = "kakoune-registers";
    version = "2020-06-19";
    src = fetchFromGitHub {
      owner = "Delapouite";
      repo = "kakoune-registers";
      rev = "9531947baecd83c1d4c3bea0adf10f4462f1e120";
      sha256 = "08v9ndghh7wvr8rsrqm05gksk9ai5vnwvw9gwqasbppb48cv4a8c";
    };
    meta.homepage = "https://github.com/Delapouite/kakoune-registers/";
  };

  kakoune-surround = buildKakounePluginFrom2Nix {
    pname = "kakoune-surround";
    version = "2018-09-17";
    src = fetchFromGitHub {
      owner = "h-youhei";
      repo = "kakoune-surround";
      rev = "efe74c6f434d1e30eff70d4b0d737f55bf6c5022";
      sha256 = "09fd7qhlsazf4bcl3z7xh9z0fklw69c5j32hminphihq74qrry6h";
    };
    meta.homepage = "https://github.com/h-youhei/kakoune-surround/";
  };

  kakoune-vertical-selection = buildKakounePluginFrom2Nix {
    pname = "kakoune-vertical-selection";
    version = "2019-04-11";
    src = fetchFromGitHub {
      owner = "occivink";
      repo = "kakoune-vertical-selection";
      rev = "c420f8b867ce47375fac303886e31623669a42b7";
      sha256 = "13jdyd2j45wvgqvxdzw9zww14ly93bqjb6700zzxj7mkbiff6wsb";
    };
    meta.homepage = "https://github.com/occivink/kakoune-vertical-selection/";
  };

  openscad-kak = buildKakounePluginFrom2Nix {
    pname = "openscad-kak";
    version = "2020-12-10";
    src = fetchFromGitHub {
      owner = "mayjs";
      repo = "openscad.kak";
      rev = "ba51bbdcd96ccf94bb9239bef1481b6f37125849";
      sha256 = "15dybd6dnnwla6mj8sw83nwd62para1syxzifznl6rz6kp8vqjjj";
    };
    meta.homepage = "https://github.com/mayjs/openscad.kak/";
  };

  powerline-kak = buildKakounePluginFrom2Nix {
    pname = "powerline-kak";
    version = "2021-02-25";
    src = fetchFromGitHub {
      owner = "andreyorst";
      repo = "powerline.kak";
      rev = "64ad98b6c85e63345563671b043960464d51c4b0";
      sha256 = "09w2sk19qi64hgsyg4gb407vyppnlgk272mqbinz2r3apy6szkl3";
    };
    meta.homepage = "https://github.com/andreyorst/powerline.kak/";
  };

  prelude-kak = buildKakounePluginFrom2Nix {
    pname = "prelude-kak";
    version = "2021-02-24";
    src = fetchFromGitHub {
      owner = "kakounedotcom";
      repo = "prelude.kak";
      rev = "5dbdc020c546032885c1fdb463e366cc89fc15ad";
      sha256 = "1pncr8azqvl2z9yvzhc68p1s9fld8cvak8yz88zgrp5ypx2cxl8c";
    };
    meta.homepage = "https://github.com/kakounedotcom/prelude.kak/";
  };

  replace-mode-kak = buildKakounePluginFrom2Nix {
    pname = "replace-mode-kak";
    version = "2020-10-07";
    src = fetchFromGitHub {
      owner = "alexherbo2";
      repo = "replace-mode.kak";
      rev = "5f4c73cdbaf5aeb964ee35ad4b9081b233af90c0";
      sha256 = "1cmylx99bm7jwfb4hclb69sdc4n8f29ssyy2byjiw53ni9rnc8q0";
    };
    meta.homepage = "https://github.com/alexherbo2/replace-mode.kak/";
  };

  sleuth-kak = buildKakounePluginFrom2Nix {
    pname = "sleuth-kak";
    version = "2020-11-06";
    src = fetchFromGitHub {
      owner = "alexherbo2";
      repo = "sleuth.kak";
      rev = "911db8bd208ad0d289b8fa15a2ac665ff39bd6bd";
      sha256 = "0g41c0038fpmihqva71xl4vfbmvsp13i47gp6fnmaikajpynzc51";
    };
    meta.homepage = "https://github.com/alexherbo2/sleuth.kak/";
  };

  smarttab-kak = buildKakounePluginFrom2Nix {
    pname = "smarttab-kak";
    version = "2021-02-24";
    src = fetchFromGitHub {
      owner = "andreyorst";
      repo = "smarttab.kak";
      rev = "1dd3f33c4f65da5c13aee5d44b2e77399595830f";
      sha256 = "0g49k47ggppng95nwanv2rqmcfsjsgy3z1764wrl5b49h9wifhg2";
    };
    meta.homepage = "https://github.com/andreyorst/smarttab.kak/";
  };

  snippets-kak = buildKakounePluginFrom2Nix {
    pname = "snippets-kak";
    version = "2021-02-23";
    src = fetchFromGitHub {
      owner = "alexherbo2";
      repo = "snippets.kak";
      rev = "3cde27f99605e6c680f4e60c2779ef3d2b77cadd";
      sha256 = "0z55v5bvhqgzvn9qcaxlylhigi72y2jpr56zqmbp98rgsy542fps";
    };
    meta.homepage = "https://github.com/alexherbo2/snippets.kak/";
  };

  tabs-kak = buildKakounePluginFrom2Nix {
    pname = "tabs-kak";
    version = "2021-02-16";
    src = fetchFromGitHub {
      owner = "enricozb";
      repo = "tabs.kak";
      rev = "1aaa8cd89e404cbbd76d44ff8089de0951612fbf";
      sha256 = "0dfz6j6yxl65jbh4xvpiy2abr2sdjyalynzhl28y7l1gzqv4ni3j";
    };
    meta.homepage = "https://github.com/enricozb/tabs.kak/";
  };

});
in lib.fix' (lib.extends overrides packages)
