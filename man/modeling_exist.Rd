% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{modeling_exist}
\alias{modeling_exist}
\title{Habitat Modeling Status}
\format{dataframe with 33 rows and 15 variables
\describe{
\item{Order}{integer value representing watershed order in SIT model}
\item{Watershed}{name of watershed}
\item{FR_spawn}{TRUE if spawning habitat modeling exists for Fall Run}
\item{FR_fry}{TRUE if fry rearing habitat modeling exists for Fall Run}
\item{FR_juv}{TRUE if juvenile rearing habitat modeling exists for Fall Run}
\item{FR_floodplain}{TRUE if floodplain rearing modeling exists for Fall Run}
\item{SR_spawn}{TRUE if spawning habitat modeling exists for Spring Run}
\item{SR_fry}{TRUE if fry rearing habitat modeling exists for Spring Run}
\item{SR_juv}{TRUE if juvenile rearing habitat modeling exists for Spring Run}
\item{SR_floodplain}{TRUE if floodplain rearing modeling exists for Spring Run}
\item{ST_spawn}{TRUE if spawning habitat modeling exists for Steelhead}
\item{ST_fry}{TRUE if fry rearing habitat modeling exists for Steelhead}
\item{ST_juv}{TRUE if juvenile rearing habitat modeling exists for Steelhead}
\item{ST_floodplain}{TRUE if floodplain rearing modeling exists for Steelhead}
\item{Region}{Regional grouping of watersheds used for estimating values for watersheds without modeling}
\item{UseRearRegionApprox}{boolean flag for set_habitat functions, TRUE denotes no rearing modeling exists for watershed}
\item{UseSpawnRegionApprox}{boolean flag for set_habitat functions, TRUE denotes no spawning modeling exists for watershed}
\item{UseFloodplainRegionApprox}{boolean flag for set_habitat functions, TRUE denotes no floodplain rearing modeling exists for watershed}
}}
\source{
Sadie Gill \email{sgill@flowwest.com}
}
\usage{
modeling_exist
}
\description{
A table lifestage, species, and watershed
}
\details{
This table was compiled from information provided by Mark Gard \email{mark_gard@fws.gov}.
Used as look up table for \code{\link{set_spawning_habitat}},
\code{\link{set_instream_habitat}}, and \code{\link{set_floodplain_habitat}}
}
\examples{
modeling_exist

}
\keyword{datasets}
