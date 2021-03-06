library(cvpiaHabitat)
context('Upper Sacramento Habitat')

test_that('FR fry Upper Sac works', {

  expect_equal(
    set_instream_habitat(watershed = 'Upper Sacramento River',
                         species = 'fr', life_stage = 'fry',
                         flow = 3000), cvpiaHabitat::upper_sacramento_river_instream[[3, 2]])

  expect_equal(
    set_instream_habitat(watershed = 'Upper Sacramento River',
                         species = 'fr', life_stage = 'fry',
                         flow = 200000), cvpiaHabitat::upper_sacramento_river_instream[[81, 2]])
})

test_that('FR juv Upper Sac works', {

  expect_equal(
    set_instream_habitat(watershed = 'Upper Sacramento River',
                         species = 'fr', life_stage = 'juv',
                         flow = 3000), cvpiaHabitat::upper_sacramento_river_instream[[3, 2]])

  expect_equal(
    set_instream_habitat(watershed = 'Upper Sacramento River',
                         species = 'fr', life_stage = 'juv',
                         flow = 6000), cvpiaHabitat::upper_sacramento_river_instream[[9, 2]])
})

test_that('FR spawn Upper Sac works', {
  wua1 <- cvpiaHabitat::upper_sac_ACID_boards_in$FR_spawn_WUA[1]
  wua2 <- cvpiaHabitat::upper_sac_ACID_boards_out$FR_spawn_WUA[1]
  stream_length <- cvpiaHabitat::watershed_lengths[[1, 5]]

  x1 <- ((stream_length/1000) * wua1)/10.7639
  x2 <- ((stream_length/1000) * wua2)/10.7639

  expect_equal(
    set_spawning_habitat(watershed = 'Upper Sacramento River',
                         species = 'fr', flow = 3250, month = 5), x1)

  expect_equal(
    set_spawning_habitat(watershed = 'Upper Sacramento River',
                         species = 'fr', flow = 3250, month = 2), x2)
})

test_that('ST spawn Upper Sac works', {
  wua1 <- cvpiaHabitat::upper_sac_ACID_boards_in$ST_spawn_WUA[1]
  wua2 <- cvpiaHabitat::upper_sac_ACID_boards_out$ST_spawn_WUA[1]
  stream_length <- cvpiaHabitat::watershed_lengths[[1, 5]]

  x1 <- ((stream_length/1000) * wua1)/10.7639
  x2 <- ((stream_length/1000) * wua2)/10.7639
  expect_equal(
    set_spawning_habitat(watershed = 'Upper Sacramento River',
                         species = 'st', flow = 3250, month = 5), x1)

  expect_equal(
    set_spawning_habitat(watershed = 'Upper Sacramento River',
                         species = 'st', flow = 3250, month = 2), x2)
})

test_that('FR floodplain Upper Sac works', {
  expect_equal(
    set_floodplain_habitat('Upper Sacramento River', 'fr', 4000),
    cvpiaHabitat::upper_sacramento_river_floodplain[[5, 2]],
    tolerance = .01)
})

test_that('SR floodplain Upper Sac works', {
  expect_equal(
    set_floodplain_habitat('Upper Sacramento River', 'sr', 4000),
    cvpiaHabitat::upper_sacramento_river_floodplain[[5, 2]],
    tolerance = .01)
})
