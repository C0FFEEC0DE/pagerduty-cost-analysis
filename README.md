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

