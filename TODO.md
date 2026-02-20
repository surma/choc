# TODO

## Unpin ZMK version in `config/west.yml`

`config/west.yml` is currently pinned to ZMK commit `6e7e0de` instead of `main`
because ZMK PR [#3145](https://github.com/zmkfirmware/zmk/pull/3145) (merged
2026-02-12) introduced a duplicate `pillbug` board definition that breaks the
CMake build with:

```
ERROR: Board(s): {'pillbug'}, defined multiple times.
```

Once ZMK merges a fix for this, update the revision back to `main` (or a newer
pinned commit):

```yaml
# config/west.yml
- name: zmk
  remote: zmkfirmware
  revision: main   # was: 6e7e0de2b621073392816b284ab4931bee709ee8
  import: app/west.yml
```

Track upstream progress at: https://github.com/zmkfirmware/zmk/issues
