# Prebuilt msm-5.15 kernel for the LG V60 ThinQ (timelm)

| file | what |
|---|---|
| `Image.gz` | kernel |
| `dtb/kona.dtb` | base DTB (boot image header) |
| `dtbo.img` | the LG board overlays (dtbo partition) |
| `modules/` | vendor modules, loaded from the boot ramdisk |
| `kernel-headers/` | userspace headers (`qti_kernel_headers`, `KERNEL_OBJ/usr`) |

Image.gz, the DTB, dtbo.img and the modules come from one kernel build and
must be updated together (module vermagic, base DTB vs overlays).

`kernel-headers` is the output of `scripts/gen_uapi_headers.py --arch arm`
and `--arch arm64` from the same kernel tree (= `make headers_install` incl.
the techpack driver uapi, scrubbed for bionic), split into `include/`
(identical for both arches), `arm/` and `arm64/` (the rest).
