📣 Update: the state of California has changed the metrics it uses to monitor its response to COVID-19, so this project is 💤 retired as of 28 August 2020.

# Scraping daily COVID metrics for Santa Barbara, CA

This project scrapes the daily reopening metrics for the county of Santa Barbara from <https://www.cdph.ca.gov/Programs/CID/DCDC/Pages/COVID-19/COVID19CountyDataTable.aspx>.

## Motivation

Once a county appears on the County Monitoring List for three consecutive days, indoor operations in the sectors listed in Section 3 of the [July 13th State Health Officer Order](https://www.cdph.ca.gov/Programs/CID/DCDC/CDPH%20Document%20Library/COVID-19/SHO%20Order%20Dimming%20Entire%20State%207-13-2020.pdf) must close.

I am using this project to track where Santa Barbara stands in terms of the criteria for inclusion on the County Monitoring List. As of 20 August 2020, the criteria for inclusion on the monitoring list are:

* (Case rate >100) OR (Case rate >25 AND Positivity >8%)
* Change in hospitalizations >10% increase
* <20% ICU beds available OR <25% ventilators available

These metrics capture three dimensions that the state of California is tracking: Elevated Disease Transmission, Increasing Hospitalization, and Limited Hospital Capacity. If Santa Barbara meets the criteria for removal from the County Monitoring List for a certain metric, then a checkmark ✔ is displayed.

Read more at <https://covid19.ca.gov/roadmap-counties/>.

## Technical details

The project is set up as a Jupyter notebook which scrapes the California Department of Public Health website and automatically updates a Google Sheet through the [Google Sheets API](https://developers.google.com/sheets/api/quickstart/python). The notebook automatically pushes the change to GitHub, which is hosted using GitHub pages on <https://alicelepissier.com/COVID-SB/>. A cron job is set up to run automatically inside a Virtual Machine hosted by Google Cloud Platform. Finally, the repo also contains an implementation to automatically run the notebook using Windows Task Scheduler.

### Setting up the automation

* `execute_notebook.py` uses [papermill](https://github.com/nteract/papermill) to automate the execution of the Jupyter notebook.
* If you are on Linux:
  * Set up a cron job (type `crontab -e`) with the contents of `linux_crontab`. The job is set up to run every day at noon. Update this to reflect your directories and Python installation.
* If you are on Windows:
  * Create a task which triggers `windows_scheduled_task.bat` every day at noon (or other) using Windows Task Scheduler. This batch file will call `execute_notebook.py` in an Anaconda prompt. Again, update this to suit whatever Anaconda/Python set-up you have.
