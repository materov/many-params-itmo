library(quarto)

all_species <- unique(palmerpenguins::penguins$species)

for (selected_species in all_species) {
  quarto::quarto_render(
   input = "recording.qmd",
   # cache_refresh = TRUE,
   execute_params = list(species = selected_species),
   output_file = glue::glue("report_{selected_species}.html")
  )
  fs::dir_create(selected_species)
  fs::dir_copy(
    "recording_files",
    fs::path(selected_species, "recording_files")
  )
  fs::file_move(
    glue::glue("report_{selected_species}.html"),
    fs::path(
      selected_species,
      glue::glue("report_{selected_species}.html")
    )
  )
}