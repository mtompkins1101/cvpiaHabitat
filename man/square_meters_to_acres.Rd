% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{square_meters_to_acres}
\alias{square_meters_to_acres}
\title{Square Meters to Acres}
\usage{
square_meters_to_acres(sq_meters)
}
\arguments{
\item{sq_meters}{area in square meters}
}
\description{
Function converts area in square meters to area in acres
}
\examples{
hab_sq_meters <- set_instream_habitat('Merced River', 'fr', 'fry', 425)
square_meters_to_acres(hab_sq_meters)

}
