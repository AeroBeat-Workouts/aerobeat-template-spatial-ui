# Phase 1 Boundary Freeze

This repo is frozen as the **template for concrete AeroBeat spatial UI adapter repos**.

## What this repo is allowed to own

Phase 1 freezes `aerobeat-template-spatial-ui` as the place where downstream spatial adapter repos inherit:

- concrete adapter package structure
- dependency truth pointing to `aerobeat-input-core` as the contract owner
- dependency truth pointing to `aerobeat-spatial-ui-core` as the shared helper-layer owner
- placeholder runtime and configuration scaffolding for future concrete adapters
- docs and tests that make the ownership boundary obvious before real extraction work begins

## What this repo is not allowed to own

This template must not turn into a real adapter implementation and must not redefine the AeroBeat UI interaction contract.

It does **not** own:

- canonical contract event types
- the interaction bus
- event/source/surface/phase taxonomy
- native 2D bridge logic
- shared cross-provider helper-layer ownership
- concrete mouse, touch, or XR runtime behavior

Those concerns stay in their owning repos:

- `aerobeat-input-core` owns the canonical interaction contract and native 2D bridge path
- `aerobeat-spatial-ui-core` owns shared helper scaffolding used by concrete adapter repos
- repos generated from this template own their concrete provider/runtime behavior

## Why placeholder runtime classes exist here

The Phase 1 placeholder runtime classes added to this template are intentionally inert. They exist so downstream repos start from the correct boundary shape instead of the old bootstrap shape.

If future work needs real world-hit logic, projected coordinate mapping, or runtime publish behavior, that work belongs in a concrete adapter repo created from this template rather than in the template itself.
