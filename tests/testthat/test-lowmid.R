library(cvpiaHabitat)
context('Lower-mid Sacramento Habitat')

test_that('FR fry Lower Sac works', {
  expect_equal(
    set_instream_habitat(watershed = 'Lower-mid Sacramento River',
                         species = 'fr', life_stage = 'fry',
                         flow = 4000, flow2 = 3500),
    35.6/58 * cvpiaHabitat::lower_mid_sacramento_river_instream[[5, 2]] +
      22.4/58 * cvpiaHabitat::lower_mid_sacramento_river_instream[[4, 2]])
})

test_that('FR juv Lower-mid Sac works', {

  expect_equal(
    set_instream_habitat(watershed = 'Lower-mid Sacramento River',
                         species = 'fr', life_stage = 'juv',
                         flow = 4000, flow2 = 3500),
    35.6/58 * cvpiaHabitat::lower_mid_sacramento_river_instream[[5, 2]] +
      22.4/58 * cvpiaHabitat::lower_mid_sacramento_river_instream[[4, 2]])

})


test_that('FR floodplain Lower-mid Sac works', {
  expect_equal(
    set_floodplain_habitat('Lower-mid Sacramento River', 'fr', 4000, flow2 = 4500),
    35.6/58 * cvpiaHabitat::lower_mid_sacramento_river_floodplain[[5, 2]] +
      22.4/58 * cvpiaHabitat::lower_mid_sacramento_river_floodplain[[6, 2]],
    tolerance = .01)
})

test_that('SR floodplain Lower-mid Sac works', {
  expect_equal(
    set_floodplain_habitat('Lower-mid Sacramento River', 'sr', 4000, flow2 = 4500),
    35.6/58 * cvpiaHabitat::lower_mid_sacramento_river_floodplain[[5, 2]] +
      22.4/58 * cvpiaHabitat::lower_mid_sacramento_river_floodplain[[6, 2]],
    tolerance = .01)
})
