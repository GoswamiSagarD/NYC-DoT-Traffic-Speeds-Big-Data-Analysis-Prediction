# Introduction

1. **Download the file from this location.**
    
    25gb file (8.73gb compressed)
https://gmuedu-my.sharepoint.com/:u:/g/personal/ehong8_gmu_edu/EXtyFZSiBmhDn85qFVQukXcBtSL-BnSHbQfgE0Z_VWWAlg?e=KhukEy

    or 

    8.65gb (separated into folders per 5 million and 100000 per file)
https://gmuedu-my.sharepoint.com/:u:/g/personal/ehong8_gmu_edu/EVU3pO2vIYNMgFszJ2zGGfABBJNvFyHfKiyPX8b_m9qebQ?e=CQskeD

    or
    430mb (entire dataset as parquet files)
https://gmuedu-my.sharepoint.com/:u:/g/personal/ehong8_gmu_edu/ESnbygQwhsVNlrybfnrg2uIB11a3i5MNqkbiC1nATOhOIA?e=DJJT1C

Picking the 25gb file requires to be ran on a local spark to generate 430mb parquet files to upload into databricks 
Picking the 8.65gb zip requires uploading 585 files into databricks (community databricks took 28.25 minutes to create permanent table and upload time with good internet is over 1.5hour+)

Both files of gb choices take time, but recommend using a local spark 

Providing option of parquet for time efficiency to skip Data Ingestion notebook

## Data Ingestion

Locate ```1 data ingestion.ipynb```

This notebook consumes the csv and imports into Databricks as a permanent table

Based on your choice of file, run cell 1 for multiple files uploaded to databricks or cell 2 for local spark and make appropriate folder location updates.  

All following notebooks will refer to a permanent table call rawdata or upload parquet files into databricks

# Data Analysis

## Clustering and PCA

Databricks Community is not large enough to support this notebook.  Fails at cell 16
Recommended Size Worker/Driver at least 32gb

Locate ```2 cluster_by_hour.ipynb```

Update first cell to appropriate dbfs location or run cell 2 if permanent table exists
```AIT 614.twbx``` is tableau map visualization

## Time-Series Analysis
**[NOTE: Due to memory and compute limitations of Databricks Community Edition, the data is aggregated by averaging on all link_points for every hour. This reduces the data to just 32K records. This greatly improves the execution speed of the analysis, but generates noticeably different results when compared to analyzing entire dataet.]**

It is advised to run these files on 'Databricks Runtime 10.4 LTS ML' cluster, running in any lower version will generate errors.
### Time-Series Data Exploration
1. Locate ```3-time-series-full-data-exploration.ipynb``` file.
2. Change the path to dbfs directory, where the parquet files are uploaded.
3. Run the entire notebook. Execution may take anywhere between 5 to 15 minutes.
4. Some of the graphs might load only first 10,000 records. To view the entire graph, Click on 'Reload with maximum results'.

### Time-Series Model training, Hyperparameter Tuning, Cross Validation, and Future Projections
1. Locate ```4-time-series-full-aggregated.ipynb``` notebook file.
2. Change the path to dbfs directory, where the parquet files are uploaded.
2. Run the entire notebook. Execution may take 3-4 hours. Results may vary from actual values obtained from full dataset, due to excessive aggregation, and sampling.