% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Roadmap.R
\name{ROADMAP.query_and_plot}
\alias{ROADMAP.query_and_plot}
\title{Query and plot Roadmap epigenomic annotations}
\usage{
ROADMAP.query_and_plot(
  subset_DT,
  results_path = "./ROADMAP",
  n_top_tissues = NULL,
  keyword_query = NULL,
  adjust = 0.2,
  force_new_query = F,
  remove_tmps = T
)
}
\arguments{
\item{subset_DT}{Data.frame with at least the following columns:
\describe{
\item{SNP}{SNP RSID}
\item{CHR}{chromosome}
\item{POS}{position}
}}

\item{results_path}{Where to store query results.}

\item{n_top_tissues}{The number of top tissues to include,
sorted by greatest number of rows
(i.e. the number of genomic ranges within the window).}

\item{keyword_query}{Search all columns in the Roadmap annotations metadata
and only query annotations that contain your keywords.
Can provide multiple keywords in list form:
\code{c("placenta","liver","monocytes")}}

\item{force_new_query}{Force a new query from the XGR database.}
}
\value{
A named list containing:
\itemize{
\item{\code{ggbio} plot}
\item{\code{GRanges} object within the queried coordinates}
}
}
\description{
Query and plot Roadmap epigenomic annotations
}
\examples{
data("BST1")
finemap_DT <- BST1
roadmap_plot_query <- ROADMAP.query_and_plot(subset_DT=finemap_DT, keyword_query="monocytes")
}
\seealso{
Other ROADMAP: 
\code{\link{ROADMAP.construct_reference}()},
\code{\link{ROADMAP.merge_and_process_grl}()},
\code{\link{ROADMAP.query}()},
\code{\link{ROADMAP.tabix}()}
}
\concept{ROADMAP}
