plot1 <- function()
{
        temp <- tempfile()
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp, method = "curl")
        data <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?", stringsAsFactors= FALSE)
        unlink(temp)
        data$DateTime <- paste(data$Date, data$Time)
        data$DateTime <- as.Date(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
        req_data <- subset(data, DateTime == as.Date("2007-02-01") | DateTime == as.Date("2007-02-02"))
        png(file = "plot2.png", width = 480, height = 480, units = "px")
        hist(req_data$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        dev.off()
}