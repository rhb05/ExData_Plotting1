> if(!file.exists("./data")){dir.create("./data")}
> fileUrl < - "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
Error: object 'fileUrl' not found
> fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
> download.file(fileUrl,destfile="./data/Dataset.zip", mode="wb")
trying URL 'https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'
Content type 'application/zip' length 20640916 bytes (19.7 MB)
downloaded 19.7 MB

> unzip(zipfile="./data/Dataset.zip",exdir="./data")
> loadData <- function() {
+ read.table('data.txt', sep=';', header=TRUE) %>%
+ mutate(Date = as.Date(Date, '%d/%m/%Y')) %>%
+ mutate(Time = as.POSIXct(strptime(paste(Date, ' ', Time), '%Y-%m-%d %H:%M:%S'))) %>%
+ filter(Time >= strftime('2007-02-01 00:00:00'), Time < strftime('2007-02-03 00:00:00')) %>%
+ tbl_df
+ }