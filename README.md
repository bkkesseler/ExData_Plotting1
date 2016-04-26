## Introduction

This assignment uses data from
the <a href="http://archive.ics.uci.edu/ml/">UC Irvine Machine
Learning Repository</a>, a popular repository for machine learning
datasets. In particular, I used the "Individual household
electric power consumption Data Set" which our instructors have made available on
the course web site:


* <b>Dataset</b>: <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">Electric power consumption</a> [20Mb]

* <b>Description</b>: Measurements of electric power consumption in
one household with a one-minute sampling rate over a period of almost
4 years. Different electrical quantities and some sub-metering values
are available.


The following descriptions of the 9 variables in the dataset are taken
from
the <a href="https://archive.ics.uci.edu/ml/datasets/Individual+household+electric+power+consumption">UCI
web site</a>:

<ol>
<li><b>date</b>: Date in format dd/mm/yyyy </li>
<li><b>time</b>: time in format hh:mm:ss </li>
<li><b>global_active_power</b>: household global minute-averaged active power (in kilowatt) </li>
<li><b>global_reactive_power</b>: household global minute-averaged reactive power (in kilowatt) </li>
<li><b>voltage</b>: minute-averaged voltage (in volt) </li>
<li><b>global_intensity</b>: household global minute-averaged current intensity (in ampere) </li>
<li><b>sub_metering_1</b>: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered). </li>
<li><b>sub_metering_2</b>: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light. </li>
<li><b>sub_metering_3</b>: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.</li>
</ol>

## Loading the data

* My scripts  will only be using data from the dates 2007-02-01 and
2007-02-02, so I only load those dates.

* I converted the date and time variables to
Date/Time classes in R using the `strptime()` function, and created 
a datetime variable.

* Note that in this dataset missing values are coded as `?`, and they were
converted to NA on read.

## Making Plots

My overall goal here is simply to examine how household energy usage
varies over a 2-day period in February, 2007. My task is to
reconstruct the following plots below, all of which were constructed
using the base plotting system.

First I forked and cloned the following GitHub repository:
[https://github.com/rdpeng/ExData_Plotting1](https://github.com/rdpeng/ExData_Plotting1)

For each plot I:

* Construct the plot and save it to a PNG file with a width of 480
pixels and a height of 480 pixels.

* Name each of the plot files as `plot1.png`, `plot2.png`, etc.

* Create a separate R code file (`plot1.R`, `plot2.R`, etc.) that
constructs the corresponding plot, i.e. code in `plot1.R` constructs
the `plot1.png` plot. My code file **should include code for reading
the data** so that the plot can be fully reproduced. I also
include the code that creates the PNG file.

* Add the PNG file and R code file to my git repository

When I finished with the assignment, I pushed my git repository to
GitHub so that the GitHub version of my repository is up to
date. There are four PNG files and four R code files.

The four plots that I needed to construct are shown below, with my created plots
below each.


### Plot 1


![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png) 
![plot of chunk unnamed-chunk-2](plot1.png) 


### Plot 2

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png) 
![plot of chunk unnamed-chunk-3](plot2.png)


### Plot 3

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png) 
![plot of chunk unnamed-chunk-4](plot3.png)


### Plot 4

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png) 
![plot of chunk unnamed-chunk-5](plot4.png)