# Wanix Extras

Manifest for Wanix runtime assets. This repository no longer re-publishes
binary archives; consumers should load them directly from their upstream
repositories.

## Emulator archives

| Archive | Upstream repository | Latest tag |
|---|---|---|
| `v86.tgz` | [`copy/v86`](https://github.com/copy/v86) | latest |
| `rv64.tgz` | [`ibuildthecloud/rv64.js`](https://github.com/ibuildthecloud/rv64.js) (TinyEMU WASM + adapter) | latest |

Pin to a concrete tag/commit for production use:

```html
<wanix-bind
  dst="#vm/v86"
  type="archive"
  src="https://cdn.jsdelivr.net/gh/copy/v86@<v86-tag>/v86.tgz"
></wanix-bind>
<wanix-bind
  dst="#vm/rv64"
  type="archive"
  src="https://cdn.jsdelivr.net/gh/ibuildthecloud/rv64.js@<rv64.js-tag>/rv64.tgz"
></wanix-bind>
```

For larger packages, use the
[`btwiuse/rv64.js` release-assets Worker](https://github.com/btwiuse/rv64.js/tree/main/deploy/release-assets-worker)
(CORS/R2 mirror) as needed.

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
```
