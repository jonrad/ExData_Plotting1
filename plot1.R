data <- read.table("c:/temp/household_power_consumption.txt", sep = ";", skip = 1, stringsAsFactors = FALSE)
colnames(data) <- c("date", "time", "global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")

data <- data[data$date == '1/2/2007' | data$date == '2/2/2007',]

data$date <- strptime(paste(data$date, data$time), format="%d/%m/%Y %T")

numericColumns = c("global_active_power", "global_reactive_power", "voltage", "global_intensity", "sub_metering_1", "sub_metering_2", "sub_metering_3")
data[,numericColumns] <- apply(data[,numericColumns], 2, function(x) as.numeric(x))

png("plot1.png", width = 480, height = 480)

par(mfrow=c(1,1))

hist(
  main = "Global Active Power",
  data$global_active_power, 
  col = "red", 
  xlab = "Global Active Power (kilowatts)", 
  ylab = "Frequency")

dev.off()