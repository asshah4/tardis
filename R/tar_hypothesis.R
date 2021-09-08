#' Create a hypothesis to be tested
#'
#' `tar_hypothesis()` is a shorthand to create a number of related hypothesis
#' that are related, usually built in a causal/epidemiology framework.
#'
#' @details `tar_hypothesis()` is a wrapper function to help create multiple
#'   target models that share a outcome and exposure, with prespecified patterns
#'   for adjustment.
#'
#' @param name Name of target
#'
#' @inheritParams aims::make_formula
#' @inheritParams targets::tar_target
#' @return A list of target objects
#' @importFrom targets tar_target_raw
#' @export
tar_hypothesis <- function(
	name,
	formula,
	combination = "direct",
	...,
	tidy_eval = targets::tar_option_get("tidy_eval"),
	packages = targets::tar_option_get("packages"),
	library = targets::tar_option_get("library"),
	format = targets::tar_option_get("format"),
	error = targets::tar_option_get("error"),
	memory = targets::tar_option_get("memory"),
	garbage_collection = targets::tar_option_get("garbage_collection"),
	deployment = targets::tar_option_get("deployment"),
	priority = targets::tar_option_get("priority"),
	resources = targets::tar_option_get("resources"),
	storage = targets::tar_option_get("storage"),
	retrieval = targets::tar_option_get("retrieval"),
	cue = targets::tar_option_get("cue")
) {
	# Set up for formulas
	targets::tar_assert_inherits(formula, "formula")
	name <- deparse(substitute(name))
	name_formula <- paste0(name, "_formula")
	sym_formula <- as.symbol(name_formula)
	command_formula <- substitute(aims::make_formulas(formula, combination), env = list(formula = sym_formula))

	# Return target factory
	list(
		tar_target_raw(
			name = name_formula,
			command = command_formula,
			packages = packages,
			library = library,
			format = format,
			error = error,
			memory = memory,
			garbage_collection = garbage_collection,
			deployment = deployment,
			priority = priority,
			resources = resources,
			storage = storage,
			retrieval = retrieval,
			cue = cue
		)
	)
}
