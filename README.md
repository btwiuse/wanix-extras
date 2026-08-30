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
  src="https://cdn.jsdelivr.net/gh/btwiuse/wanix-extras@v0.4.0-rc3/v86.tgz"
></wanix-bind>
```

Or via npm after `npm publish` (package version tracks the tag):

```html
<wanix-bind
  dst="#vm/v86"
  type="archive"
  src="https://cdn.jsdelivr.net/npm/wanix-extras@0.4.0-rc3/dist/v86.tgz"
></wanix-bind>
```

The archive supports `netdev="wisp,wisps://relay.example.com"` and
`netdev="fetch"`.
