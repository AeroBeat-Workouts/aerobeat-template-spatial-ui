@tool
extends RefCounted
class_name AeroSpatialUiAdapterTemplateConfig

const EXTRACTION_PHASE := "phase_1_boundary_freeze"
const DEFAULT_TEMPLATE_ROLE := "concrete_spatial_adapter_template"

var contract_owner_package := "aerobeat-input-core"
var shared_helper_owner_package := "aerobeat-spatial-ui-core"
var adapter_examples := PackedStringArray([
	"aerobeat-spatial-ui-mouse",
	"aerobeat-spatial-ui-touch",
	"aerobeat-spatial-ui-xr",
])

func to_boundary_snapshot() -> Dictionary:
	return {
		"template_role": DEFAULT_TEMPLATE_ROLE,
		"contract_owner_package": contract_owner_package,
		"shared_helper_owner_package": shared_helper_owner_package,
		"adapter_examples": adapter_examples,
		"extraction_phase": EXTRACTION_PHASE,
	}
