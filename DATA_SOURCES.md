# Data sources

Every dataset used in Grid to Garage is listed here: where it came from, when it was downloaded, and what was done to it. If a number appears in the app, you should be able to trace it back to a row in this file.

All sources are free and public. Downloaded PDFs and spreadsheets go in `data/raw/downloads/` (not committed to Git; re-download them from the links below). Figures typed out of PDFs by hand go in `data/raw/` as CSV files and are committed.

## Status key

- **Candidate**: looks usable; checked in milestone 1 but not yet downloaded
- **In use**: downloaded, cleaned and shown in the app
- **Rejected**: checked and not used (reason given)

## Section 1: Australian car market

| # | Source | Publisher | What it gives us | Format | Frequency | Status |
|---|--------|-----------|------------------|--------|-----------|--------|
| 1 | [Road vehicles, Australia, January 2025](https://www.bitre.gov.au/publications/2025/road-vehicles-australia-january-2025) ([data.gov.au copy](https://www.data.gov.au/data/dataset/road-vehicles-australia-january-2025)) | BITRE | Vehicles **on the register** (the whole fleet, not new sales) by state, vehicle type, fuel type, make and age | Excel + PDF | Annual (31 January snapshot) | Candidate |
| 2 | [Motor Vehicle Census, Australia](https://www.abs.gov.au/statistics/industry/tourism-and-transport/motor-vehicle-census-australia) | ABS | Same as #1 for earlier years. Discontinued after 2021; BITRE took over from 2022 | Excel | Annual, up to 2021 | Candidate (history only) |
| 3 | [FCAI media releases](https://www.fcai.com.au/category/media-release/) | FCAI | Monthly **new vehicle sales** headline figures: total market, fuel type split (BEV, PHEV, hybrid), top brands, top models, segment leaders | Web page / PDF | Monthly | Candidate |
| 4 | [Electric Vehicle Index](https://www.aaa.asn.au/research-data/electric-vehicle/) | Australian Automobile Association | Quarterly new sales by fuel type and **by state**. Free to reuse if credited and linked | Online dashboard | Quarterly | Candidate (check for a download option) |
| 5 | [State of EVs 2025](https://electricvehiclecouncil.com.au/state-of-evs-2025/) | Electric Vehicle Council | Annual EV sales, share by state, top models, fleet size, charger numbers | PDF report | Annual | Candidate |

### Notes from the milestone 1 check

- **Sales and registrations are different things.** FCAI and AAA figures are *new vehicles sold* in a period. BITRE figures are *every vehicle registered* on one day. The app will label which one each chart uses and never mix them in one chart.
- **Full FCAI VFACTS data is paid.** Only the free media release summaries are used. That limits brand, model and segment detail to what FCAI publishes (usually the top 10).
- **State breakdowns** come from AAA (#4) for sales and BITRE (#1) for the registered fleet.
- **Tesla and Polestar** were not FCAI reporting members for some years, so FCAI releases may add them from a separate source (EVDirect). Check each release's footnotes before comparing EV totals across sources.

## Section 2: F1 telemetry

| # | Source | Publisher | What it gives us | Status |
|---|--------|-----------|------------------|--------|
| 6 | [f1dataR](https://cran.r-project.org/package=f1dataR) (R package) using [FastF1](https://docs.fastf1.dev/) (Python) | Open source community | Lap times and car telemetry (speed, throttle, brake, distance) for chosen sessions | Candidate (milestone 5) |

This data is unofficial and not endorsed by Formula 1. It is downloaded once, cached, and saved as small files so the live app never calls the API.

## Download log

Add one row every time a file is downloaded or a figure is typed in by hand.

| Date downloaded | Source # | File saved as | Covers period | Notes |
|-----------------|----------|---------------|---------------|-------|
| | | | | |
