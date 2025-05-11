library(quarto)

all_species <- unique(palmerpenguins::penguins$species)

for (selected_species in all_species) {
  quarto::quarto_render(
   input = "report.qmd",
   execute_params = list(species = selected_species),
   output_file = glue::glue("report_{selected_species}.html")
  )
}