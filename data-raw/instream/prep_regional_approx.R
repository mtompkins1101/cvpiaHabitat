library(tidyverse)
library(purrr)
library(lubridate)

cvpiaHabitat::modeling_exist %>%
  group_by(Region) %>%
  summarise(n())

# create cache for Upper-mid Sacramento River --------
watersheds_with_modeling <- dplyr::pull(dplyr::filter(cvpiaHabitat::modeling_exist,
                                                      Region == 'Upper-mid Sacramento River',
                                                      FR_fry, Watershed != 'Cottonwood Creek',
                                                      Watershed != 'Upper-mid Sacramento River'), Watershed)

watersheds_without_modeling <- dplyr::pull(dplyr::filter(cvpiaHabitat::modeling_exist,
                                                         Region == 'Upper-mid Sacramento River',
                                                         !FR_juv), Watershed)

watersheds_with_spawn <- dplyr::pull(dplyr::filter(cvpiaHabitat::modeling_exist,
                                                      Region == 'Upper-mid Sacramento River',
                                                      FR_spawn, Watershed != 'Cottonwood Creek',
                                                      Watershed != 'Upper-mid Sacramento River'), Watershed)

# explore flow range of modeling
model_flow_summary <- function(df) {summary(pull(df, flow_cfs))}

model_flow_summary(cvpiaHabitat::battle_creek_instream)
model_flow_summary(cvpiaHabitat::butte_creek_instream)
model_flow_summary(cvpiaHabitat::clear_creek_instream)
model_flow_summary(cvpiaHabitat::cow_creek_instream)


# create list of wua (sq ft/1000 ft) approximators for each watershed in region
get_approx_spwn <- function(df) {approxfun(df$flow_cfs, df$FR_spawn_wua, rule = 2)}
get_approx_fry <- function(df) {approxfun(df$flow_cfs, df$FR_fry_wua, rule = 2)}
get_approx_juv <- function(df) {approxfun(df$flow_cfs, df$FR_juv_wua, rule = 2)}

upmidsac_spwn <- list(get_approx_spwn(cvpiaHabitat::battle_creek_instream),
                     get_approx_spwn(cvpiaHabitat::butte_creek_instream),
                     get_approx_spwn(cvpiaHabitat::clear_creek_instream))

upmidsac_juv <- list(get_approx_juv(cvpiaHabitat::battle_creek_instream),
                     get_approx_juv(cvpiaHabitat::butte_creek_instream),
                     get_approx_juv(cvpiaHabitat::clear_creek_instream),
                     get_approx_juv(cvpiaHabitat::cow_creek_instream))

upmidsac_fry <- list(get_approx_fry(cvpiaHabitat::battle_creek_instream),
                     get_approx_fry(cvpiaHabitat::butte_creek_instream),
                     get_approx_fry(cvpiaHabitat::clear_creek_instream),
                     get_approx_fry(cvpiaHabitat::cow_creek_instream))

cvpiaFlow::flows_cfs %>%
  gather(watershed, flow, -date) %>%
  filter(watershed %in% watersheds_without_modeling, month(date) %in% 1:8) %>%
  group_by(watershed) %>%
  summarise(min = min(flow), median = median(flow), mean = mean(flow),
            q90 = quantile(flow, .9), max = max(flow))

cvpiaFlow::flows_cfs %>%
  gather(watershed, flow, -date) %>%
  filter(watershed %in% watersheds_with_modeling, month(date) %in% 1:8) %>%
  group_by(watershed) %>%
  summarise(min = min(flow), median = median(flow), mean = mean(flow),
            q90 = quantile(flow, .9), max = max(flow))

flows <- cvpiaHabitat::clear_creek_instream$flow_cfs

upper_mid_sac_region_instream <- purrr::map_df(flows, function(flow) {
  wua_spn <- mean(purrr::map_dbl(1:length(upmidsac_spwn), function(i){upmidsac_spwn[[i]](flow)}))
  wua_fry <- mean(purrr::map_dbl(1:length(upmidsac_fry), function(i){upmidsac_fry[[i]](flow)}))
  wua_juv <- mean(purrr::map_dbl(1:length(upmidsac_juv), function(i){upmidsac_juv[[i]](flow)}))
  tibble(flow_cfs = flow, FR_spawn_wua = wua_spn, FR_fry_wua = wua_fry, FR_juv_wua = wua_juv,
         watershed = 'Upper-mid Sacramento River Region')
})

devtools::use_data(upper_mid_sac_region_instream, overwrite = TRUE)

ggplot(upper_mid_sac_region_instream, aes(x = flow, y = mean_wua)) +
  geom_line()

bind_rows(cvpiaHabitat::battle_creek_instream,
     cvpiaHabitat::butte_creek_instream,
     cvpiaHabitat::clear_creek_instream,
     cvpiaHabitat::cow_creek_instream,
     upper_mid_sac_region_instream) %>%
  ggplot(aes(x = flow_cfs, y= FR_fry_wua, color = watershed)) +
  geom_line() +
  theme_minimal()


# the rest-----------
watersheds_without_modeling <- dplyr::pull(dplyr::filter(cvpiaHabitat::modeling_exist,
                                                         Region != 'Upper-mid Sacramento River',
                                                         !FR_juv), Watershed)
cvpiaHabitat::modeling_exist %>%
  filter(Watershed %in% watersheds_without_modeling) %>%
  select(Watershed, Region, FR_fry, FR_juv)

# cosumnes -----
cvpiaHabitat::modeling_exist %>%
  filter(Region == 'South Delta') %>%
  select(Watershed, Region, FR_fry, FR_juv)

cvpiaHabitat::calaveras_river_floodplain
cal_mok_spn <- list(get_approx_spwn(cvpiaHabitat::calaveras_river_instream),
                    get_approx_spwn(cvpiaHabitat::mokelumne_river_instream))

cal_mok_juv <- list(get_approx_juv(cvpiaHabitat::calaveras_river_instream),
                    get_approx_juv(cvpiaHabitat::mokelumne_river_instream))

cal_mok_fry <- list(get_approx_fry(cvpiaHabitat::calaveras_river_instream),
                    get_approx_fry(cvpiaHabitat::mokelumne_river_instream))

flows <- seq(100, 1000, by = 100)

cosumnes_river_instream <- purrr::map_df(flows, function(flow) {
  wua_spn <- mean(purrr::map_dbl(1:length(cal_mok_spn), function(i){cal_mok_spn[[i]](flow)}))
  wua_fry <- mean(purrr::map_dbl(1:length(cal_mok_fry), function(i){cal_mok_fry[[i]](flow)}))
  wua_juv <- mean(purrr::map_dbl(1:length(cal_mok_juv), function(i){cal_mok_juv[[i]](flow)}))
  tibble(flow_cfs = flow, FR_spawn_wua = wua_spn, FR_fry_wua = wua_fry, FR_juv_wua = wua_juv,
         watershed = 'Cosumnes River')
})

devtools::use_data(cosumnes_river_instream)


# san joaq -----
cvpiaHabitat::merced_river_instream$flow_cfs %>% range()
cvpiaHabitat::stanislaus_river_instream$flow_cfs %>% range()
cvpiaHabitat::tuolumne_river_instream$flow_cfs %>% range()

san_joaq_spn <- list(get_approx_spwn(cvpiaHabitat::merced_river_instream),
                     get_approx_spwn(cvpiaHabitat::stanislaus_river_instream),
                     get_approx_spwn(cvpiaHabitat::tuolumne_river_instream))

san_joaq_juv <- list(get_approx_juv(cvpiaHabitat::merced_river_instream),
                     get_approx_juv(cvpiaHabitat::stanislaus_river_instream),
                     get_approx_juv(cvpiaHabitat::tuolumne_river_instream))

san_joaq_fry <- list(get_approx_fry(cvpiaHabitat::merced_river_instream),
                     get_approx_fry(cvpiaHabitat::stanislaus_river_instream),
                     get_approx_fry(cvpiaHabitat::tuolumne_river_instream))

flows <- cvpiaHabitat::stanislaus_river_instream$flow_cfs

san_joaquin_river_instream <- purrr::map_df(flows, function(flow) {
  wua_spn <- mean(purrr::map_dbl(1:length(san_joaq_spn), function(i){san_joaq_spn[[i]](flow)}))
  wua_fry <- mean(purrr::map_dbl(1:length(san_joaq_juv), function(i){san_joaq_juv[[i]](flow)}))
  wua_juv <- mean(purrr::map_dbl(1:length(san_joaq_juv), function(i){san_joaq_juv[[i]](flow)}))
  tibble(flow_cfs = flow, FR_spawn_wua = wua_spn, FR_fry_wua = wua_fry, FR_juv_wua = wua_juv,
         watershed = 'San Joaquin River')
})

bind_rows(cvpiaHabitat::merced_river_instream,
          cvpiaHabitat::stanislaus_river_instream,
          cvpiaHabitat::tuolumne_river_instream,
          san_joaquin_river_instream) %>%
  ggplot(aes(x = flow_cfs, y= FR_spawn_wua, color = watershed)) +
  geom_line() +
  theme_minimal()

devtools::use_data(san_joaquin_river_instream)
