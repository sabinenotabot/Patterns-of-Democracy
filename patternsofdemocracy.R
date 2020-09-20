#Loading the data and having an initial look
data <- read.csv("http://andy.egge.rs/data/L.csv")
View(data)

#Cleaning up our table and creating categories for easy use
names(data)[2] <- "exec1945"
names(data)[3] <- "exec1981"
data$small_countries = data$country%in%c('BAH','BAR','ICE','LUX','MAL')
data$gdp_outliers = data$country%in%c('ARG','URU','KOR')
data$deflator_outliers= data$country%in%c('ISR','URU')

#Plotting Histograms 
data_hist = data[,c('gdp_per_cap_growth_1981_2009', 'exec1981', 'hdi_2010', 'pop_in_thousands_2009','gdp_deflator_1981_2009', 'unemployment_1981_2009')]

lapply(seq(data_hist), function(x) 
  hist(x=data_hist[[x]], xlab=names(data_hist)[x], main=paste("Histogram", names(data_hist)[x])))

#GDP 
#Plotting univariate regression for visualization
plot(data$gdp_per_cap_growth_1981_2009 ~ data$exec1981, main = "Consensus democracy and GDP", xlab="Executive-parties index", ylab="GDP (1981-2009)")
abline(lm(data$gdp_per_cap_growth_1981_2009 ~ data$exec1981))


#Running multivariate regression & retrieving results 
gdp <- lm(gdp_per_cap_growth_1981_2009 ~ exec1981 + hdi_2010 + pop_in_thousands_2009, data = data[!data$small_countries, !data$gdp_outliers,])
summary(gdp)
nobs(gdp)

#Inflation
#Plotting univariate regression for visualization
plot(data$gdp_deflator_1981_2009 ~ data$exec1981, main = "Consensus democracy and unemployment", xlab="Inflation", ylab="Inflation (1981-2009)")
abline(lm(data$gdp_deflator_1981_2009 ~ data$exec1981))

#Plotting univariate regression for visualization
deflator <- lm(gdp_deflator_1981_2009 ~ exec1981 + hdi_2010 + pop_in_thousands_2009 , data= data[!data$small_countries, !data$deflator_outliers])
summary(deflator)
nobs(deflator)

#Unemployment
#Plotting univariate regression for visualization
plot(data$unemployment_1981_2009 ~ data$exec1981, main = "Consensus democracy and unemployment", xlab="Executive-parties index", ylab="Unemployment rate (1981-2009)")
abline(lm(data$unemployment_1981_2009 ~ data$exec1981))

#Plotting univariate regression for visualization
unemployment <- lm(data$unemployment_1981_2009 ~ data$exec1981 + data$hdi_2010 + data$pop_in_thousands_2009, data= data[!data$small_countries, !data$country%in%c('ARG','BAR', 'BOT', 'GER', 'IND', 'KOR', 'MAU', 'NET', 'NZ',  'SWI', 'UK',  'URU'),])
summary(unemployment)
nobs(unemployment)

# Elements of consensus democracy 

# Multivariate regression to investigate role of each element of executive-parties index
unemployment_corporatism <- lm(unemployment_1981_2009 ~ index_of_interest_group_pluralism_1981_2010 + eff_num_parl_parties_1981_2010 + pct_minimal_winning_one_party_cabinet_1981_2010 + index_of_exec_dominance_1981_2010 + index_of_disproportionality_1981_2010 + hdi_2010 + pop_in_thousands_2009, data= data[!data$small_countries,])
summary(unemployment_corporatism)
nobs(unemployment_corporatism)



