plot2 <- function()
{
        temp <- tempfile()
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp, method = "curl")
        data <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", na.strings = "?", stringsAsFactors= FALSE)
        unlink(temp)
        data$DateTime <- paste(data$Date, data$Time)
        data$DateTime <- as.Date(data$DateTime, format = "%d/%m/%Y %H:%M:%S")
        req_data <- subset(data, DateTime == as.Date("2007-02-01") | DateTime == as.Date("2007-02-02"))
        req_data$DateTime <- strptime(paste(req_data$Date, req_data$Time), format = "%d/%m/%Y %H:%M:%S")
        png(file = "plot2.png", width = 480, height = 480, units = "px", bg = "white")
        plot(req_data$DateTime, req_data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
        dev.off()
}