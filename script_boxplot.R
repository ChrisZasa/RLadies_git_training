
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
  ggplot(aes(x=bin, y=price) ) +
    geom_boxplot(fill="#69b3a2") +
    #theme_ipsum() +
    theme_classic() +
    xlab("Carat")

p


#Radar chart
library(fmsb)

# Create data: note in High school for several students
set.seed(99)
data <- as.data.frame(matrix( sample( 0:20 , 15 , replace=F) , ncol=5))
colnames(data) <- c("math" , "english" , "biology" , "music" , "R-coding" )
rownames(data) <- paste("mister" , letters[1:3] , sep="-")

# To use the fmsb package, I have to add 2 lines to the dataframe: the max and min of each variable to show on the plot!
data <- rbind(rep(20,5) , rep(0,5) , data)

# plot with default options:
radarchart(data)
