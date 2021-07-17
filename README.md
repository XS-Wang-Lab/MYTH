# MYTH
A novel algorithm to score Methylation-Yielding Tumor Heterogeneity.

## Description
The package is used to calculate IntraTumor Heterogeneity (ITH) based on alterations of DNA methylation profiles.

## Installation
You can install the released version of **MYTH** with:
```r
if (!requireNamespace("devtools", quietly = TRUE))
    install.packages("devtools")
devtools::install_github("WangX-Lab/MYTH/MYTH")
```

## Examples
```r
library(MYTH)
path <- system.file("extdata", "example_MYTH.txt", package = "MYTH", mustWork = TRUE)
input_data_met <- read.table(path, stringsAsFactors = FALSE, sep = "\t", header = TRUE, quote = "", row.names = 1)
MYTH(input_data_met)
```

