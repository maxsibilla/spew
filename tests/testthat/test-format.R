context("Format functions")

test_that("United States formatting", { 
  # Write all format output to a file 
  sink("format_output.txt")
  
  data(sd_data)
  
  # Check to make sure the merge is of the pop_table 
  # and looking table works and is using the same class 
  sd_data$pop_table <- sd_data$pop_table[, 1:2]  
  fd <- format_data(data_list = sd_data, data_group = "US")
  merged_puma <- fd$pop_table$puma_id
  expect_equal(any(is.na(merged_puma)), FALSE)
  
  sink()
  unlink("format_output.txt")
}) 

test_that("ipums formatting", { 
  # Write all format output to a file 
  sink("format_output.txt")
  
  data(uruguay_data)
  library(stringdist)
  
  # Check that we are getting the accurate level 
  shape_names <- uruguay_data$shapefiles$place_id
  level <- get_level(shape_names, uruguay_data$pop_table)
  expect_equal(level, "level2")
  
  level_indices <- which(uruguay_data$pop_table$level == level)
  count_names <- uruguay_data$pop_table$place_id[level_indices]
  shape_indices <- get_shapefile_indices(shape_names, count_names)

  # Make sure the formatted data is doing the right thing 
  uruguay_format <- format_data(data_list = uruguay_data, data_group = "ipums")
  expect_equal(nrow(uruguay_format$pop_table) == 19, TRUE)
  expect_equal(all(uruguay_format$pop_table$place_id == uruguay_format$pop_table$place_id), TRUE)  

  # Make sure allocate_count is working as expected 
  pseudo_counts <- floor(seq(1, 1000, length = 30))
  new_counts <- allocate_count(counts = pseudo_counts, count_id = 4)
  expect_equal(length(new_counts) < length(pseudo_counts), TRUE)
  expect_equal(new_counts[1] > pseudo_counts[1], TRUE)
  
  # Verify that we can combine counts and remove rows 
  data(uruguay_format)
  pt_combined <- combine_counts(pop_table = uruguay_format$pop_table, "Rocha", "Soriano")
  expect_equal(nrow(pt_combined) == 18, TRUE)  
  expect_equal("Soriano" %in% pt_combined$place_id, FALSE)

  pt_remove <- remove_count(pop_table = uruguay_format$pop_table, place = "Rocha")
  expect_equal(nrow(pt_remove) == 18, TRUE)
  
  sink()
  unlink("format_output.txt")
})
