% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SingleCellMethods.R
\name{getEdges}
\alias{getEdges}
\title{getEdges}
\usage{
getEdges(object)
}
\arguments{
\item{sce}{object of the SingleCellExperiment class.}
}
\value{
A numeric vector containing the bin limits
}
\description{
Retrives the values used to bin expressoin data-
}
\examples{
edges=getEdges(sce)

}
