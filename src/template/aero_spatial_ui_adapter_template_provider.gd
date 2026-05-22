@tool
extends RefCounted
class_name AeroSpatialUiAdapterTemplateProvider

const TEMPLATE_ROLE := "concrete_spatial_adapter_template"
const CONTRACT_OWNER_PACKAGE := "aerobeat-input-core"
const SHARED_HELPER_OWNER_PACKAGE := "aerobeat-spatial-ui-core"

func describe_boundary() -> Dictionary:
	return {
		"template_role": TEMPLATE_ROLE,
		"contract_owner_package": CONTRACT_OWNER_PACKAGE,
		"shared_helper_owner_package": SHARED_HELPER_OWNER_PACKAGE,
		"implements_runtime_behavior": false,
		"owns_contract_definition": false,
		"owns_native_2d_bridge": false,
		"owns_shared_helper_layer": false,
	}
