#' Set spawning habitat area based on watershed, species, life stage and flow.
#'
#' @param watershed one of the watersheds defined for the SIT model
#' @param species one of 'fr' (Fall Run), 'sr' (Spring Run), or 'st' (Steelhead)
#' @param flow a flow value in cubic feet per second used to determine habitat area
#' @return habitat area in square meters
#' @export
set_spawning_habitat <- function(watershed, species, flow) {
  f <- watershed_to_spawning_methods[watershed][[1]](species)

  wua_value <- f(flow)
  area_value <- wua_to_area(wua = wua_value,
                            ws = watershed,
                            sp = "Fall Run Chinook", # this does not change right now
                            ls = "spawning")

  return(area_value)
}

# INTERNALS

spawning_species_error <- function(species) {
  stop(paste0("species '", species,  "' was not found for spawning habitat in this watershed"),
       call. = FALSE)
}

american_river_spawning_approx <- function(species) {
  d <- cvpiaHabitat::american_river_instream

  switch(species,
         "fr" = approxfun(d$flow_cfs, d$FR_spawning, rule = 2),
         "st" = approxfun(d$flow_cfs, d$ST_spawning, rule = 2),
         spawning_species_error(species))
}

battle_creek_spawning_approx <- function(species) {
  d <- cvpiaHabitat::battle_creek_instream

  switch(species,
         "fr" = approxfun(d$flow_cfs, d$spawn_WUA, rule = 2),
         spawning_species_error(species))
}


bear_river_spawning_approx <- function(species) {
  d <- cvpiaHabitat::bear_river_instream

  switch(species,
         "fr" = approxfun(d$flow_cfs, d$spawn_WUA, rule = 2),
         spawning_species_error(species))
}

butte_creek_spawning_approx <- function(species) {
  d <- cvpiaHabitat::butte_creek_instream

  switch(species,
         "fr" = approxfun(d$flow_cfs, d$spawn_WUA, rule = 2),
         spawning_species_error(species))
}

calaveras_river_spawning_approx <- function(species) {
  d <- cvpiaHabitat::calaveras_river_instream

  switch(species,
         "fr" = approxfun(d$flow_cfs, d$spawn_WUA, rule = 2),
         spawning_species_error(species))
}

clear_creek_spawning_approx <- function(species) {
  d <- cvpiaHabitat::clear_creek_instream

  switch(spcies,
         "fr" = approxfun(d$flow_cfs, d$FR_spawning, rule = 2),
         "sr" = approxfun(d$flow_cfs, d$SR_spawning, rule = 2),
         "st" = approxfun(d$flow_cfs, d$ST_spawning, rule = 2),
         spawning_species_error(species))
}

cottonwood_creek_spawning_approx <- function(species) {
  d <- cvpiaHabitat::cottonwood_creek_instream

  switch(species,
         "fr" = approxfun(d$flow_cfs, d$spawn_WUA, rule = 2),
         spawning_species_error(species))
}

cow_creek_spawning_approx <- function(species) {
  function(x) print("no spawning defined in this watershed")
}

feather_river_spawning_approx <- function(species) {
  d <- cvpiaHabitat::feather_river_instream

  switch(species,
         "fr" = approxfun(d$flow_cfs, d$spawn_WUA, rule = 2),
         spawning_species_error(species))
}

lower_sacramneto_spawning_approx <- function(species) {
  # no spawning
}

merced_river_spawning_approx <- function(species) {
  d <- cvpiaHabitat::merced_river_instream

  switch(species,
         "fr" = approxfun(d$flow_cfs, d$spawn_WUA, rule = 2),
         spawning_species_error(species))
}

mokelumne_river_spawning_approx <- function(speices) {
  d <- cvpiaHabitat::mokelumne_river_instream

  switch(species,
         "fr" = approxfun(d$flow_cfs, d$spawn_WUA, rule = 2),
         spawning_species_error(species))
}

north_delta_spawning_approx <- function(species) {
  # no spawning
}

stanislaus_river_spawning_approx <- function(species) {
  d <- cvpiaHabitat::stanislaus_river_instream

  switch(species,
         "fr" = approxfun(d$flow_cfs, d$spawn_WUA, rule =2),
         spawning_species_error(species))
}

tuolumne_river_spawning_approx <- function(species) {
  d <- cvpiaHabitat::tuolumne_river_instream

  switch(species,
         "fr" = approxfun(d$flow_cfs, d$spawn_WUA, rule = 2),
         "sr" = approxfun(d$flow_cfs, d$spawn_WUA, rule = 2),
         "st" = approxfun(d$flow_cfs, d$ST_spawn_WUA, rule = 2),
         spawning_species_error(species))
}

upper_mid_sacramento_spawning_approx <- function(species) {
  # no spawning
}

yuba_river_spawning_approx <- function(species) {
  d <- cvpiaHabitat::yuba_river_instream

  switch(species,
         "fr" = approxfun(d$flow_cfs, d$FR_spawning, rule = 2),
         "sr" = approxfun(d$flow_cfs, d$SR_spawning, rule = 2),
         "st" = approxfun(d$flow_cfs, d$ST_spawning, rule = 2),
         spawning_species_error(species))
}