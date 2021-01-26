#K-Means Clustering Project

#Build an analytical model to create clusters of stocks which have similar returns over time.

#Calling the libraries
library(tidyverse)
library(cluster)
library(factoextra)
library(gridExtra)

#Setting working directory
Path<-"E:/IVY PRO SCHOOL/R/05 PREDICTIVE ANALYTICS PROJECTS/02 CLUSTERING/CASE STUDY2/02DATA"
setwd(Path)
getwd()

#Reading the dataset
stocks<-read.csv("StocksCluster.csv", header = TRUE, as.is = TRUE, na.strings = c(""))
stocks1<-stocks #creating a backup

#Exploring the data
str(stocks1)
summary(stocks1)

#dropping positiveDec from the dataframe since it is used for another problem
stocks1<-select(stocks1, -c(PositiveDec))

#Checking missing values
as.data.frame(colSums(is.na(stocks1)))

#Normalizing the Data for clustering 
library(caret)
preproc<-preProcess(stocks1)
stocks1Norm<-predict(preproc,stocks1)
summary(stocks1Norm)

write.csv(stocks1Norm, "stocks1norm.csv")

#checking outliers by quantile method

bench1<-round(quantile(stocks1Norm$ReturnJan, 0.75)+1.5*IQR(stocks1Norm$ReturnJan),0)
bench2<-round(quantile(stocks1Norm$ReturnFeb, 0.75)+1.5*IQR(stocks1Norm$ReturnFeb),0)
bench3<-round(quantile(stocks1Norm$ReturnMar, 0.75)+1.5*IQR(stocks1Norm$ReturnMar),0)
bench4<-round(quantile(stocks1Norm$ReturnApr, 0.75)+1.5*IQR(stocks1Norm$ReturnApr),0)
bench5<-round(quantile(stocks1Norm$ReturnMay, 0.75)+1.5*IQR(stocks1Norm$ReturnMay),0)
bench6<-round(quantile(stocks1Norm$ReturnJune, 0.75)+1.5*IQR(stocks1Norm$ReturnJune),0)
bench7<-round(quantile(stocks1Norm$ReturnJuly, 0.75)+1.5*IQR(stocks1Norm$ReturnJuly),0)
bench8<-round(quantile(stocks1Norm$ReturnAug, 0.75)+1.5*IQR(stocks1Norm$ReturnAug),0)
bench9<-round(quantile(stocks1Norm$ReturnSep, 0.75)+1.5*IQR(stocks1Norm$ReturnSep),0)
bench10<-round(quantile(stocks1Norm$ReturnOct, 0.75)+1.5*IQR(stocks1Norm$ReturnOct),0)
bench11<-round(quantile(stocks1Norm$ReturnNov, 0.75)+1.5*IQR(stocks1Norm$ReturnNov),0)




quantile(stocks1Norm$ReturnJan,c(0,0.005,0.01,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,0.99,0.995,1))
stocks1Norm$ReturnJan<- ifelse(stocks1Norm$ReturnJan> bench1 ,(stocks1Norm$ReturnJan == bench1),(stocks1Norm$ReturnJan<-stocks1Norm$ReturnJan))

quantile(stocks1Norm$ReturnFeb,c(0,0.005,0.01,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,0.99,0.995,1))
stocks1Norm$ReturnFeb<- ifelse(stocks1Norm$ReturnFeb> bench2 ,(stocks1Norm$ReturnFeb == bench2),(stocks1Norm$ReturnFeb<-stocks1Norm$ReturnFeb))

quantile(stocks1Norm$ReturnMar,c(0,0.005,0.01,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,0.99,0.995,1))
stocks1Norm$ReturnMar<- ifelse(stocks1Norm$ReturnMar> bench3 ,(stocks1Norm$ReturnMar == bench3),(stocks1Norm$ReturnMar<-stocks1Norm$ReturnMar))

quantile(stocks1Norm$ReturnApr,c(0,0.005,0.01,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,0.99,0.995,1))
stocks1Norm$ReturnApr<- ifelse(stocks1Norm$ReturnApr> bench4 ,(stocks1Norm$ReturnApr == bench4),(stocks1Norm$ReturnApr<-stocks1Norm$ReturnApr))

quantile(stocks1Norm$ReturnMay,c(0,0.005,0.01,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,0.99,0.995,1))
stocks1Norm$ReturnMay<- ifelse(stocks1Norm$ReturnMay> bench5 ,(stocks1Norm$ReturnMay == bench5),(stocks1Norm$ReturnMay<-stocks1Norm$ReturnMay))

quantile(stocks1Norm$ReturnJune,c(0,0.005,0.01,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,0.99,0.995,1))
stocks1Norm$ReturnJune<- ifelse(stocks1Norm$ReturnJune> bench6 ,(stocks1Norm$ReturnJune == bench6),(stocks1Norm$ReturnJune<-stocks1Norm$ReturnJune))

quantile(stocks1Norm$ReturnJuly,c(0,0.005,0.01,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,0.99,0.995,1))
stocks1Norm$ReturnJuly<- ifelse(stocks1Norm$ReturnJuly> bench7 ,(stocks1Norm$ReturnJuly == bench7),(stocks1Norm$ReturnJuly<-stocks1Norm$ReturnJuly))

quantile(stocks1Norm$ReturnAug,c(0,0.005,0.01,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,0.99,0.995,1))
stocks1Norm$ReturnAug<- ifelse(stocks1Norm$ReturnAug> bench8 ,(stocks1Norm$ReturnAug == bench8),(stocks1Norm$ReturnAug<-stocks1Norm$ReturnAug))

quantile(stocks1Norm$ReturnSep,c(0,0.005,0.01,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,0.99,0.995,1))
stocks1Norm$ReturnSep<- ifelse(stocks1Norm$ReturnSep> bench9 ,(stocks1Norm$ReturnSep == bench9),(stocks1Norm$ReturnSep<-stocks1Norm$ReturnSep))

quantile(stocks1Norm$ReturnOct,c(0,0.005,0.01,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,0.99,0.995,1))
stocks1Norm$ReturnOct<- ifelse(stocks1Norm$ReturnOct> bench10 ,(stocks1Norm$ReturnOct == bench10),(stocks1Norm$ReturnOct<-stocks1Norm$ReturnOct))

quantile(stocks1Norm$ReturnNov,c(0,0.005,0.01,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55,0.6,0.65,0.7,0.75,0.8,0.85,0.9,0.95,0.99,0.995,1))
stocks1Norm$ReturnNov<- ifelse(stocks1Norm$ReturnNov> bench11 ,(stocks1Norm$ReturnNov == bench11),(stocks1Norm$ReturnNov<-stocks1Norm$ReturnNov))

str(stocks1Norm)
summary(stocks1Norm)

#k-Means Clustering
set.seed(88)

#Finding and Visualizing out the various clusters
stocks1Cluster_K1<-kmeans(stocks1Norm, centers = 4,iter.max = 1000)
stocks1Cluster_K2<-kmeans(stocks1Norm, centers = 5,iter.max = 1000)
stocks1Cluster_K3<-kmeans(stocks1Norm, centers = 6,iter.max = 1000)
stocks1Cluster_K4<-kmeans(stocks1Norm, centers = 7,iter.max = 1000)


# plots to compare
p1 <- fviz_cluster(stocks1Cluster_K1, geom = "point", data = stocks1Norm) + ggtitle("k = 4")
p2 <- fviz_cluster(stocks1Cluster_K2, geom = "point", data = stocks1Norm) + ggtitle("k = 5")
p3 <- fviz_cluster(stocks1Cluster_K3, geom = "point", data = stocks1Norm) + ggtitle("k = 6")
p4 <- fviz_cluster(stocks1Cluster_K4, geom = "point", data = stocks1Norm) + ggtitle("k = 7")

grid.arrange(p1, p2, p3, p4, nrow = 2)

# Determing optimal numbers of clusters using the Elbow Method
set.seed(123)
fviz_nbclust(stocks1Norm, kmeans, method = "wss")

k<-5 #optimum number of clusters
stocks1Cluster_K<-kmeans(stocks1Norm, centers = k,iter.max = 1000)
stocks1Cluster_K

table(stocks1Cluster_K$cluster) #Number of observations in each cluster
stocks1Cluster_K$centers #centers for individual variables in normalized dataset
fviz_cluster(stocks1Cluster_K, data = stocks1Norm)



#Finding out the Mean Values of the Variables in the Clusters
Bal_mean_k<-aggregate(stocks1, by=list(cluster=stocks1Cluster_K$cluster), mean)
Bal_mean_k

#Appending the Clusters Assignment
stocks_new_k <- data.frame(stocks1, stocks1Cluster_K$cluster)


