library("luzlogr")





logging <- function(message){
  fileLog <- "../data/reading_csv.log"
  openlog(file=fileLog,append=TRUE)
  printlog(message)
  closelog(sessionInfo = FALSE)
}

readFileRaw <- function(fileName){
  filePath <- paste("../data/raw/",fileName, sep = "")
  logging(paste("reading file ",filePath))
   return (read.csv(filePath))
}

readFileProcessed <- function(fileName){
  filePath <- paste("../data/processed/",fileName, sep = "")
  logging(paste("reading file ",filePath))
  return (read.csv(filePath))
}

