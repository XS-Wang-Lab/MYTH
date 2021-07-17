#' @title MYTH
#'
#' @description
#' \code{MYTH} A novel algorithm to score Methylation-Yielding Tumor Heterogeneity.
#'
#' @details
#' This function calculates the ITH score in a bulk tumor based on the variations of gene methylation levels.
#'
#' @param input_data_met A dataframe or matrix containing gene methylation profiles (beta-values) in tumors, in which the row name is gene symbol or Entrez gene ID and the column name is tumor sample ID.
#' @export
#' @return A dataframe with 2 columns:
#' \item{Sample}{Tumor samples to be calculated.}
#' \item{MYTH_score}{The MYTH score of each sample.}
#' @author Lin Li <cpu_lilin@@126.com>, Xiaosheng Wang <xiaosheng.wang@@cpu.edu.cn>, Qian Liu <qian.liu@stu.cpu.edu.cn>
#' @examples
#' path <- system.file("extdata", "example_MYTH.txt", package = "MYTH", mustWork = TRUE)
#' input_data_met <- read.table(path, stringsAsFactors = FALSE, sep = "\t", header = TRUE, quote = "", row.names = 1)
#' MYTH(input_data_met)


MYTH <- function (input_data_met) {

	# Check arguments ------------------------------------------------------------
	if (missing(input_data_met) || !class(input_data_met) %in% c("matrix", "data.frame"))
		stop("'input_data_met' is missing or incorrect")

	# MYTH ------------------------------------------------------------
	input_data_met_adjust <- (input_data_met - rowMeans(input_data_met))^2
	MYTH0 <- apply(input_data_met_adjust, 2, sd, na.rm = TRUE)
	MYTH <- data.frame(Sample = names(MYTH0), MYTH_score = MYTH0, row.names = NULL)
	return(MYTH)
}


