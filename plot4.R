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
png(filename="plot4.png",width=480,height=480,units="px")

## Adjust the plot parameter
par(mfrow=c(2,2))

## Create the 1st plot (top left)
with(household,
     plot(
             datetime,
             global_active_power,
             type="l",
             xlab="",
             ylab="Global Active Power"
     )
)

## Create the 2nd plot (top right)
with(household,plot(datetime,voltage,type="l",ylab="Voltage"))

## Create the 3rd plot (bottom left)
with(household,
     plot(
             datetime,
             sub_metering_1,
             type="l",
             xlab="",
             ylab="Energy sub metering")
     )

with(household,
     lines(
             datetime,
             sub_metering_2,
             col="red"
             )
     )

with(household,
     lines(
             datetime,
             sub_metering_3,
             col="blue"
             )
     )

legend(
        "topright",
        col=c("black","red","blue"),
        lty=1,
        legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
        bty="n",
        cex=0.95
        )

## Create the 4th plot (bottom right)
with(household,
     plot(
             datetime,
             global_reactive_power,
             type="l",
             ylab="Global_reactive_power"
             )
     )

## Close the device
dev.off()

## Clear the workspace
rm(list = ls())