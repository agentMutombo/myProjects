dataset <- read.csv("C:\\Users\\User\\Desktop\\project\\R projects\\hw1_data.csv")
#Return the column names of the dataset
colnames(dataset)

#return the first 2 rows of the dataset
dataset[1:2,]
#or this
head(dataset, 2)

#return the last 2 rows of the dataframe
tail(dataset, 2)

#How many observations (i.e. rows) are in this data frame?
nrow(dataset)

#What is the value of Ozone in the 47th row?
dataset[47,"Ozone"]

#missing values in the Ozone column
sum(is.na(dataset$Ozone))

#What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA)
mean(dataset$Ozone, na.rm = T)

#Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?
sub_dataset = dataset[dataset$Ozone > 31 & dataset$Temp > 90, ]
mean(sub_dataset$Solar.R, na.rm = TRUE )

#What is the mean of "Temp" when "Month" is equal to 6? 
sub_d = dataset[dataset$Month == 6, ]
mean(sub_d$Temp, )

#What was the maximum ozone value in the month of May (i.e. Month is equal to 5)?
ssub_dataset = dataset[dataset$Month == 5,]
max(ssub_dataset$Ozone, na.rm = T)


