% Generated by roxygen2 (4.1.0): do not edit by hand
% Please edit documentation in R/download_natality.R
\name{download_natality}
\alias{download_natality}
\title{Download source file from web}
\usage{
download_natality(type)
}
\arguments{
\item{type}{Either ps or us}

\item{year}{The year of the data you want to pull}
}
\description{
Pull the file from the cdc website
}
\details{
Leads to having the file locally
}
\examples{
download_natality('ps')
}

