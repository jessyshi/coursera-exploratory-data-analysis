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

#Plot 1
hist(subset_data$Global_active_power, col="red", main=paste("Global Active Power"), xlab="Global Active Power (kilowatts)")

dev.copy(png, file=paste(path_name,"plot1.png"))
dev.off()

