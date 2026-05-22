# AeroBeat Spatial UI Adapter Template

This is the official template for creating a **spatial UI adapter** repository within the AeroBeat ecosystem.

A spatial UI adapter turns host-driven world, projected, or hybrid pointer detection into AeroBeat's shared UI interaction contract. Use this template for concrete adapter repos such as desktop mouse, touch, or XR providers that publish into the canonical contract owned by `aerobeat-input-core`.

This template stays intentionally bounded:

- `aerobeat-input-core` remains the canonical owner of the UI interaction contract and bus.
- `aerobeat-spatial-ui-core` remains the shared helper layer for spatial provider infrastructure.
- Repos created from this template should implement a concrete spatial adapter, not redefine the contract.
- Native 2D bridge work belongs in `aerobeat-input-core`, not in repos generated from this template.

## 📋 Repository Details

- **Type:** Spatial UI Adapter Template
- **License:** **Mozilla Public License 2.0 (MPL 2.0)**
- **Current baseline dependencies:**
  - `aerobeat-input-core` (canonical UI interaction contract)
  - `aerobeat-spatial-ui-core` (shared spatial provider helpers)
  - `gut` (repo-local validation)
- **Intended downstream examples:**
  - `aerobeat-spatial-ui-mouse`
  - future `aerobeat-spatial-ui-touch`
  - future `aerobeat-spatial-ui-xr`

## GodotEnv development flow

This repo uses the AeroBeat GodotEnv package convention.

- Canonical dev/test manifest: `.testbed/addons.jsonc`
- Installed dev/test addons: `.testbed/addons/`
- GodotEnv cache: `.testbed/.addons/`
- Hidden workbench project: `.testbed/project.godot`
- Repo-local unit tests: `.testbed/tests/`

The repo root remains the package/published boundary for downstream consumers. Day-to-day development, debugging, and validation happen from the hidden `.testbed/` workbench using the pinned OpenClaw toolchain: Godot `4.6.2 stable standard`.

### Restore dev/test dependencies

From the repo root:

```bash
cd .testbed
godotenv addons install
```

That restores this repo's current dev/test manifest into `.testbed/addons/`.

### Open the workbench

From the repo root:

```bash
godot --editor --path .testbed
```

Use this `.testbed/` project as the canonical direct-development and bugfinding surface for spatial adapter work.

### Import smoke check

From the repo root:

```bash
godot --headless --path .testbed --import
```

### Run unit tests

From the repo root:

```bash
godot --headless --path .testbed --script addons/gut/gut_cmdln.gd \
  -gdir=res://tests \
  -ginclude_subdirs \
  -gexit
```

### Validation notes

- `.testbed/addons.jsonc` is the committed dev/test dependency contract.
- The current template baseline pins the canonical UI interaction contract, the shared spatial helper layer, and GUT.
- Repo-local unit tests live under `.testbed/tests/`.
- The current package shape is consumed from the repo root (`subfolder: "/"`) for downstream installs.
- Repos created from this template should publish concrete spatial-provider behavior without expanding into new contract ownership.
