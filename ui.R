

library(shiny)

shinyUI(fluidPage(
        titlePanel("Fantasy Football Points by Position"),
        sidebarLayout(
                sidebarPanel(fluidRow(
                        column(7,
                        checkboxGroupInput("owners", 
                                             label = h3("Owners"), 
                                             choices = list("Brant" = "Brant", 
                                                            "Bridger" = "Bridger",
                                                            "Brigham" = "Brigham",
                                                            "Candon" = "Candon",
                                                            "Curtis" = "Curtis",
                                                            "Dallin" = "Dallin",
                                                            "Dexter" = "Dexter",
                                                            "Jason" = "Jason",
                                                            "Jeff" = "Jeff",
                                                            "Kade" = "Kade",
                                                            "Rod" = "Rod",
                                                            "Thad" = "Thad",
                                                            "Trey" = "Trey",
                                                            "Tyler" = "Tyler"
                                                            
                                                            ),
                                             selected = c("Brant","Bridger", "Brigham",
                                                          "Candon", "Curtis", "Dallin", 
                                                          "Dexter","Jason", "Jeff", "Kade", 
                                                          "Rod","Thad", "Trey", "Tyler"))),
                          column(3,
                             checkboxGroupInput("weeks", label = h3("Weeks"),
                                                         choices = list("1" = 1,
                                                                        "2" = 2,
                                                                        "3" = 3,
                                                                        "4" = 4,
                                                                        "5" = 5,
                                                                        "6" = 6,
                                                                        "7" = 7),
                                                selected = c(1:7)))  
                             
                             ), submitButton("Update")),
                mainPanel(plotOutput("plot1")),
                )
        )
)