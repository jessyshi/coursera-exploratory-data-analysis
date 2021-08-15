#set the path name
path_name<-"C:/Users/Jessy/Documents/Coursera/Exploratory Data Analysis/Project 1/exdata_data_household_power_consumption/"

#read the data
household_power_consumption<-read.table(paste(path_name,"household_power_consumption.txt",sep=""),header=TRUE,sep=";")

str(household_power_consumption)


#convert Date to date objects
household_power_consumption$Date<-as.Date(household_power_consumption$Date,"%d/%m/%Y")


#subset the data to 2007-02-01 and 2007-02-02
subset_data<-household_power_consumption[household_power_consumption$Date=="2007-02-01"|household_power_consumption$Date=="2007-02-02",]



#convert all the other numbers to numeric values
subset_data[,-(1:2)]<-apply(subset_data[,-(1:2)],2,as.numeric)


#create each plot accordingly, and save it as png files (by default 480x480 pixel)


#Plot 2

#Create a new variable containing date and time
subset_data$date_and_time<-paste(subset_data$Date,subset_data$Time)
subset_data$date_and_time<-strptime(subset_data$date_and_time, format="%Y-%m-%d %H:%M:%S")

plot(subset_data$date_and_time,subset_data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="Time")
dev.copy(png,file=paste(path_name,"plot2.png"))
dev.off()
