
#I love boxplots - an example from the R graph gallery

# library
library(ggplot2)
library(dplyr)
#library(hrbrthemes)

# Start with the diamonds dataset, natively available in R:
p <- diamonds %>%
  
  # Add a new column called 'bin': cut the initial 'carat' in bins
  mutate( bin=cut_width(carat, width=0.5, boundary=0) ) %>%
  
  # plot
  ggplot( aes(x=bin, y=price) ) +
    geom_boxplot(fill="#69b3a2") +
    #theme_ipsum() +
    theme_classic() +
    xlab("Carat")
