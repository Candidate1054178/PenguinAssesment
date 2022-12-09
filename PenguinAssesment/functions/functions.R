##functions
#function to clean data 
cleaning1 <- function(data_raw){
  data_raw %>%
    clean_names() %>%
    remove_empty(c("rows", "cols")) %>%
    select(-starts_with("delta")) %>%
    filter(!is.na(body_mass_g),
           !is.na(flipper_length_mm)) %>%
    select(-comments)
}


#function to plot figure 
plot_flipper_output <- function(flipper_mod1) {
  flipper_mod1 %>%
    ggplot(aes(x = body_mass_g, 
               y = flipper_length_mm)) + 
    geom_point(size = 0.8) +
    geom_smooth(method = "lm") +
    labs( x = "Flipper Length (mm)",
          y = "Body Mass (g)",
          title = "Linear Relationship Between Body Mass and Flipper Length") +
    annotate(geom = "text", x = 3000, y = 235, label = "y = 1.53e^-2 + 1.37e^2") +
    theme_light() 
}


#function to save plot as a png
save_as_png <- function(flipper_mod1, 
                                  filename, size, res, scaling){
  agg_png(filename, width   =  size, 
          height  =  size, 
          units   =  "cm", 
          res     =  res, 
          scaling =  scaling)
  flipper_lm_plot <- plot_flipper_output(flipper_mod1)
  print(flipper_lm_plot)
  dev.off()
}




