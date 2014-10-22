## Load in libraries
library(shiny)
library(ggplot2)
library(dplyr)


## Load in data set
pts <-  read.csv("data/espnWeeklyFantasyPointsClean.csv", header= T, stringsAsFactor=F)

## Select appropriate columns and filter for appropriate rows
pts <- pts %>%
        select(Position, Owner, Week, PTS, S, Flex) %>%
        filter(S == "S")

## The FLEX position can be filled by any RB, WR, or TE, I've overridden each player's
## true position to "Flex" so the plot can show the flex position separately from the others
pts$Position[pts$Flex == "FLEX"] <- "Flex"


shinyServer(function(input, output) {
        
        
 
        output$plot1 <- renderPlot({
                
        ## Construct a data frame based on the input values of weeks and owners
                df <- pts %>% 
                        filter(Week %in% input$weeks & pos$Owner %in% input$owners)
                
        ## Roll the PTS data up by owner and position        
                agg <- df  %>% 
                        group_by(Owner, Position) %>%
                        summarise(Pts = sum(PTS))
            
        ## Generate the plot based on the agg dataframe        
                ggplot(agg, aes(x = Position, y = Pts)) +
                                        geom_text(aes(label=Owner,color=Owner), 
                                        size=4, show_guide=F, fontface="bold",   alpha = .7)
                
                }, height = 700)
})
