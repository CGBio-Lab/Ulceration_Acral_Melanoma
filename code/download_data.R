# Script to download input data from Dropbox folder

# Create directories if they don't exist
dir.create("data", showWarnings = FALSE)
dir.create("output", showWarnings = FALSE)

# Dictionary of files and their URLs
data_files <- list(
  "data/normalized_counts.rds" = "https://www.dropbox.com/scl/fi/lojyvm5wtd69q2pjo9nip/normalized_counts.rds?rlkey=0i6x0inbjhjuspf6w4dkkiozf&st=cb7zjytj&dl=1",
  "data/DE_results.rds" = "https://www.dropbox.com/scl/fi/8ocmz4fa7otmjjhh0qnml/DE_results.rds?rlkey=uso87jwjh6segl0vtm03gwnnx&st=h9kcgcpl&dl=1",
  "data/DE_results_ranked.rds" = "https://www.dropbox.com/scl/fi/yg0ydqsapugxb0ss8lpjh/DE_results_ranked.rds?rlkey=p5xc7cwmq87jknwtzc9g7786t&st=w3wzzhcp&dl=1",
  "data/annotation.rds" = "https://www.dropbox.com/scl/fi/e8z196wbo3dfwr1k5alz8/annotation.rds?rlkey=100v63469a4rntbrhokrj764k&st=jw5no3sj&dl=1",
  "data/collectri_network_omnipath.rds" = "https://www.dropbox.com/scl/fi/luil6522lj6b8tbe0lidb/collectri_network_omnipath.rds?rlkey=mh9qgkkuerwyzudchs3esqrfa&st=m76w4q4s&dl=1",
  "data/rawcounts_am.rds" = "https://www.dropbox.com/scl/fi/vs7o60zkei3hl5b3b2ary/rawcounts_am.rds?rlkey=27e7ifjwpylla3p2n0hbgvn28&st=zjjpl2mr&dl=1")

# Download files if they don't exist
download_if_missing <- function(file_path, url) {
  if (!file.exists(file_path)) {
    message("Downloading ", file_path, "...")
    tryCatch({
      download.file(url, file_path, mode = "wb")
      message("Downloaded successfully!")
    }, error = function(e) {
      message("Error downloading ", file_path, ": ", e$message)
    })
  } else {
    message(file_path, " already exists. Skipping download.")
  }
}

# Download all files
for (file_path in names(data_files)) {
  download_if_missing(file_path, data_files[[file_path]])
}

message("Data download is complete")
