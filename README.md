# Wanix Extras

Versioned static runtime assets for Wanix integrations.

## v86

`v86.tgz` is the v86 backend archive built from Wanix commit
`680db92 Add v86 Wisp relay networking`. It contains the VM runner WASM,
v86 WASM, and BIOS assets required by `<wanix-vm type="v86">`.

Use an immutable jsDelivr URL after choosing a commit:

```html
<wanix-bind
  dst="#vm/v86"
  type="archive"
  src="https://cdn.jsdelivr.net/gh/btwiuse/wanix-extras@COMMIT/v86.tgz"
></wanix-bind>
```

The archive supports `netdev="wisp,wisps://relay.example.com"` and
`netdev="fetch"`.
