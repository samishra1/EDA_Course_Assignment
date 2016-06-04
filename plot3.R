##Set working directory to a directory of your choice and then execute the below code
##Download zip file and extract files
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileUrl, destfile="exdata_data_NEI_data.zip")
unzip("exdata_data_NEI_data.zip")

##read data into dataframes
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##limit the data to Baltimore City, MD
NEIsub <- subset(NEI, fips == "24510")

library(ggplot2)

##create a grid of 4 plots (2x2) showing Emissions by Year for various sources
## use stat_summary to sum up emissions, "dodge" position for bar charts and use year for the coloring scheme.
## Add appropriate x-axis, legend and chart titles

ggplot(NEIsub, aes(x=factor(year), y=Emissions, fill=factor(year))) + 
stat_summary(fun.y = "sum", position=position_dodge(), geom = "bar", ) + 
facet_wrap(~ type, scales = "free", nrow = 2, ncol = 2) + 
xlab("Year") + theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
ggtitle("Emissions in Baltimore City from 1999–2008 from various sources") +
scale_fill_discrete(name="Year")

##After verifying the plot, copy to png file.

dev.copy(png, "plot3.png", height = 480, width = 480, unit = "px")
dev.off()


 

