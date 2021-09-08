test_that("formulas are appropriately made", {
	skip_on_cran()
	library(targets)
	tar_dir({
		targets::tar_script({
			list(
				tarameters::tar_hypothesis(test, mpg ~ wt)
			)
		})
		out <- tar_manifest()
		print(out)
		tar_make()
		res <- tar_read(test_formulas)
		expect_s3_class(res, "tbl_df")
	})
})
