# Script to check input data
# Ensure all required files are present before running analyses

required_files <- c(
  "data/normalized_counts.rds",
  "data/DE_results.rds",
  "data/DE_results_ranked.rds",
  "data/annotation.rds",
  "data/clinical_am_prim.csv",
  "data/collectri_network_omnipath.rds"
)

missing_files <- required_files[!file.exists(required_files)]

if (length(missing_files) > 0) {
  message("Missing required data files: ", paste(missing_files, collapse=", "))
  message("Running download script...")
  source("download_data.R")
}

