# Random data sample selection script

## Description

This script is designed for selecting a random sample of data from each month's export from Facepager software, used for scraping Facebook data. The script selects 15% of data from each month, facilitating more efficient analysis of extensive datasets.

## Features

The script reads data from a TSV file (`data/source.tsv`), segregates them by month and year, and then randomly selects 15% of entries from each monthly batch. This random selection enables a diversified sample for analysis.

## Usage

1. Ensure you have Dart SDK installed.
2. Place your TSV file as `data/source.tsv` in the script directory.
3. Run the script using the `dart run` command in the terminal.
4. Selected data will be saved in the `output.tsv` file.

## Script Structure

- Reads data from the `data/source.tsv` file.
- Splits data based on the date (month and year).
- Randomly selects 15% of records from each month.
- Saves the selected data to `output.tsv`.

## Requirements

- Dart SDK installed on your system.
- Basic knowledge of Dart programming language.
- Basic knowledge of terminal usage.
- Basic knowledge of TSV/CSV files.
