##Set working directory to a directory of your choice and then execute the below code
##Download zip file and extract files
fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
download.file(fileUrl, destfile="exdata_data_NEI_data.zip")
unzip("exdata_data_NEI_data.zip")

##read data into dataframes
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

##plot Emissions by Year
barplot(with(NEI, tapply(Emissions, year, sum)), xlab = "Year", ylab = "Emissions", main = "PM2.5 Emissions Over Years", col = 2:5)

##After verifying the plot, copy to png file.

dev.copy(png, "plot1.png", height = 480, width = 480, unit = "px")
dev.off()
