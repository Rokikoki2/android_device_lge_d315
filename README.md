# LG F70 D315 — LineageOS 14.1 device source

Unofficial LineageOS 14.1 (Android 7.1) port source for LG F70 D315 (msm8226).
This repository contains ONLY files that can be freely published. Proprietary LG
binaries are NOT included.

## What is here

- `device/lge/d315/` — device tree (BoardConfig, overlays, init, rootdir, releasetools).
- `kernel/configs/f70_lineage_defconfig` — kernel config used for the build.
- `kernel/dts/` — F70N / D315 device tree sources (DTS/DTSI).
- `kernel/lge/` — LGE board files used by the kernel build.
- `vendor/lge/d315/` — vendor makefiles and `proprietary-blobs.txt` (list only).

## Base sources (upstream)

Kernel sources used (F70 / D315 DTS and drivers live here):

- https://github.com/Vangreen/android_kernel_lge_msm8226 (master, `ac919376a054e18ff3370d4c1e42d569b57a3aa8`)
- https://github.com/LineageOS/android_kernel_lge_msm8226 (f70-port, `bf756279493c2cc4656b784afa29822b30838e98`)
- https://github.com/hunter3k/android_kernel_lge_d315 (kitkat, `1a74cc8537f01947f163e3b82bb93bab5744f1db`)

Device trees used as a base:

- https://github.com/LineageOS/android_device_lge_g2m (cm-14.1, `0e2063df586334529b35d2c668c834730b2a0cd0`)
- https://github.com/LineageOS/android_device_lge_msm8226-common (cm-14.1, `6ae37442eb9a32a565de8d72a1f23f5c8ef9c987`)

## Required proprietary blobs

The files listed in `vendor/lge/d315/proprietary-blobs.txt` are NOT included.
Extract them from an LG F70 D315 stock ROM (Android 4.4.2, tested on firmware v10m)
into `vendor/lge/d315/proprietary/` with `extract_files.py` from TheMuppets,
or copy them from an existing device with `adb pull`.

## Build

1. Initialize LineageOS 14.1 (cm-14.1) tree.
2. Put this repo at `device/lge/d315` (device tree) and the vendor makefiles at
   `vendor/lge/d315` (or use a local manifest that merges them).
3. Put the kernel source at `kernel/lge/msm8226`; copy the provided
   `kernel/configs/f70_lineage_defconfig` into `arch/arm/configs/`,
   the `kernel/dts/` files into `arch/arm/boot/dts/`, and the
   `kernel/lge/` files into `arch/arm/mach-msm/lge/`.
4. Extract proprietary blobs as described above.
5. `source build/envsetup.sh && lunch lineage_d315-userdebug && mka bacon`.

Tested on firmware v10m. Aboot patch is NOT required to flash this ROM once
the bootloader is unlocked; no aboot patch is included or required here.
