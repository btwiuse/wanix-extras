# Wanix Extras

Mirror of the Wanix emulator WASM archives. Linux guest images used by
`<wanix-vm>` (the `wanix-linux-*` archives) now ship from the
[`btwiuse/rv64.js`](https://github.com/btwiuse/rv64.js/releases) Releases —
see the **Linux guest images** section below.

## v86

`v86.tgz` mirrors the v86 backend archive built by the upstream
[`copy/v86`](https://github.com/copy/v86) project. It contains the VM
runner WASM, v86 WASM, and BIOS assets required by `<wanix-vm type="v86">`.

Use an immutable jsDelivr URL after choosing a tag (or commit):

```html
<wanix-bind
  dst="#vm/v86"
  type="archive"
  src="https://cdn.jsdelivr.net/gh/btwiuse/wanix-extras@v0.4.0-rc33/v86.tgz"
></wanix-bind>
```

Or fetch the upstream copy directly:

```html
<wanix-bind
  dst="#vm/v86"
  type="archive"
  src="https://cdn.jsdelivr.net/gh/copy/v86@<v86-tag>/v86.tgz"
></wanix-bind>
```

## rv64.js

`rv64.tgz` mirrors the TinyEMU-derived RISC-V 64 emulator WASM and loader
that ship in [`ibuildthecloud/rv64.js`](https://github.com/ibuildthecloud/rv64.js/releases).
It is consumed by `<wanix-vm type="rv64">` the same way v86 uses
`v86.tgz`.

```html
<wanix-bind
  dst="#vm/rv64"
  type="archive"
  src="https://cdn.jsdelivr.net/gh/btwiuse/wanix-extras@v0.4.0-rc33/rv64.tgz"
></wanix-bind>
```

Or fetch the upstream copy directly:

```html
<wanix-bind
  dst="#vm/rv64"
  type="archive"
  src="https://cdn.jsdelivr.net/gh/ibuildthecloud/rv64.js@<rv64.js-tag>/rv64.tgz"
></wanix-bind>
```

## Linux guest images

Linux guest archives (`wanix-linux-<arch>.tgz`,
`wanix-linux-<arch>-container.tgz`, `wanix-linux-<arch>-container-full.tgz`)
are built and published from the
[`btwiuse/rv64.js`](https://github.com/btwiuse/rv64.js) repository. Use
the GitHub Releases URL for the matching tag, for example:

```html
<wanix-bind
  dst="."
  type="archive"
  src="https://github.com/btwiuse/rv64.js/releases/download/wanix-guests-rc33/wanix-linux-rv64.tgz"
></wanix-bind>
<wanix-bind
  dst="#vm/rv64"
  type="archive"
  src="https://cdn.jsdelivr.net/gh/btwiuse/wanix-extras@v0.4.0-rc33/rv64.tgz"
></wanix-bind>
<wanix-vm type="rv64" export="ttyS0" mem="512M" term start></wanix-vm>
```

For browser CORS access on releases larger than 20 MB, use the existing
Cloudflare R2 cache served by the
[`rv64-release-assets`](https://github.com/btwiuse/rv64.js/tree/main/deploy/release-assets-worker)
Worker.
