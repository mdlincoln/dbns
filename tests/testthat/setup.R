test_db_path <- system.file("extdata/dbns.sqlite", package = "dbns")
db <- DBI::dbConnect(RSQLite::SQLite(), test_db_path)
tblnames <- DBI::dbListTables(db)
test_db_name <- "test.db"
