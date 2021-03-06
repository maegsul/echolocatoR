% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ggbio.R
\name{GGBIO.plot}
\alias{GGBIO.plot}
\title{Multi-track plot of fine-mapping results}
\source{
\url{http://bioconductor.org/packages/release/bioc/vignettes/ggbio/inst/doc/ggbio.pdf}
}
\usage{
GGBIO.plot(
  finemap_dat,
  locus_dir,
  LD_matrix = NULL,
  LD_reference = NULL,
  dataset_type = "GWAS",
  color_r2 = T,
  method_list = c("ABF", "FINEMAP", "SUSIE", "POLYFUN_SUSIE"),
  dot_summary = F,
  QTL_prefixes = NULL,
  mean.PP = T,
  PP_threshold = 0.95,
  consensus_threshold = 2,
  sig_cutoff = 5e-08,
  gene_track = T,
  point_size = 1,
  point_alpha = 0.6,
  snp_group_lines = c("Lead", "UCS", "Consensus"),
  XGR_libnames = c("ENCODE_TFBS_ClusteredV3_CellTypes",
    "ENCODE_DNaseI_ClusteredV3_CellTypes", "Broad_Histone"),
  n_top_xgr = 5,
  Roadmap = F,
  Roadmap_query = NULL,
  n_top_roadmap = 7,
  annot_overlap_threshold = 5,
  Nott_epigenome = F,
  Nott_regulatory_rects = T,
  Nott_show_placseq = T,
  Nott_binwidth = 200,
  Nott_bigwig_dir = NULL,
  save_plot = T,
  show_plot = T,
  max_transcripts = 1,
  plot.zoom = "1x",
  dpi = 300,
  height = 12,
  width = 10,
  nThread = 4,
  verbose = T
)
}
\arguments{
\item{LD_reference}{Which linkage disequilibrium reference panel do you want to use.
Options include:
\describe{
\item{"UKB"}{A pre-caclulated LD reference matrix from a subset of caucasian British individuals from the UK Biobank. See \href{https://www.biorxiv.org/content/10.1101/807792v2}{Wiessbrod et al. (2019)} for more details.}
\item{"1KGphase1"}{Download a subset of the 1000 Genomes Project Phase 1 vcf and calculate LD on the fly with plink.}
\item{"1KGphase3"}{Download a subset of the 1000 Genomes Project Phase 3 vcf and calculate LD on the fly with plink.}
\item{"<path>/*.vcf" or "<path>/*.vcf.gz"}{Alternatively, users can provide their own custom panel by supplying a list of \emph{.vcf} file path (one per locus) which \pkg{echolocatoR} will use to compute LD (using \emph{plink}).}
}}

\item{dataset_type}{The kind dataset you're fine-mapping (e.g. GWAS, eQTL, tQTL).
This will also be used when creating the subdirectory where your results will be stored
(e.g. \emph{Data/<dataset_type>/Kunkle_2019}).}

\item{color_r2}{If an LD_matrix is supplied, color each SNP by its LD with the lead SNP from the GWAS ()}

\item{QTL_prefixes}{Prefixes to the columns that contain QTL data.
For exmaple, P-values for the \emph{Fairfax_2014} QTL study would be
stored in the column \emph{Fairfax_2014.P}.}

\item{PP_threshold}{The minimum fine-mapped posterior probability for a SNP to be considered part of a Credible Set.
For example, \code{PP_threshold=.95} means that all Credible Set SNPs will be 95\% Credible Set SNPs.}

\item{consensus_threshold}{The minimum number of fine-mapping tools that include a SNP
in their 95\% Credible Sets to consider that it a "Consensus SNP" (\emph{default=2}).}

\item{max_transcripts}{Max number of transcripts per gene to show.}

\item{plot.zoom}{Zoom into the center of the locus when plotting (without editing the fine-mapping results file).
You can provide either:
\itemize{
\item{The size of your plot window in terms of basepairs (e.g. \code{plot.zoom=50000} for a 50kb window)}.
\item{How much you want to zoom in (e.g. \code{plot.zoom="1x"} for the full locus, \code{plot.zoom="2x"} for 2x zoom into the center of the locus, etc.)}.
}
You can pass a list of window sizes (e.g. \code{c(50000,100000,500000)}) to automatically generate
multiple views of each locus.
This can even be a mix of different style inputs: e.g. \code{c("1x","4.5x",25000)}.}

\item{verbose}{Whether \pkg{echolocatoR} should be verbose or silent.}
}
\description{
Plots fine-mapping results from \emph{echolocatoR}.
Create separate tracks for the original results (-log10(P))
and each fine-mapping method (Posterior Probability).
Uses \code{\link{ggbio}}.
}
\examples{
\dontrun{
data("BST1"); data("BST1_LD_matrix"); data("locus_dir");
locus_dir <- file.path("~/Desktop",locus_dir)

# Using NO annotations
trk_plot <- GGBIO.plot(finemap_dat=BST1, LD_matrix=BST1_LD_matrix, locus_dir=locus_dir, XGR_libnames=NULL, save_plot=F, color_r2=T)

Using NO annotations (dot plot summary instead of Manhattan plots for each fine-mapping tool)
### WARNING: Currently doesn't align as well due to the summary plot having a differnt x-axis.
trk_plot <- GGBIO.plot(finemap_dat=BST1, LD_matrix=BST1_LD_matrix, locus_dir=locus_dir, method_list=NULL, mean.PP=F, dot_summary=T, XGR_libnames=NULL, save_plot=F)


# Using only XGR annotations
trk_plot <- GGBIO.plot(finemap_dat=BST1, LD_matrix=BST1_LD_matrix, locus_dir=locus_dir, XGR_libnames=c("ENCODE_TFBS_ClusteredV3_CellTypes"), save_plot=F)

# Using only Roadmap annotations
trk_plot <- GGBIO.plot(finemap_dat=BST1, LD_matrix=BST1_LD_matrix, locus_dir=locus_dir, XGR_libnames=NULL, Roadmap=T, Roadmap_query="monocyte", save_plot=F)

# Using only Nott_2019 annotations
trk_plot <- GGBIO.plot(finemap_dat=BST1, LD_matrix=BST1_LD_matrix, locus_dir=locus_dir, Nott_epigenome=T, XGR_libnames=NULL)
}
}
\seealso{
Other plot: 
\code{\link{GGBIO.QTL_track}()},
\code{\link{GGBIO.SNP_track}()},
\code{\link{GGBIO.add_lines}()},
\code{\link{GGBIO.dot_summary}()},
\code{\link{GGBIO.invisible_legend}()},
\code{\link{GGBIO.track_heights_dict}()},
\code{\link{GGBIO.transcript_model_track}()},
\code{\link{get_window_limits}()},
\code{\link{get_window_suffix}()}
}
\concept{plot}
\keyword{internal}
