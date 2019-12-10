#-----------------------------------------------------------------------------------------------

# ABOUT THIS FILE

# INSTRUCTIONAL ACTIVITY CODE 
# ACTIVITY NAME: Boiler Plate Network Chart (igraph flavored)
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

# 0. TUTORIAL

# tutorial: http://www.kateto.net/wp-content/uploads/2015/06/Polnet%202015%20Network%20Viz%20Tutorial%20-%20Ognyanova.pdf

#-----------------------------------------------------------------------------------------------

# 1. CALLING THE GRAPHIC LIBRARY

# The below line calls the graphic library ggplot2 and reshape2. 
# If you get an error when running the code, one or more libraries 
# may not be loaded in your instance of R. To make it work, uncomment the line below
# related to the package that gave the error.

# Note: you only need to install the package once, so re-comment the install.packages code
# after it is installed.

# install.packages("igraph")
library(igraph)


#-----------------------------------------------------------------------------------------------

# 2. CALLING THE NETWORK DATA

edge_list = read.csv(url("https://github.com/cmchurch/DHSI-ethical-dataviz/raw/master/public_data/sample_network_edges.csv"),header = TRUE, stringsAsFactors = F)
node_list = read.csv(url("https://github.com/cmchurch/DHSI-ethical-dataviz/raw/master/public_data/sample_network_nodes.csv"), header = TRUE, stringsAsFactors = F)


#------------------------------------------------------------------------------------------------

# 3. DRAWING A CHART (NETWORK) & PUTTING DATA INTO IT

# giving the future blank chart a name 'net'
net <- graph.data.frame(edge_list, node_list, directed=T)

#calculate the network degree
deg <- degree(net, mode="all")


#------------------------------------------------------------------------------------------------

# 4. SPECIFY NODE ATTRIBUTES

V(net)$size <- deg * 3               #set the size of the vertices to degree (scaled by 3)
V(net)$label <- V(net)$vertex.names  #set the label to the vertex.names column

#------------------------------------------------------------------------------------------------

# 5. SPECIFY EDGE ATTRIBUTES

E(net)$arrow.size <- .2              #set the arrow size
E(net)$edge.color <- "gray80"        #set the edge color  
E(net)$width <- E(net)$WEIGHT        #set the edge weight


#------------------------------------------------------------------------------------------------

# 6. TELLING R TO DRAW EVERYTHING YOU JUST SPECIFIED

plot(net,
     edge.arrow.size=.4,
     layout=layout.fruchterman.reingold)