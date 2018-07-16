context("attach-database")

test_that("container environment made on load", {
  expect_true(is.environment(as.environment(".dbns_container")))
})

test_that("database tables can be attached", {
  expect_message(ad_res <- attach_database(db, test_db_name), regexp = length(tblnames))
  expect_true(is.environment(as.environment(test_db_name)))
  expect_s3_class(dbns_iris, "tbl")
  expect_s3_class(dbns_mtcars, "tbl")
  expect_equivalent(ad_res, tblnames)
})

test_that("database tables can be detached", {
  detach_database(test_db_name)
  expect_error(as.environment(test_db_name), "no item called")
  expect_error(detach_database("foo"))
})

test_that("database table names can be suppressed", {
  expect_silent(attach_database(db, test_db_name, quiet = TRUE))
  detach_database(test_db_name)
})
