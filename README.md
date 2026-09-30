# Grid to Garage

**F1 performance and the Australian car market**, an R Shiny portfolio app.

> Unofficial personal project. Not affiliated with Formula 1, the FIA, any team, or any vehicle manufacturer. No official logos are used.

## Purpose

This project shows the full analytics workflow (collect, clean, store, present) using real, public data about the Australian car industry:

1. **Australian car market**: new vehicle sales by fuel type, electric vehicle adoption, and the brands and body types Australians buy. Each chart opens with a one sentence business insight.
2. **F1 telemetry**: compares two drivers' fastest laps (speed, throttle, brake and time gained or lost) and links heavy braking to regenerative braking in electric road cars.

It is written for people who work in the automotive industry. You do not need to know anything about F1 to follow it.

## Project structure

```
grid-to-garage/
├── app/                   # the Shiny app (this folder is what gets deployed)
│   ├── app.R              # user interface and server logic
│   └── data/              # cleaned, app-ready data files (created by the cleaning scripts)
├── data/
│   ├── raw/               # hand-collected CSVs typed out of PDFs and releases
│   │   └── downloads/     # original PDFs and spreadsheets (not committed, see DATA_SOURCES.md)
│   └── processed/         # intermediate files between collect and clean steps
├── scripts/               # numbered pipeline scripts, run in order
├── setup/
│   └── install_packages.R # installs every R package the project needs
├── DATA_SOURCES.md        # every source, link and download date
└── grid-to-garage.Rproj   # open this in RStudio
```

## Pipeline

| Step | Where | What happens |
|------|-------|--------------|
| Collect | `data/raw/`, `scripts/01_*` | Download public files, or type published figures into tidy CSVs |
| Clean | `scripts/02_*` | Fix names, types and categories; check totals; reshape to long format |
| Store | `app/data/` | Save small, app-ready files |
| Present | `app/app.R` | Shiny app with interactive charts |

The app only reads the cleaned files in `app/data/`. It never downloads data while it is running, so it loads quickly.

## Data sources

See [DATA_SOURCES.md](DATA_SOURCES.md) for the full list with links and download dates. In short: BITRE and ABS vehicle registration statistics, FCAI monthly media releases, the Australian Automobile Association EV Index, Electric Vehicle Council reports, and F1 timing data through the `f1dataR` package.

## How to run it

1. Install [R](https://cran.r-project.org/) and [RStudio](https://posit.co/download/rstudio-desktop/).
2. Clone this repository and open `grid-to-garage.Rproj` in RStudio.
3. Install the packages once:
   ```r
   source("setup/install_packages.R")
   ```
4. Run the app:
   ```r
   shiny::runApp("app")
   ```

## Tech

R, Shiny, bslib, tidyverse, plotly. Deployed free on shinyapps.io.

## Status

- [x] 1. Project setup and GitHub repo
- [ ] 2. Collect and clean the market data
- [ ] 3. Market section of the app
- [ ] 4. Deploy the first version
- [ ] 5. F1 telemetry setup and page
- [ ] 6. About page and polish
