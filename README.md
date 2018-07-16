<!-- README.md is generated from README.Rmd. Please edit that file -->
dbns
====

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis-CI Build
Status](https://travis-ci.org/mdlincoln/dbns.svg?branch=master)](https://travis-ci.org/mdlincoln/dbns)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/mdlincoln/dbns?branch=master&svg=true)](https://ci.appveyor.com/project/mdlincoln/dbns)
[![Coverage
Status](https://img.shields.io/codecov/c/github/mdlincoln/dbns/master.svg)](https://codecov.io/github/mdlincoln/dbns?branch=master)

dbns creates a DataBase NameSpace, adding all the tables available from
a given database connection into a namespace as `tbl` objects ready to
be manipulated by
[dplyr](https://cran.r-project.org/web/packages/dplyr/index.html).

Example
-------

``` r
library(dbns)
library(DBI)
db <- dbConnect(RSQLite::SQLite(), system.file("extdata/dbns.sqlite", package = "dbns"))

dbListTables(db)
#> [1] "dbns_iris"   "dbns_mtcars"

attach_database(db, "dbns")
#> Attached 2 tables:
#> - dbns_iris 
#> - dbns_mtcars

dbns_iris
#> # Source:   table<dbns_iris> [?? x 5]
#> # Database: sqlite 3.22.0
#> #   [/Library/Frameworks/R.framework/Versions/3.4/Resources/library/dbns/extdata/dbns.sqlite]
#>    Sepal.Length Sepal.Width Petal.Length Petal.Width Species
#>           <dbl>       <dbl>        <dbl>       <dbl> <chr>  
#>  1          5.1         3.5          1.4         0.2 setosa 
#>  2          4.9         3            1.4         0.2 setosa 
#>  3          4.7         3.2          1.3         0.2 setosa 
#>  4          4.6         3.1          1.5         0.2 setosa 
#>  5          5           3.6          1.4         0.2 setosa 
#>  6          5.4         3.9          1.7         0.4 setosa 
#>  7          4.6         3.4          1.4         0.3 setosa 
#>  8          5           3.4          1.5         0.2 setosa 
#>  9          4.4         2.9          1.4         0.2 setosa 
#> 10          4.9         3.1          1.5         0.1 setosa 
#> # ... with more rows

dbns_mtcars
#> # Source:   table<dbns_mtcars> [?? x 11]
#> # Database: sqlite 3.22.0
#> #   [/Library/Frameworks/R.framework/Versions/3.4/Resources/library/dbns/extdata/dbns.sqlite]
#>      mpg   cyl  disp    hp  drat    wt  qsec    vs    am  gear  carb
#>    <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1  21       6  160    110  3.9   2.62  16.5     0     1     4     4
#>  2  21       6  160    110  3.9   2.88  17.0     0     1     4     4
#>  3  22.8     4  108     93  3.85  2.32  18.6     1     1     4     1
#>  4  21.4     6  258    110  3.08  3.22  19.4     1     0     3     1
#>  5  18.7     8  360    175  3.15  3.44  17.0     0     0     3     2
#>  6  18.1     6  225    105  2.76  3.46  20.2     1     0     3     1
#>  7  14.3     8  360    245  3.21  3.57  15.8     0     0     3     4
#>  8  24.4     4  147.    62  3.69  3.19  20       1     0     4     2
#>  9  22.8     4  141.    95  3.92  3.15  22.9     1     0     4     2
#> 10  19.2     6  168.   123  3.92  3.44  18.3     1     0     4     4
#> # ... with more rows
```

Detach a database namespace when you are done. Note that dbns does not
disconnect the DBI connection.

``` r
detach_database("dbns")
#> dbns detatched

dbDisconnect(db)
```
