% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/stat_tests.R
\name{readJoint}
\alias{readJoint}
\title{Read in joint objects from spew generation of IPF tables}
\usage{
readJoint(regionID, joint_folder, householder_vars)
}
\arguments{
\item{joint_folder}{path to marginals}

\item{householder_vars}{currently in c("NP", "HINCP", "RAC1P", "AGEP")}

\item{cur_co}{current county character (3 digits)}
}
\value{
list with each entry as list with data frame for the householder_var along with lookup and type
}
\description{
Read in joint objects from spew generation of IPF tables
}

