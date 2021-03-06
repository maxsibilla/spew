% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sample-people.R
\name{sample_households}
\alias{sample_households}
\title{Sample appropriate indices from household PUMS}
\usage{
sample_households(method, n_house, pums_h, pums_p = NULL, puma_id = NULL,
  place_id = NULL, marginals = NULL, do_subset_pums = TRUE)
}
\arguments{
\item{method}{character indicating the method for sampling}

\item{n_house}{numeric indicating the number of households to sample}

\item{pums_h}{dataframe of the households we are sampling from}

\item{puma_id}{vector indicating which specific puma in PUMS we are sampling 
from, if any}

\item{do_subset_pums}{logical.  When we do not need to subset the pums}
}
\value{
numeric with the indicies of the household PUMS to sample
}
\description{
Sample appropriate indices from household PUMS
}

