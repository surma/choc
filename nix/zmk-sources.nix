# Generated from config/west.yml, ZMK v0.3 app/west.yml, and Zephyr west.yml.
# Mirrors the GitHub Actions workspace layout without running `west update` during the Nix build.
[
  { name = "acpica"; path = "modules/lib/acpica"; url = "https://github.com/zephyrproject-rtos/acpica.git"; rev = "0333c2af13179f9b33d495cf7cb9a509f751cbb1"; }
  { name = "bsim"; path = "tools/bsim"; url = "https://github.com/zephyrproject-rtos/babblesim-manifest"; rev = "384a091445c57b44ac8cbd18ebd245b47c71db94"; }
  { name = "babblesim_base"; path = "tools/bsim/components"; url = "https://github.com/BabbleSim/base.git"; rev = "19d62424c0802c6c9fc15528febe666e40f372a1"; }
  { name = "babblesim_ext_2G4_libPhyComv1"; path = "tools/bsim/components/ext_2G4_libPhyComv1"; url = "https://github.com/BabbleSim/ext_2G4_libPhyComv1.git"; rev = "9018113a362fa6c9e8f4b9cab9e5a8f12cc46b94"; }
  { name = "babblesim_ext_2G4_phy_v1"; path = "tools/bsim/components/ext_2G4_phy_v1"; url = "https://github.com/BabbleSim/ext_2G4_phy_v1.git"; rev = "d47c6dd90035b41b14f6921785ccb7b8484868e2"; }
  { name = "babblesim_ext_2G4_channel_NtNcable"; path = "tools/bsim/components/ext_2G4_channel_NtNcable"; url = "https://github.com/BabbleSim/ext_2G4_channel_NtNcable.git"; rev = "20a38c997f507b0aa53817aab3d73a462fff7af1"; }
  { name = "babblesim_ext_2G4_channel_multiatt"; path = "tools/bsim/components/ext_2G4_channel_multiatt"; url = "https://github.com/BabbleSim/ext_2G4_channel_multiatt.git"; rev = "bde72a57384dde7a4310bcf3843469401be93074"; }
  { name = "babblesim_ext_2G4_modem_magic"; path = "tools/bsim/components/ext_2G4_modem_magic"; url = "https://github.com/BabbleSim/ext_2G4_modem_magic.git"; rev = "cb70771794f0bf6f262aa474848611c68ae8f1ed"; }
  { name = "babblesim_ext_2G4_modem_BLE_simple"; path = "tools/bsim/components/ext_2G4_modem_BLE_simple"; url = "https://github.com/BabbleSim/ext_2G4_modem_BLE_simple.git"; rev = "809ab073159c9ab6686c2fea5749b0702e0909f7"; }
  { name = "babblesim_ext_2G4_device_burst_interferer"; path = "tools/bsim/components/ext_2G4_device_burst_interferer"; url = "https://github.com/BabbleSim/ext_2G4_device_burst_interferer.git"; rev = "5b5339351d6e6a2368c686c734dc8b2fc65698fc"; }
  { name = "babblesim_ext_2G4_device_WLAN_actmod"; path = "tools/bsim/components/ext_2G4_device_WLAN_actmod"; url = "https://github.com/BabbleSim/ext_2G4_device_WLAN_actmod.git"; rev = "9cb6d8e72695f6b785e57443f0629a18069d6ce4"; }
  { name = "babblesim_ext_2G4_device_playback"; path = "tools/bsim/components/ext_2G4_device_playback"; url = "https://github.com/BabbleSim/ext_2G4_device_playback.git"; rev = "85c645929cf1ce995d8537107d9dcbd12ed64036"; }
  { name = "babblesim_ext_libCryptov1"; path = "tools/bsim/components/ext_libCryptov1"; url = "https://github.com/BabbleSim/ext_libCryptov1.git"; rev = "eed6d7038e839153e340bd333bc43541cb90ba64"; }
  { name = "canopennode"; path = "modules/lib/canopennode"; url = "https://github.com/zephyrproject-rtos/canopennode.git"; rev = "dec12fa3f0d790cafa8414a4c2930ea71ab72ffd"; }
  { name = "cmsis"; path = "modules/hal/cmsis"; url = "https://github.com/zephyrproject-rtos/cmsis.git"; rev = "5a00331455dd74e31e80efa383a489faea0590e3"; }
  { name = "cmsis-dsp"; path = "modules/lib/cmsis-dsp"; url = "https://github.com/zephyrproject-rtos/cmsis-dsp.git"; rev = "ff7b5fd1ea5f094665c090c343ec44e74dc0b193"; }
  { name = "cmsis-nn"; path = "modules/lib/cmsis-nn"; url = "https://github.com/zephyrproject-rtos/cmsis-nn.git"; rev = "0c8669d81381ccf3b1a01d699f3b68b50134a99f"; }
  { name = "fatfs"; path = "modules/fs/fatfs"; url = "https://github.com/zephyrproject-rtos/fatfs.git"; rev = "427159bf95ea49b7680facffaa29ad506b42709b"; }
  { name = "hal_ambiq"; path = "modules/hal/ambiq"; url = "https://github.com/zephyrproject-rtos/hal_ambiq.git"; rev = "0a7c99325aa73a1ef777501da91c2c6608661e56"; }
  { name = "hal_atmel"; path = "modules/hal/atmel"; url = "https://github.com/zephyrproject-rtos/hal_atmel.git"; rev = "5ab43007eda3f380c125f957f03638d2e8d1144d"; }
  { name = "hal_espressif"; path = "modules/hal/espressif"; url = "https://github.com/zephyrproject-rtos/hal_espressif.git"; rev = "31fc5758f3507f8f0af00b1dea1a0df7af99bfc0"; }
  { name = "hal_ethos_u"; path = "modules/hal/ethos_u"; url = "https://github.com/zephyrproject-rtos/hal_ethos_u.git"; rev = "90ada2ea5681b2a2722a10d2898eac34c2510791"; }
  { name = "hal_gigadevice"; path = "modules/hal/gigadevice"; url = "https://github.com/zephyrproject-rtos/hal_gigadevice.git"; rev = "2994b7dde8b0b0fa9b9c0ccb13474b6a486cddc3"; }
  { name = "hal_intel"; path = "modules/hal/intel"; url = "https://github.com/zephyrproject-rtos/hal_intel.git"; rev = "b3b43d4e3da7ba483611bbbea7ef8af92c69df31"; }
  { name = "hal_nordic"; path = "modules/hal/nordic"; url = "https://github.com/zephyrproject-rtos/hal_nordic.git"; rev = "884c4d61746bc35fbd379c169fc87ddb56c6461d"; }
  { name = "hal_nuvoton"; path = "modules/hal/nuvoton"; url = "https://github.com/zephyrproject-rtos/hal_nuvoton.git"; rev = "3e0a4c4d3328b2f72b164219add19d5308b53cb5"; }
  { name = "hal_quicklogic"; path = "modules/hal/quicklogic"; url = "https://github.com/zephyrproject-rtos/hal_quicklogic"; rev = "b3a66fe6d04d87fd1533a5c8de51d0599fcd08d0"; }
  { name = "hal_renesas"; path = "modules/hal/renesas"; url = "https://github.com/zephyrproject-rtos/hal_renesas.git"; rev = "a6cf2af9140e014fbbc48d2b6deb802231dd369f"; }
  { name = "hal_rpi_pico"; path = "modules/hal/rpi_pico"; url = "https://github.com/zephyrproject-rtos/hal_rpi_pico.git"; rev = "fba7162cc7bee06d0149622bbcaac4e41062d368"; }
  { name = "hal_stm32"; path = "modules/hal/stm32"; url = "https://github.com/zephyrproject-rtos/hal_stm32.git"; rev = "89ef0a3383edebf661073073bcdf6e2836fe90ee"; }
  { name = "hal_telink"; path = "modules/hal/telink"; url = "https://github.com/zephyrproject-rtos/hal_telink.git"; rev = "38573af589173259801ae6c2b34b7d4c9e626746"; }
  { name = "hal_wurthelektronik"; path = "modules/hal/wurthelektronik"; url = "https://github.com/zephyrproject-rtos/hal_wurthelektronik.git"; rev = "24ca9873c3d608fad1fea0431836bc8f144c132e"; }
  { name = "libmetal"; path = "modules/hal/libmetal"; url = "https://github.com/zephyrproject-rtos/libmetal.git"; rev = "b91611a6f47dd29fb24c46e5621e797557f80ec6"; }
  { name = "liblc3"; path = "modules/lib/liblc3"; url = "https://github.com/zephyrproject-rtos/liblc3.git"; rev = "448f3de31f49a838988a162ef1e23a89ddf2d2ed"; }
  { name = "littlefs"; path = "modules/fs/littlefs"; url = "https://github.com/zephyrproject-rtos/littlefs.git"; rev = "ca583fd297ceb48bced3c2548600dc615d67af24"; }
  { name = "lvgl"; path = "modules/lib/gui/lvgl"; url = "https://github.com/zephyrproject-rtos/lvgl.git"; rev = "8a6a2d1d29d17d1e4bdc94c243c146a39d635fdd"; }
  { name = "mbedtls"; path = "modules/crypto/mbedtls"; url = "https://github.com/zephyrproject-rtos/mbedtls.git"; rev = "c38dc78d9a8dcbe43b898cc1171ab33ba3e6fc26"; }
  { name = "mipi-sys-t"; path = "modules/debug/mipi-sys-t"; url = "https://github.com/zephyrproject-rtos/mipi-sys-t.git"; rev = "a819419603a2dfcb47f7f39092e1bc112e45d1ef"; }
  { name = "nrf_hw_models"; path = "modules/bsim_hw_models/nrf_hw_models"; url = "https://github.com/zephyrproject-rtos/nrf_hw_models.git"; rev = "f4595802d32d103718bf50b3d390b7a450895843"; }
  { name = "open-amp"; path = "modules/lib/open-amp"; url = "https://github.com/zephyrproject-rtos/open-amp.git"; rev = "42b7c577714b8f22ce82a901e19c1814af4609a8"; }
  { name = "percepio"; path = "modules/debug/percepio"; url = "https://github.com/zephyrproject-rtos/percepio.git"; rev = "a3728efccc47dd372f40e6313589ca4c5cc7d5e9"; }
  { name = "picolibc"; path = "modules/lib/picolibc"; url = "https://github.com/zephyrproject-rtos/picolibc.git"; rev = "d07c38ff051386f8e09a143ea0a6c1d6d66dd1d8"; }
  { name = "segger"; path = "modules/debug/segger"; url = "https://github.com/zephyrproject-rtos/segger.git"; rev = "9d0191285956cef43daf411edc2f1a7788346def"; }
  { name = "tinycrypt"; path = "modules/crypto/tinycrypt"; url = "https://github.com/zephyrproject-rtos/tinycrypt.git"; rev = "3e9a49d2672ec01435ffbf0d788db6d95ef28de0"; }
  { name = "trusted-firmware-a"; path = "modules/tee/tf-a/trusted-firmware-a"; url = "https://github.com/zephyrproject-rtos/trusted-firmware-a.git"; rev = "421dc050278287839f5c70019bd6aec617f2bbdb"; }
  { name = "uoscore-uedhoc"; path = "modules/lib/uoscore-uedhoc"; url = "https://github.com/zephyrproject-rtos/uoscore-uedhoc.git"; rev = "5fe2cb613bd7e4590bd1b00c2adf181ac0229379"; }
  { name = "zcbor"; path = "modules/lib/zcbor"; url = "https://github.com/zephyrproject-rtos/zcbor.git"; rev = "67fd8bb88d3136738661fa8bb5f9989103f4599e"; }
  { name = "nanopb"; path = "modules/lib/nanopb"; url = "https://github.com/zmkfirmware/nanopb.git"; rev = "8c60555d6277a0360c876bd85d491fc4fb0cd74a"; }
  { name = "zmk-studio-messages"; path = "modules/msgs/zmk-studio-messages"; url = "https://github.com/zmkfirmware/zmk-studio-messages.git"; rev = "6cb4c283e76209d59c45fbcb218800cd19e9339d"; }
  { name = "zephyr"; path = "zephyr"; url = "https://github.com/zmkfirmware/zephyr.git"; rev = "dacab4875df72109b96cc8977547a0dc04875bcd"; }
  { name = "zmk"; path = "zmk"; url = "https://github.com/zmkfirmware/zmk.git"; rev = "5138c6fb14783b756c5a3e61581625c700f3555b"; }
  { name = "zmk-keyboard-toucan"; path = "modules/zmk-keyboard-toucan"; url = "https://github.com/beekeeb/zmk-keyboard-toucan.git"; rev = "7154e0187128e493cd15785a18af1546419d5bb1"; }
  # This fork includes fixes for two Toucan lockups:
  # https://github.com/geeksville/cirque-input-module/pull/4
  # https://github.com/geeksville/cirque-input-module/pull/5
  # Return to the upstream module after both fixes reach its `toucan` branch.
  { name = "cirque-input-module"; path = "cirque-input-module"; url = "https://github.com/kalbasit/cirque-input-module.git"; rev = "c3e1fcfd8f9fba2e1f8f09ed664822870bce61ca"; }
  { name = "zmk-rgbled-widget"; path = "zmk-rgbled-widget"; url = "https://github.com/caksoylar/zmk-rgbled-widget.git"; rev = "8756cb7b8114069fa3c25c6f6c990f24988fceff"; }
]
