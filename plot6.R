##Set working directory to a directory of your choice and then execute the below code
##Download zip file and extract files
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileUrl, destfile="exdata_data_NEI_data.zip")
unzip("exdata_data_NEI_data.zip")

##read data into dataframes
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##Limit data to motor vehicle sources in Baltimore City
NEIsub <- subset(NEI, fips %in% c("24510", "06037") & type == "ON-ROAD")
NEIsub[NEIsub$fips=="24510", ]$fips = "Baltimore, MD"
NEIsub[NEIsub$fips=="06037", ]$fips = "Los Angeles County"

library(ggplot2)

##plot total Emissions Vs Year

ggplot(NEIsub, aes(x=factor(year), y=Emissions, fill=factor(year))) + 
stat_summary(fun.y = "sum", position=position_dodge(), geom = "bar", ) + 
facet_wrap(~fips, scale = "free")
xlab("Year") + theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
ggtitle("Emissions in Baltimore City from 1999–2008 from various motor vehicel sources") +
scale_fill_discrete(name="Year")

##After verifying the plot, copy to png file.

dev.copy(png, "plot6.png", height = 480, width = 480, unit = "px")
dev.off()


 

