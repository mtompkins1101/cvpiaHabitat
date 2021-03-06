% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{san_joaquin_river_instream}
\alias{san_joaquin_river_instream}
\title{San Joaqin River Instream Flow to Habitat Area Relationship}
\format{dataframe with 14 rows and 5 variables:
\describe{
  \item{flow_cfs}{integer flow value in cubic feet per second}
  \item{FR_spawn_wua}{spawning WUA in square feet per 1000 feet}
  \item{FR_fry_wua}{fry (up to 50 mm) WUA in square feet per 1000 feet}
  \item{FR_juv_wua}{juvenile WUA in square feet per 1000 feet}
  \item{watershed}{name of watershed}
}}
\source{
Sadie Gill
}
\usage{
san_joaquin_river_instream
}
\description{
A dataset containing the Weighted Usable Area (WUA) in square feet per 1000 feet
as a function of flow in cubic feet per second
}
\details{
The Lower San Joaquin River instream rearing habitat has not been modeled.
The WUA values were estimated using the mean WUA at each flow from the Merced, Stanislaus,
and Tuolumne Rivers.
}
\examples{
san_joaquin_river_instream

}
\keyword{datasets}
