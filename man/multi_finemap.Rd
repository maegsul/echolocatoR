% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/multi_finemap.R
\name{multi_finemap}
\alias{multi_finemap}
\title{Fine-map using multiple fine-mapping tools}
\usage{
multi_finemap(
  locus_dir,
  fullSS_path,
  finemap_method_list,
  subset_DT,
  dataset_type,
  LD_matrix = NULL,
  n_causal = 5,
  sample_size = NULL,
  PAINTOR_QTL_datasets = NULL,
  PP_threshold = 0.95,
  case_control = T,
  verbose = T,
  nThread = 4,
  conda_env = "echoR"
)
}
\arguments{
\item{fullSS_path}{Path to the full summary statistics file (GWAS or QTL) that you want to fine-map.
It is usually best to provide the absolute path rather than the relative path.}

\item{dataset_type}{The kind dataset you're fine-mapping (e.g. GWAS, eQTL, tQTL).
This will also be used when creating the subdirectory where your results will be stored
(e.g. \emph{Data/<dataset_type>/Kunkle_2019}).}

\item{n_causal}{The maximum number of potential causal SNPs per locus.
This parameter is used somewhat differntly by different fine-mapping tools.
See tool-specific functions for details.}

\item{sample_size}{The overall sample size of the study.
If none is given, and \strong{N_cases} and \strong{N_controls} columns are present,
then sample_size is inferred to be:  \code{max(N_cases) + max(N_controls)}.}

\item{PAINTOR_QTL_datasets}{A list of QTL datasets to be used when conducting joint functional fine-mapping with \emph{PAINTOR}.}

\item{PP_threshold}{The minimum fine-mapped posterior probability for a SNP to be considered part of a Credible Set.
For example, \code{PP_threshold=.95} means that all Credible Set SNPs will be 95\% Credible Set SNPs.}

\item{verbose}{Whether \pkg{echolocatoR} should be verbose or silent.}

\item{conda_env}{The name of a conda environment to use.}
}
\description{
Fine-mapping will be repeated on the same locus using each of the tools in \code{finemap_method_list}.
Then, all results will be merged into the locus-specific multi-finemap file,
along with the original per-SNP GWAS/QTL summary statistics.
Each tools will have the following columns:
\describe{
 \item{<tool>.PP}{The posterior probability (PP) of a SNP being causal for the trait. Though this is a generalization and the exact meaning of PP will differ by tools (e.g. Posterior Inclusion Probability for SUSIE).}
 \item{<tool>.CS}{Which credible set the SNP is part of (within a locus). If \code{=0}, then the SNP was not part of any credible set. Some tools only produce one credible set per locus.}
}
}
\examples{
\dontrun{
data("BST1"); data("BST1_LD_matrix");
subset_DT <- BST1
finemap_method_list <- c("ABF","SUSIE")
}
}
\seealso{
Other finemapping functions: 
\code{\link{find_consensus_SNPs}()}
}
\concept{finemapping functions}
\keyword{internal}
