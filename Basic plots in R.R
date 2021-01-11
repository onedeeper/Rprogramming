#import dplyr package
library(dplyr)
library(ggplot2)

#import data
cancer <- read.csv('/Users/udeshhabaraduwa/Google Drive (u.habaraduwakandambige@tilburguniversity.edu)/Lectures/data.csv')

#Scatter plot of 2 variables in a dataframe
cancer %>% 
  ggplot(aes(x = radius_mean, y = concavity_mean)) + geom_point()

#plot 3 variables in 2 dimensional plot using point coloring
cancer %>%
  ggplot(aes(x = radius_mean, y = concavity_mean, color = diagnosis)) + geom_point()

#Add another categorical variable. Here, 1 indicates the observation has a radius_mean value >= the average (1)
#or less than (0). Remember to store the variable as a factor.
cancer <- cancer %>% mutate(gr_rad_mean = as.factor(ifelse(radius_mean >= mean(radius_mean), 1, 0)))

#Create a stacked bar graph showing the different proportions. Remember to use as.factor on categorical variables
cancer %>%
  ggplot(aes(x = diagnosis, fill = gr_rad_mean)) + geom_bar()

#Create a side-by-side bar graph for the different grous. Rotate the x-axis labels.
cancer %>%
  ggplot(aes(x = diagnosis, fill = gr_rad_mean)) + 
  geom_bar(position = "dodge") +
  theme(axis.text.x = element_text(angle = 90))

#Create a stacked bar graph with proportions instead of the counts. 
cancer %>% 
  ggplot(aes(x = diagnosis, fill = gr_rad_mean)) +
  geom_bar(position = 'fill') +
  ylab("proportion") +
  ggtitle(label = "cats!") +
  #Titles are left alligned by default in GGPLO2, use the line below to center
  #You could update the theme once so you don't have to repeat this line by running:
  #theme_update(plot.title = element_text(hjust = 0.5))
  theme(plot.title = element_text(hjust = 0.5))
