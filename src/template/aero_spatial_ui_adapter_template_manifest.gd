@tool
extends RefCounted
class_name AeroSpatialUiAdapterTemplateManifest

const REPO_ROLE := "template_for_concrete_spatial_adapters"
const CONTRACT_OWNER_PACKAGE := "aerobeat-input-core"
const SHARED_HELPER_OWNER_PACKAGE := "aerobeat-spatial-ui-core"

static func ownership_summary() -> Dictionary:
	return {
		"repo_role": REPO_ROLE,
		"contract_owner_package": CONTRACT_OWNER_PACKAGE,
		"shared_helper_owner_package": SHARED_HELPER_OWNER_PACKAGE,
		"ships_concrete_runtime_behavior": false,
		"owns_contract_definition": false,
		"owns_native_2d_bridge": false,
		"owns_shared_helper_layer": false,
	}
