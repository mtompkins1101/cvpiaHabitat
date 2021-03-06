% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{sac_floodplain}
\alias{upper_sacramento_river_floodplain}
\alias{upper_mid_sacramento_river_floodplain}
\alias{lower_mid_sacramento_river_floodplain}
\alias{lower_sacramento_river_floodplain}
\title{Mainstem Sacramento River Floodplain Rearing Habitat}
\format{dataframe with 81 rows and 3 variables:
\describe{
  \item{flow_cfs}{integer flow value in cubic feet per second}
  \item{floodplain_sq_meters}{suitable floodplain area in square meters}
  \item{watershed}{name of watershed}
}}
\source{
\href{https://s3-us-west-2.amazonaws.com/cvpiahabitat-r-package/cvpia-sit-model-inputs/HendrixEtAl2014_Winter_Run_Model_Tech_Memo.pdf}{Central Valley Floodplain Evaluation and Delineation (CVFED) HEC-RAS hydraulic model refined for use in the NOAA-NMFS Winter Run Chinook Salmon life cycle model}
}
\usage{
upper_sacramento_river_floodplain

upper_mid_sacramento_river_floodplain

lower_mid_sacramento_river_floodplain

lower_sacramento_river_floodplain
}
\description{
A dataset containing the floodplain habitat area in square meters as a
function of flow in cubic feet per second
}
\section{Fall Run and Steelhead Modeling}{

The entire mapped rearing extent was modeled using Central Valley Floodplain
Evaluation and Delineation (CVFED) HEC-RAS hydraulic model refined for use in the NOAA-NMFS Winter
Run Chinook Salmon life cycle model. The high quality depth and high quality velocity ("Pref11") "BankArea"
result was used as floodplain area. High quality velocities were assumed to be less than or equal to 0.15 meters
per second, and high quality depths were assumed to be between 0.2 meters and 1.5 meters.
}

\section{Model Scaling}{

The study's results were scaled using the proportion of the CVPIA reach with each study reach extent.
}

\section{Upper Sacramento River}{

The CVPIA Upper Sacramento River extends from Keswick to Red Bluff (59.3 mi).
This reach overlaps with two of the study's, Keswick to Battle Creek (28.9 mi) and Battle Creek to
the confluence with the Feather River (186.5 mi).
}

\section{Upper-mid Sacramento River}{

The study's extent is from Battle Creek to the confluence with the Feather River (186.5 mi).
The CVPIA Upper-mid Sacramento River extends from Red Blurr to Wilkins Slough (122.3 mi).
}

\section{Lower-mid Sacramento River}{

The CVPIA Lower-mid Sacramento River extends
from Wilkins Slough to the American River (58.0 mi). This reach overlaps with two of the study's, Battle Creek to
the confluence with the Feather River (186.5 mi) and the confluence with the Feather River to Freeport (33.9 mi).
}

\section{Lower Sacramento River}{

The study's extent is from the confluence with the Feather River to Freeport (33.4 mi). The CVPIA Lower
Sacramento River extends from the confluence with the American River to Freeport (13.7 mi).
}

\examples{
upper_sacramento_river_floodplain

}
\keyword{datasets}
