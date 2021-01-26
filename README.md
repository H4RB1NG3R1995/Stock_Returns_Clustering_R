# Stock_Returns_Clustering_R
Using K-means clustering to identify clusters of stocks that have similar returns over time

For this problem, we'll use StocksCluster.csv, which contains monthly stock returns from the NASDAQ stock exchange. The NASDAQ is the second-largest stock exchange in the world, and it lists many technology companies. The stock price data used in this problem was obtained from infochimps, a website providing access to many datasets. 

Each observation in the dataset is the monthly returns of a particular company in a particular year. The years included are 2000-2009. The companies are limited to tickers that were listed on the exchange for the entire period 2000-2009, and whose stock price never fell below $1. So, for example, one observation is for Yahoo in 2000, and another observation is for Yahoo in 2001. Our goal will be to create optimum number of clusters which have similar returns over time.

This dataset contains the following variables: 
1. ReturnJan = the return for the company's stock during January (in the year of the observation). 
2. ReturnFeb = the return for the company's stock during February (in the year of the observation). 
3. ReturnMar = the return for the company's stock during March (in the year of the observation). 
4. ReturnApr = the return for the company's stock during April (in the year of the observation). 
5. ReturnMay = the return for the company's stock during May (in the year of the observation). 
6. ReturnJune = the return for the company's stock during June (in the year of the observation). 
7. ReturnJuly = the return for the company's stock during July (in the year of the observation). 
8. ReturnAug = the return for the company's stock during August (in the year of the observation). 
9. ReturnSep = the return for the company's stock during September (in the year of the observation). 
10. ReturnOct = the return for the company's stock during October (in the year of the observation). 
11. ReturnNov = the return for the company's stock during November (in the year of the observation). 
12. PositiveDec = whether or not the company's stock had a positive return in December (in the year of the observation). This variable takes value 1 if the return was positive, and value 0 if the return was not positive.

For the first 11 variables, the value stored is a proportional change in stock value during that month. For instance, a value of 0.05 means the stock increased in value 5% during the month, while a value of -0.02 means the stock decreased in value 2% during the month.

The dataset has 11580 observations of 12 variables.

The variable 'PositiveDec' has been excluded from the final dataset since it is not important for this analysis.

K-means Clustering is used for solving the problem statement in this case.

Number of optimum clusters (K) chosen is 5 which is determined using elbow method.
