## Introduction to ggplot 


## Set working directory 
setwd("slgora/Box/gg_plot_lesson")

# Install packages 
library(ggplot2)

# Load data
data("midwest", package = "ggplot2")

# Other ways to read in datasets
# midwest <- read.csv("http://goo.gl/G1K41K") 

#View data
View(midwest)
head(midwest)
attributes(midwest)
colnames(midwest)

# Setup options
# turn off scientific notation like 1e+06
options(scipen=999)

# Need help with ggplot?
?ggplot2


# Using Ggplot
# area and poptotal are columns in 'midwest' dataset
ggplot(midwest, aes(x=area, y=poptotal))


#Make a basic Scatterplot
ggplot(midwest, aes(x=area, y=poptotal)) + geom_point()

#Save your basic ggplot 
# set se=FALSE to turnoff confidence bands
g <- ggplot(midwest, aes(x=area, y=poptotal)) + geom_point() + geom_smooth(method="lm")
plot(g)

#Zoom in, without deleting points outside of this range
g1 <- g + coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000))
plot(g1)

#Change axis Labels using ggtitle
g1 + ggtitle("Area Vs Population", subtitle="From midwest dataset") + xlab("Area") + ylab("Population")

#Code for basic expanded plot with line of best fit (lm= linear model) and zoomed in
ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point() + 
  geom_smooth(method="lm") + 
  coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", subtitle="From midwest dataset", y="Population", x="Area", caption="Midwest Demographics")

#Change color of points 
g1 + geom_point(col="steelblue", size=3)

# Change size of points
g1 + geom_smooth(method="lm", col="firebrick")

#Full function 
ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point() + 
  geom_smooth(method="lm") + 
  coord_cartesian(xlim=c(0,0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", 
       subtitle="From midwest dataset", 
       y="Population", x="Area", 
       caption="Midwest Demographics")

# Change the color of line
ggplot(midwest, aes(x=area, y=poptotal)) + 
  geom_point(col="steelblue", size=3) + 
  geom_smooth(method="lm", col="firebrick") +  
  coord_cartesian(xlim=c(0, 0.1), ylim=c(0, 1000000)) + 
  labs(title="Area Vs Population", 
       subtitle="From midwest dataset", 
       y="Population", x="Area", 
       caption="Midwest Demographics")

#How to save Figure
#export as image or save to PDF

