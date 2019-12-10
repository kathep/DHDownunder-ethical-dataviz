#-----------------------------------------------------------------------------------------------

# ABOUT THIS FILE

# INSTRUCTIONAL ACTIVITY CODE 
# ACTIVITY NAME: Boiler Plate Network Chart (ggnet2 flavored)
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
# install.packages("network")
# install.packages("sna")
# install.packages("GGally")

library(network) #for more, see https://rdrr.io/cran/network/man/network-package.html
library(ggplot2)
library(sna)
library(GGally) #for more, see https://briatte.github.io/ggnet/


#-----------------------------------------------------------------------------------------------

# 2. CALLING THE TABLE & INITIALIZING NETWORK
# The below line 'calls' a table, or data frame (df stands for Data Frame) 

edge_list = read.csv(url("https://github.com/cmchurch/DHSI-ethical-dataviz/raw/master/public_data/sample_network_edges.csv"),header = TRUE, stringsAsFactors = F)
node_list = read.csv(url("https://github.com/cmchurch/DHSI-ethical-dataviz/raw/master/public_data/sample_network_nodes.csv"), header = TRUE, stringsAsFactors = F)

#INITIALIZE NETWORK
net = network(edge_list,node_list,matrix.type="edgelist",directed=FALSE,ignore.eval=FALSE)

#LIST NETWORK ATTRIBUTES
#list.edge.attributes(net)
#list.vertex.attributes(net)



#------------------------------------------------------------------------------------------------

# 3. DRAWING A CHART (NETWORK) & PUTTING DATA INTO IT, AND TELLING R TO MAKE THE CHART

ggnet2(net, 
       mode = "fruchtermanreingold",
       size="degree",
       max_size = 20,
       label=TRUE,
       label.color="orange",
       node.color="black",
       edge.color="gray",
       edge.size="WEIGHT"
       )

