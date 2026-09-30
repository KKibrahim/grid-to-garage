# install every r package the project needs
# run this once in rstudio before anything else

packages <- c(
  # the web app
  "shiny",     # turns r code into an interactive website
  "bslib",     # modern bootstrap theme, dark mode and mobile friendly layouts
  "plotly",    # interactive charts with hover tooltips

  # data work
  "tidyverse", # dplyr, tidyr, readr, ggplot2, stringr, lubridate and friends
  "readxl",    # reads excel spreadsheets from bitre and abs
  "janitor",   # tidies messy column names
  "here",      # builds file paths from the project root so scripts run anywhere

  # deployment
  "rsconnect"  # publishes the app to shinyapps.io
)

# only install what is missing so rerunning this file is quick
missing <- packages[!packages %in% rownames(installed.packages())]

if (length(missing) > 0) {
  install.packages(missing)
} else {
  message("all packages already installed")
}

# the f1 packages are added in milestone five with their own setup script
