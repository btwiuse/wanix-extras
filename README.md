# Wanix Extras

Versioned static runtime assets for Wanix integrations.

## v86

`v86.tgz` is the v86 backend archive built from Wanix commit
`b22ae59 fix: forward terminal resizes to the v86 guest as console resizes`
(guest hvc0 tracks the real panel size and receives SIGWINCH, so stty
size and full-screen apps resize correctly). It contains the VM runner
WASM, v86 WASM, and BIOS assets required by `<wanix-vm type="v86">`.

Use an immutable jsDelivr URL after choosing a tag (or commit):

```html
<wanix-bind
  dst="#vm/v86"
  type="archive"
  src="https://cdn.jsdelivr.net/gh/btwiuse/wanix-extras@v0.4.0-rc5/v86.tgz"
></wanix-bind>
```

Or via npm after `npm publish` (package version tracks the tag):

```html
<wanix-bind
  dst="#vm/v86"
  type="archive"
  src="https://cdn.jsdelivr.net/npm/wanix-extras@0.4.0-rc4/dist/v86.tgz"
></wanix-bind>
```

The archive supports `netdev="wisp,wisps://relay.example.com"` and
`netdev="fetch"`.

## rv64.js

`rv64.tgz` is the RISC-V 64 backend archive built from the rv64.js repo's
`integrations/wanix` (WANIX adapter + TinyEMU-derived RV64 emulator WASM
and loader, pinned to the rv64.js `v0.3.0` release). It is consumed by
`<wanix-vm type="rv64">` the same way v86 uses `v86.tgz`.

`wanix-linux-rv64.tgz` is the RISC-V 64 Linux guest (Alpine) built by
`rv64.js/integrations/wanix` — the raw RISC-V `boot/Image` plus a fully
deployed root filesystem whose init runs a login shell on `/dev/hvc0`
(the interactive virtio console).

Use both together with a `<wanix-vm type="rv64">` element:

```html
<wanix-bind
  dst="."
  type="archive"
  src="https://cdn.jsdelivr.net/gh/btwiuse/wanix-extras@v0.4.0-rc5/wanix-linux-rv64.tgz"
></wanix-bind>
<wanix-bind
  dst="#vm/rv64"
  type="archive"
  src="https://cdn.jsdelivr.net/gh/btwiuse/wanix-extras@v0.4.0-rc5/rv64.tgz"
></wanix-bind>
<wanix-vm type="rv64" export="ttyS0" mem="512M" term start></wanix-vm>
```

The adapter boots `boot/Image` directly and mounts the WANIX namespace as
the guest's `host9p` root, mirroring the copy/v86 device layout: hvc0
(virtio console) is the interactive resizable terminal and the 8250 UART
(ttyS0) carries the WANIX host-export stream. The guest configures
`10.0.2.15` and uses the fetch network backend (CORS fallback to a
hosted relay); see the rv64.js integration README for details.
