# Licenses

This repo mixes files from several upstreams, so no single license covers everything.

| Path | License |
| --- | --- |
| `device/lge/d315/` (makefiles, overlays, rootdir, releasetools) | Apache License 2.0 — see `LICENSE` |
| `device/lge/d315/init/init_d315.cpp` | 3-clause BSD (header in the file, from The Linux Foundation) |
| `kernel/` (config, DTS, board files) | GNU GPL v2 or later — see `kernel/COPYING` |
| `vendor/lge/d315/` makefiles and the blob list | Apache License 2.0 — see `LICENSE` |
| Proprietary LG binaries | NOT INCLUDED. Extract them from an LG-licensed stock ROM. |

Upstream licenses are preserved in the files themselves where present. If a file
has its own license header, that header takes precedence over the table above.

The kernel source bases are listed in `README.md`. Their original `COPYING`
files are included as `kernel/COPYING`.
