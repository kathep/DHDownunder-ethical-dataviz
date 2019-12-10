#-----------------------------------------------------------------------------------------------

# ABOUT THIS FILE

# INSTRUCTIONAL ACTIVITY CODE 
# ACTIVITY NAME: Boiler Plate Scatter Plot
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

# The below line calls the graphic library ggplot2. 
# This is the standard charting library for use in R.

library(ggplot2)


#-----------------------------------------------------------------------------------------------

# 2. CALLING THE TABLE
# The below line 'calls' a table, or data frame (df stands for Data Frame) 
# sourced from the FLORIDA DEPARTMENT OF LAW ENFORCEMENT.

df <- read.csv("https://github.com/cmchurch/DHSI-ethical-dataviz/raw/master/public_data/gun-deaths_florida_full_1971-2016.csv",header=T,stringsAsFactors = F,as.is=T)


#------------------------------------------------------------------------------------------------

# 3. DRAWING A CHART (EITHER LINE OR BAR) & PUTTING DATA INTO IT

# giving the future blank chart a name 'g', and calling ggplot and the table
g <- ggplot(df)


#------------------------------------------------------------------------------------------------

# 4. SELECTING SPECIFIC DATA FROM THE CSV TABLE TO REPRESENT IN YOUR FUTURE CHART

# The below lines specify data appearing in scatter points.
g = g + geom_point(aes(x=df$Year,y=df$Total_by_Firearm),color="black")

# The below lines specify which column appears on the x and y axes.
g = g + geom_line(aes(x=df$Year,y=df$Total_by_Firearm),color="black")

# The below lines specify the color fills and opacity of data.
g = g + geom_ribbon(aes(x=df$Year,ymin=0,ymax=df$Total_by_Firearm),fill="gray",alpha=0.8)


#------------------------------------------------------------------------------------------------

# 5. ADDING THE TEXT LABELS

g = g + labs(
  title="Add title here",
  subtitle="Add subtitle here",
  caption="Add caption here")

g = g + xlab("X axis label")+
    ylab("Y Axis label")


#------------------------------------------------------------------------------------------------

# 6. TELLING R TO DRAW EVERYTHING YOU JUST SPECIFIED

# the final 'g' runs the plot
g