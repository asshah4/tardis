# Sandbox
targets::tar_dir({

	targets::tar_script({
		list(
			tarameters::tar_hypothesis(test, mpg ~ wt)
		)
	})

	targets::tar_make()

})
