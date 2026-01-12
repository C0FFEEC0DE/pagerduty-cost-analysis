# PagerDuty Usage Cost Report Notebook

This repository contains a management-ready Jupyter Notebook for analyzing PagerDuty alert usage and attributing product cost across services, teams, and escalation policies.

## Setup

1. Create and activate a virtual environment.
2. Install dependencies:

```bash
pip install -r requirements.txt
```

3. Copy the example environment file and add your PagerDuty token:

```bash
cp .env.example .env
```

Set `PAGERDUTY_API_TOKEN` in `.env`.

### macOS quickstart script

Run the helper script below to create the Python virtual environment, install dependencies, set your PagerDuty API token, and open the notebook in Visual Studio Code:

```bash
./macos_setup_and_run.sh
```

## Running the Notebook

1. Launch Jupyter:

```bash
jupyter lab
```

2. Open `notebooks/pagerduty-usage-cost-report.ipynb`.
3. Run all cells. The report will execute with the default date range for the current month.

## ipywidgets Notes

If ipywidgets are not rendering, enable the extension:

```bash
jupyter nbextension enable --py widgetsnbextension
```
