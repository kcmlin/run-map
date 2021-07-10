#######################################
# Practice Mapping using Statebins
#
# Katherine Schaughency
# 10 July 2021
# ----------------------------------- #
# Reference: 
# https://www.r-bloggers.com/2017/11/statebins-reimagined/
#######################################

# --------------------------------- #
# load R package

library(tidyverse)
library(statebins)
library(RColorBrewer)

# --------------------------------- #
# create a running dataset

# load the dataset that comes with the statebins
# and utilize its labels to create my dataset
data(USArrests)

run.map <- USArrests %>% 
              mutate(state = rownames(USArrests)) %>% 
              select(state) %>% 
              mutate(visit = case_when(state %in% c("Alabama",       
                                                    "Arizona",      
                                                    "Arkansas",      
                                                    "Connecticut",   
                                                    "Florida",       
                                                    "Georgia",       
                                                    "Indiana",       
                                                    "Iowa",
                                                    "Kansas",
                                                    "Louisiana",     
                                                    "Mississippi",   
                                                    "New Hampshire", 
                                                    "New Mexico",    
                                                    "North Dakota",  
                                                    "Oklahoma",      
                                                    "Oregon",        
                                                    "South Dakota",  
                                                    "Tennessee",     
                                                    "Vermont",       
                                                    "Wisconsin") ~ "No",
                                       TRUE ~ "Yes"))

# --------------------------------- #
# display all color palette
display.brewer.all()

# --------------------------------- #
# plot the running map

statebins(run.map, 
          state_col = "state",
          value_col= "visit", 
          name = "Visited", 
          ggplot2_scale_function = scale_fill_manual,
          values = c(No = "lightblue", Yes = "darkblue"),
          state_border_col = "white",
          state_border_size = 2,
          round=TRUE) +
  theme_statebins(legend_position="right")



