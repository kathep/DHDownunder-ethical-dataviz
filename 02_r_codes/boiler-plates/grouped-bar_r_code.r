#-----------------------------------------------------------------------------------------------

# ABOUT THIS FILE

# INSTRUCTIONAL ACTIVITY CODE 
# ACTIVITY NAME: Boiler Plate Grouped Bar Chart
# COPYRIGHT: CC-BY-NC
# PREPARED FOR COURSE: Ethical Data Visualization: Taming Treacherous Data
# HELD AT EVENT: DHDownunder
# LOCATION OF EVENT: University of Newcastle, AUSTRALIA
# AUTHORS: 
# Christopher Church (http://christophermchurch.com/) / Katherine Hepworth (https://kathep.com)

#-----------------------------------------------------------------------------------------------

# INSTRUCTIONS

# Any line starting with '#' is a comment. This is code that provides you with information, 
# but does not tell R to do anything. To change the appearance of the plot, read comments,
# and change text below.


#-----------------------------------------------------------------------------------------------

# 1. CALLING THE GRAPHIC LIBRARY

# The below line calls the graphic library ggplot2 and reshape2. 
# ggplot2 is the standard charting library for use in R.
# If you get an error when running the code, one or more libraries 
# may not be loaded in your instance of R. To make it work, uncomment the line below
# related to the package that gave the error.

# Note: you only need to install the package once, so re-comment the install.packages code
# after it is installed.

# install.packages("ggplot2")
# install.packages("reshape2")

library(ggplot2)
library(reshape2)

#-----------------------------------------------------------------------------------------------

# 2. CALLING THE TABLE

# The below line 'calls' a table, or data frame (df stands for Data Frame) 
# sourced from MONROE WORK TODAY.

password=""
lynchings = read.csv(url(paste("http://aLHuyQ6cqrYLMP2F:",password,"@files.ndadlab.org/MWT/MWT_dataset_compilation_v1_0_ChurchHepworth.csv",sep="")))

agg = dcast(lynchings, mwt_race ~ sex)

agg_reshaped <- melt(agg, id.vars='mwt_race')


#------------------------------------------------------------------------------------------------

# 3. DRAWING A CHART (GROUPED BAR) & PUTTING DATA INTO IT

# giving the future blank chart a name 'g', and calling ggplot
g = g + geom_bar(aes(fill=variable),
                 stat="identity",
                 width = 0.4, 
                 position = position_dodge(width=0.5))


#------------------------------------------------------------------------------------------------

# 4. SELECTING SPECIFIC DATA FROM THE CSV TABLE TO REPRESENT IN YOUR FUTURE CHART

# The below line specifies which column appears on the x axis.
g <- ggplot(agg_reshaped,aes(x=mwt_race,y=value))


#------------------------------------------------------------------------------------------------

# 5. ADDING THE TEXT LABELS

g = g + 
  labs(
    title="Add title here",
    subtitle="Add subtitle here",
    caption="Add caption here"
  )
g = g + 
  xlab("X axis label")+
  ylab("Y Axis label")

#------------------------------------------------------------------------------------------------

# 6. TELLING R TO DRAW EVERYTHING YOU JUST SPECIFIED

# the final 'g' runs the plot
g
