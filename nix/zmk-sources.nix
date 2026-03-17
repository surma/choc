# Generated from config/west.yml, zmk app/west.yml, and zephyr west.yml.
# Mirrors the GitHub Actions workspace layout without running `west update` during the Nix build.
[
  {
    name = "nrf_hw_models";
    path = "modules/bsim_hw_models/nrf_hw_models";
    url = "https://github.com/zephyrproject-rtos/nrf_hw_models.git";
    rev = "73a5d5827a94820be65b7d276d28173ec10bab9f";
  }
  {
    name = "mbedtls";
    path = "modules/crypto/mbedtls";
    url = "https://github.com/zephyrproject-rtos/mbedtls.git";
    rev = "4952e1328529ee549d412b498ea71c54f30aa3b1";
  }
  {
    name = "tinycrypt";
    path = "modules/crypto/tinycrypt";
    url = "https://github.com/zephyrproject-rtos/tinycrypt.git";
    rev = "1012a3ebee18c15ede5efc8332ee2fc37817670f";
  }
  {
    name = "mipi-sys-t";
    path = "modules/debug/mipi-sys-t";
    url = "https://github.com/zephyrproject-rtos/mipi-sys-t.git";
    rev = "33e5c23cbedda5ba12dbe50c4baefb362a791001";
  }
  {
    name = "percepio";
    path = "modules/debug/percepio";
    url = "https://github.com/zephyrproject-rtos/percepio.git";
    rev = "49e6dc202aa38c2a3edbafcc2dab85dec6aee973";
  }
  {
    name = "segger";
    path = "modules/debug/segger";
    url = "https://github.com/zephyrproject-rtos/segger.git";
    rev = "cf56b1d9c80f81a26e2ac5727c9cf177116a4692";
  }
  {
    name = "fatfs";
    path = "modules/fs/fatfs";
    url = "https://github.com/zephyrproject-rtos/fatfs.git";
    rev = "16245c7c41d2b79e74984f49b5202551786b8a9b";
  }
  {
    name = "littlefs";
    path = "modules/fs/littlefs";
    url = "https://github.com/zephyrproject-rtos/littlefs.git";
    rev = "ed0531d59ee37f5fb2762bcf2fc8ba4efaf82656";
  }
  {
    name = "hal_adi";
    path = "modules/hal/adi";
    url = "https://github.com/zephyrproject-rtos/hal_adi.git";
    rev = "633fcecf3717aaa22079cf6121627a879f24df51";
  }
  {
    name = "hal_ambiq";
    path = "modules/hal/ambiq";
    url = "https://github.com/zephyrproject-rtos/hal_ambiq.git";
    rev = "87a188b91aca22ce3ce7deb4a1cbf7780d784673";
  }
  {
    name = "hal_atmel";
    path = "modules/hal/atmel";
    url = "https://github.com/zephyrproject-rtos/hal_atmel.git";
    rev = "da767444cce3c1d9ccd6b8a35fd7c67dc82d489c";
  }
  {
    name = "cmsis";
    path = "modules/hal/cmsis";
    url = "https://github.com/zephyrproject-rtos/cmsis.git";
    rev = "d1b8b20b6278615b00e136374540eb1c00dcabe7";
  }
  {
    name = "hal_espressif";
    path = "modules/hal/espressif";
    url = "https://github.com/zephyrproject-rtos/hal_espressif.git";
    rev = "202c59552dc98e5cd02386313e1977ecb17a131f";
  }
  {
    name = "hal_ethos_u";
    path = "modules/hal/ethos_u";
    url = "https://github.com/zephyrproject-rtos/hal_ethos_u.git";
    rev = "50ddffca1cc700112f25ad9bc077915a0355ee5d";
  }
  {
    name = "hal_gigadevice";
    path = "modules/hal/gigadevice";
    url = "https://github.com/zephyrproject-rtos/hal_gigadevice.git";
    rev = "2994b7dde8b0b0fa9b9c0ccb13474b6a486cddc3";
  }
  {
    name = "hal_intel";
    path = "modules/hal/intel";
    url = "https://github.com/zephyrproject-rtos/hal_intel.git";
    rev = "0355bb816263c54eed23c7781034447af5d8200c";
  }
  {
    name = "libmetal";
    path = "modules/hal/libmetal";
    url = "https://github.com/zephyrproject-rtos/libmetal.git";
    rev = "3e8781aae9d7285203118c05bc01d4eb0ca565a7";
  }
  {
    name = "hal_nordic";
    path = "modules/hal/nordic";
    url = "https://github.com/zephyrproject-rtos/hal_nordic.git";
    rev = "37ca068d7b013fb65a2acc9306bffa48a3e72839";
  }
  {
    name = "hal_nuvoton";
    path = "modules/hal/nuvoton";
    url = "https://github.com/zephyrproject-rtos/hal_nuvoton.git";
    rev = "466c3eed9c98453fb23953bf0e0427fea01924be";
  }
  {
    name = "hal_quicklogic";
    path = "modules/hal/quicklogic";
    url = "https://github.com/zephyrproject-rtos/hal_quicklogic.git";
    rev = "bad894440fe72c814864798c8e3a76d13edffb6c";
  }
  {
    name = "hal_renesas";
    path = "modules/hal/renesas";
    url = "https://github.com/zephyrproject-rtos/hal_renesas.git";
    rev = "3204903bdc5eda6869a40363560a69369c8d0e22";
  }
  {
    name = "hal_rpi_pico";
    path = "modules/hal/rpi_pico";
    url = "https://github.com/zephyrproject-rtos/hal_rpi_pico.git";
    rev = "7b57b24588797e6e7bf18b6bda168e6b96374264";
  }
  {
    name = "hal_silabs";
    path = "modules/hal/silabs";
    url = "https://github.com/zephyrproject-rtos/hal_silabs.git";
    rev = "8a173e9e566a396a19d18da4661cb54ce098f268";
  }
  {
    name = "hal_stm32";
    path = "modules/hal/stm32";
    url = "https://github.com/zmkfirmware/hal_stm32.git";
    rev = "4fcc3a3f32abe1c4cb76d9d1cef967728dd03908";
  }
  {
    name = "hal_tdk";
    path = "modules/hal/tdk";
    url = "https://github.com/zephyrproject-rtos/hal_tdk.git";
    rev = "6727477af1e46fa43878102489b9672a9d24e39f";
  }
  {
    name = "hal_telink";
    path = "modules/hal/telink";
    url = "https://github.com/zephyrproject-rtos/hal_telink.git";
    rev = "4226c7fc17d5a34e557d026d428fc766191a0800";
  }
  {
    name = "hal_wch";
    path = "modules/hal/wch";
    url = "https://github.com/zephyrproject-rtos/hal_wch.git";
    rev = "1de9d3e406726702ce7cfc504509a02ecc463554";
  }
  {
    name = "hal_wurthelektronik";
    path = "modules/hal/wurthelektronik";
    url = "https://github.com/zephyrproject-rtos/hal_wurthelektronik.git";
    rev = "e3e2797b224fc48fdef1bc3e5a12a7c73108bba2";
  }
  {
    name = "acpica";
    path = "modules/lib/acpica";
    url = "https://github.com/zephyrproject-rtos/acpica.git";
    rev = "8d24867bc9c9d81c81eeac59391cda59333affd4";
  }
  {
    name = "cmsis-dsp";
    path = "modules/lib/cmsis-dsp";
    url = "https://github.com/zephyrproject-rtos/cmsis-dsp.git";
    rev = "d80a49b2bb186317dc1db4ac88da49c0ab77e6e7";
  }
  {
    name = "cmsis-nn";
    path = "modules/lib/cmsis-nn";
    url = "https://github.com/zephyrproject-rtos/cmsis-nn.git";
    rev = "e9328d612ea3ea7d0d210d3ac16ea8667c01abdd";
  }
  {
    name = "cmsis_6";
    path = "modules/lib/cmsis_6";
    url = "https://github.com/zephyrproject-rtos/CMSIS_6.git";
    rev = "783317a3072554acbac86cca2ff24928cbf98d30";
  }
  {
    name = "lvgl";
    path = "modules/lib/gui/lvgl";
    url = "https://github.com/zmkfirmware/lvgl.git";
    rev = "f1db87ee98f1810328a8419572fa42a3b5f352ae";
  }
  {
    name = "hostap";
    path = "modules/lib/hostap";
    url = "https://github.com/zephyrproject-rtos/hostap.git";
    rev = "697fd2cf5cbbd0c5375fc34761b6a9d7489a67d2";
  }
  {
    name = "liblc3";
    path = "modules/lib/liblc3";
    url = "https://github.com/zephyrproject-rtos/liblc3.git";
    rev = "48bbd3eacd36e99a57317a0a4867002e0b09e183";
  }
  {
    name = "libmctp";
    path = "modules/lib/libmctp";
    url = "https://github.com/zephyrproject-rtos/libmctp.git";
    rev = "b97860e78998551af99931ece149eeffc538bdb1";
  }
  {
    name = "nrf_wifi";
    path = "modules/lib/nrf_wifi";
    url = "https://github.com/zephyrproject-rtos/nrf_wifi.git";
    rev = "e35f707a782b7c4c0eb83a3b06ca4e6eb693f29f";
  }
  {
    name = "open-amp";
    path = "modules/lib/open-amp";
    url = "https://github.com/zephyrproject-rtos/open-amp.git";
    rev = "52bb1783521c62c019451cee9b05b8eda9d7425f";
  }
  {
    name = "picolibc";
    path = "modules/lib/picolibc";
    url = "https://github.com/zephyrproject-rtos/picolibc.git";
    rev = "82d62ed1ac55b4e34a12d0390aced2dc9af13fc9";
  }
  {
    name = "uoscore-uedhoc";
    path = "modules/lib/uoscore-uedhoc";
    url = "https://github.com/zephyrproject-rtos/uoscore-uedhoc.git";
    rev = "54abc109c9c0adfd53c70077744c14e454f04f4a";
  }
  {
    name = "zcbor";
    path = "modules/lib/zcbor";
    url = "https://github.com/zephyrproject-rtos/zcbor.git";
    rev = "9b07780aca6fb21f82a241ba386ad9b379809337";
  }
  {
    name = "zmk-studio-messages";
    path = "modules/msgs/zmk-studio-messages";
    url = "https://github.com/zmkfirmware/zmk-studio-messages.git";
    rev = "6cb4c283e76209d59c45fbcb218800cd19e9339d";
  }
  {
    name = "trusted-firmware-a";
    path = "modules/tee/tf-a/trusted-firmware-a";
    url = "https://github.com/zephyrproject-rtos/trusted-firmware-a.git";
    rev = "713ffbf96c5bcbdeab757423f10f73eb304eff07";
  }
  {
    name = "zephyr";
    path = "zephyr";
    url = "https://github.com/zmkfirmware/zephyr.git";
    rev = "ec36516990d40355238db3049bc1709191f99b4e";
  }
  {
    name = "zmk";
    path = "zmk";
    url = "https://github.com/zmkfirmware/zmk.git";
    rev = "6e7e0de2b621073392816b284ab4931bee709ee8";
  }
]
