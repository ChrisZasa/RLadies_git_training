
#I love boxplots - an example from the R graph gallery

library(tidyverse)

# library
library(ggplot2)
library(dplyr)
library(hrbrthemes)

# Start with the diamonds dataset, natively available in R:
p <- diamonds %>%
  
  # Add a new column called 'bin': cut the initial 'carat' in bins
  mutate( bin=cut_width(carat, width=0.5, boundary=0) ) %>%
  
  # plot
  ggplot(aes(x=bin, y=price) ) +
    geom_boxplot(fill="#69b3a2") +
    theme_ipsum() +
    #theme_classic() +
    xlab("Carat")

p


#Radar chart
library(fmsb)

# Create data: note in High school for several students
set.seed(99)
data <- as.data.frame(matrix( sample( 0:20 , 15 , replace=F) , ncol=5))
colnames(data) <- c("math" , "english" , "biology" , "music" , "R-coding" )
rownames(data) <- paste("mister" , letters[1:3] , sep="-")

# To use the fmsb package, I have to add 2 lines to the dataframe: the max and 
# min of each variable to show on the plot!
data <- rbind(rep(20,5) , rep(0,5) , data)

# plot with default options:
radarchart(data)




##Bubble plot
library(hrbrthemes)
library(viridis)

# The dataset is provided in the gapminder library
library(gapminder)
data <- gapminder %>% filter(year=="2007") %>% dplyr::select(-year)

# Most basic bubble plot
data %>%
  arrange(desc(pop)) %>%
  mutate(country = factor(country, country)) %>%
  ggplot(aes(x=gdpPercap, y=lifeExp, size=pop, fill=continent)) +
  geom_point(alpha=0.5, shape=21, color="black") +
  scale_size(range = c(.1, 24), name="Population (M)") +
  scale_fill_viridis(discrete=TRUE, guide=FALSE, option="A") +
  theme_ipsum() +
  theme(legend.position="bottom") +
  ylab("Life Expectancy") +
  xlab("Gdp per Capita") +
  theme(legend.position = "none")

