dbns_container_name <- ".dbns_container"

.onLoad <- function(libname, pkgname) {
  dbns_env <- new.env(parent = emptyenv())
  attach(dbns_env, name = dbns_container_name)
}

.onUnload <- function(libname, pkgname) {
  detach(dbns_container_name, character.only = TRUE)
}
