extends GutTest

const MANIFEST_SCRIPT := preload("res://../src/template/aero_spatial_ui_adapter_template_manifest.gd")
const PROVIDER_TEMPLATE_SCRIPT := preload("res://../src/template/aero_spatial_ui_adapter_template_provider.gd")
const CONFIG_TEMPLATE_SCRIPT := preload("res://../src/template/aero_spatial_ui_adapter_template_config.gd")
const RUNTIME_BOUNDARY_SCRIPT := preload("res://../src/template/aero_spatial_ui_adapter_template_runtime_boundary.gd")
const BOUNDARY_DOC_PATH := "res://../docs/phase-1-boundary-freeze.md"

func before_all():
	gut.p("Starting Spatial UI Template Tests...")

func after_all():
	gut.p("Finished Spatial UI Template Tests.")

func test_plugin_manifest_structure():
	var manifest_path = "res://../plugin.cfg"
	assert_true(FileAccess.file_exists(manifest_path), "plugin.cfg should exist at the repo root")

	var config = ConfigFile.new()
	assert_eq(config.load(manifest_path), OK, "plugin.cfg should load")
	assert_eq(config.get_value("plugin", "name", ""), "AeroBeat Spatial UI Adapter Template", "plugin name should match the template identity")
	assert_eq(
		config.get_value("plugin", "description", ""),
		"Template for concrete AeroBeat spatial UI adapter addons that publish into the shared UI interaction contract.",
		"plugin description should match the template role"
	)

func test_template_manifest_locks_dependency_truth_and_non_ownership():
	var summary := MANIFEST_SCRIPT.ownership_summary()

	assert_eq(summary.get("repo_role"), "template_for_concrete_spatial_adapters")
	assert_eq(summary.get("contract_owner_package"), "aerobeat-input-core")
	assert_eq(summary.get("shared_helper_owner_package"), "aerobeat-spatial-ui-core")
	assert_false(summary.get("ships_concrete_runtime_behavior", true))
	assert_false(summary.get("owns_contract_definition", true))
	assert_false(summary.get("owns_native_2d_bridge", true))
	assert_false(summary.get("owns_shared_helper_layer", true))

func test_template_placeholder_scripts_remain_inert_boundary_scaffolding():
	var provider = PROVIDER_TEMPLATE_SCRIPT.new()
	var config = CONFIG_TEMPLATE_SCRIPT.new()
	var boundary := provider.describe_boundary()
	var snapshot := config.to_boundary_snapshot()

	assert_eq(boundary.get("template_role"), "concrete_spatial_adapter_template")
	assert_eq(boundary.get("contract_owner_package"), "aerobeat-input-core")
	assert_eq(boundary.get("shared_helper_owner_package"), "aerobeat-spatial-ui-core")
	assert_false(boundary.get("implements_runtime_behavior", true))
	assert_false(boundary.get("owns_contract_definition", true))
	assert_false(boundary.get("owns_native_2d_bridge", true))
	assert_false(boundary.get("owns_shared_helper_layer", true))

	assert_eq(snapshot.get("template_role"), "concrete_spatial_adapter_template")
	assert_eq(snapshot.get("extraction_phase"), "phase_1_boundary_freeze")
	assert_eq(snapshot.get("contract_owner_package"), "aerobeat-input-core")
	assert_eq(snapshot.get("shared_helper_owner_package"), "aerobeat-spatial-ui-core")
	assert_true(snapshot.get("adapter_examples", PackedStringArray()).has("aerobeat-spatial-ui-mouse"))

	var non_goals: PackedStringArray = RUNTIME_BOUNDARY_SCRIPT.describe_non_goals()
	assert_true(non_goals.has("no canonical interaction contract types"))
	assert_true(non_goals.has("no native 2D bridge logic"))
	assert_true(non_goals.has("no shared helper-layer ownership"))
	assert_true(non_goals.has("no concrete adapter runtime behavior yet"))

func test_phase_1_boundary_doc_exists_and_states_template_role():
	assert_true(FileAccess.file_exists(BOUNDARY_DOC_PATH), "Phase 1 boundary doc should exist")

	var doc_text := FileAccess.get_file_as_string(BOUNDARY_DOC_PATH)
	assert_string_contains(doc_text, "template for concrete AeroBeat spatial UI adapter repos")
	assert_string_contains(doc_text, "aerobeat-input-core")
	assert_string_contains(doc_text, "aerobeat-spatial-ui-core")
	assert_string_contains(doc_text, "does **not** own")
