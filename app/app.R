# grid to garage
# the shiny app that presents the cleaned data
# milestone one only builds the skeleton: theme, navigation and placeholder pages

library(shiny)
library(bslib)

# theme

# one accent colour used for buttons, links and highlighted chart lines
accent <- "#00c2a8"

app_theme <- bs_theme(
  version = 5,
  bg = "#101216",
  fg = "#e6e8eb",
  primary = accent,
  base_font = font_google("Inter", local = FALSE),
  heading_font = font_google("Inter", local = FALSE)
)

# shared pieces

# shown at the bottom of every page
disclaimer <- tags$footer(
  class = "text-center text-muted small py-3",
  "Unofficial personal portfolio project. Not affiliated with Formula 1, the FIA, ",
  "any team, or any vehicle manufacturer. All trademarks belong to their owners."
)

# a simple card that marks a page as not built yet
coming_soon <- function(title, milestone, text) {
  card(
    card_header(title),
    p(text),
    p(class = "text-muted", paste("Planned for milestone", milestone))
  )
}

# pages

home_page <- nav_panel(
  "Home",
  div(
    class = "container py-4",
    h1("Grid to Garage"),
    p(
      class = "lead",
      "What is changing in the Australian new car market, and what can ",
      "racing telemetry tell us about the technology heading into road cars?"
    ),
    layout_columns(
      col_widths = c(6, 6),
      card(
        card_header("Australian car market"),
        p("New vehicle sales by fuel type, electric vehicle adoption, ",
          "and the brands and body types Australians are buying.")
      ),
      card(
        card_header("F1 telemetry"),
        p("Compare two drivers lap by lap to see where time is won and lost, ",
          "and how hard braking links to regenerative braking in electric cars.")
      )
    )
  )
)

market_menu <- nav_menu(
  "Car market",
  nav_panel(
    "Market trends",
    coming_soon("Market trends", 3,
                "Sales over time by fuel type, with a state filter where the data allows.")
  ),
  nav_panel(
    "EV adoption",
    coming_soon("EV adoption", 3,
                "Electric vehicle share over time, top models and a simple projection.")
  ),
  nav_panel(
    "Brands and segments",
    coming_soon("Brands and segments", 3,
                "Top brands and segments such as SUVs, utes and passenger cars.")
  )
)

f1_page <- nav_panel(
  "F1 telemetry",
  coming_soon("F1 telemetry", 5,
              "Overlay two drivers' fastest laps and see where time is gained or lost.")
)

about_page <- nav_panel(
  "About",
  coming_soon("About", 6,
              "Background, methods, data sources, limitations and contact links.")
)

# ui and server

ui <- page_navbar(
  title = "Grid to Garage",
  theme = app_theme,
  fillable = FALSE,
  home_page,
  market_menu,
  f1_page,
  about_page,
  footer = disclaimer
)

# nothing reactive yet, charts arrive in milestone three
server <- function(input, output, session) {
}

shinyApp(ui, server)
