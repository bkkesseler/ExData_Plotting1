## Week 1 Project for Exploratory Data Analysis (Data Science Specialization 
## Course 4)

## Clear the workspace
rm(list = ls())

## Check to see if the file is present, if it is, continue
## If the file is not present, check to see if the zip file is present, if it 
##   is, unzip the file
## If the zip file is not present, download it, and unzip the file 
if (
        length(
                grep("household_power_consumption.txt",list.files())
                ) > 0
        ) { print("Text file present, continuing") 
        } else if (
        length( 
                grep("exdata-data-household_power_consumption.zip",list.files())
                ) > 0
        ) { 
                print("Text file missing, zip file present, unzipping")
                unzip("exdata-data-household_power_consumption.zip",overwrite=TRUE)
        } else { 
                print("Downloading file, then unzipping") 
                download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
                              "exdata-data-household_power_consumption.zip")
                unzip("exdata-data-household_power_consumption.zip",overwrite=TRUE)
                }

## Read in data
## Establish column names
household_names <- read.table(
        "household_power_consumption.txt",
        nrows=1,
        sep=";",
        header=TRUE
        )

## Read only data needed for analysis (2/1/2007-2/2/2007 in US time format)
## File date format is European (1/2/2007 - 2/2/2007)
household <- read.table(
        "household_power_consumption.txt",
        sep=";",
        col.names=tolower( colnames( household_names ) ),
        na.strings="?",
        skip=grep("1/2/2007",readLines("household_power_consumption.txt")),
        nrows=grep("3/2/2007",readLines("household_power_consumption.txt"))
        - grep("1/2/2007",readLines("household_power_consumption.txt"))
        -1
        )

## Convert the date and time to an R datetime format
household$date <- as.Date(household$date,"%d/%m/%Y")
household$datetime <- strptime(paste(household$date,household$time),
                                 "%Y-%m-%d %H:%M:%S")

## Set up the png device
png(filename="plot1.png",width=480,height=480,units="px")

## Create the plot
with(household,
     hist(
             global_active_power,
             n=12,
             main="Global Active Power",
             xlab="Global Active Power (kilowatts)",
             col="red"
             )
     )

## Close the device
dev.off()

## Clear the workspace
rm(list = ls())