# Patterns-of-Democracy (R)

## Project Overview 

### Motivating Question

In this project I examine whether consensus democracy - a form of democracy characterized by political scientist Arend Lijphart - improves economic outcomes. 

Consensus democracy is one of the two types of democracy Lijphart (2012) identifies, with the other one being majoritarian democracy. The distinction between the two relies on competing views of democracy. Majoritarian democracies exemplify the view that the will of the majority should rule, while the aim of consensus democracies is to include the views of as many citizens as possible. One way in which Lijphart quantifies the difference between consensus and majoritarian democracies is by assigning countries a score on his 'executive-parties index': countries with higher scores have more of the traits associated with being a consensus democracy while lower scoring countries exhibit more majoritarian tratis. 

To test whether consensus democracy improves economic outcomes, I use Lijphart’s data from 36 democracies to look at the relationship between the countries’ scores on the executive-parties index and a set of economic indicators. I use the economic indicators used in Lijphart's own research, which are: 

* GDP
* Inflation
* Unemployment rates

## Key Results and Insights 

* Out of selected economic measures, the type of democracy only makes a significant difference when it comes to unemployment.
* Consensus democracy decreases unemployment
* Interest group corporatism is the main driver of the relationship between consensus democracy and unemployment. Corporatism being the main driver of the effect on unemployment might cause doubt on the role of consensus democracy more broadly, as Lijphart points out that “there is no clear causal connection that links it [interest group corporatism] to the other variables [making up consensus democracy]” (Lijphart, p.70)

## Code and Resources Used 
**R Version:** 4.0 

**Theoretical Background:** Patterns of Democracy, Arend Lijphart (2012)

## The Dataset 
For my analysis I use the Patterns of Democracy dataset provided by Andy Eggers, available [here](http://andy.egge.rs/data.html). The dataset replicates the data on 36 democracies used in Lijphart's research. 

## Data Cleaning 
Most of the cleaning work has already been done in the dataset provided. However, I make several changes to the set specific to the question under consideration. These changes include: 

* The countries with populations smaller than 0.5 million (i.e. the Bahamas, Barbados, Iceland, Luxembourg and Malta) have been excluded from the analysis since their economies are likely strongly influenced by international economic forces.  
* I create a seperate category for countries that experienced hyperinflation, to easily filter them out when examining the effects on the GDP deflator 
* I exclude countries with missing data from the analysis

## Exploratory Analysis 




## Regression Analysis

### Effect on economic outcomes

The executive-parties dimension consists of the percentage of minimal winning cabinets, a measure for executive dominance, the effective number of parties in parliament, a measure for the disproportionality of the electoral system and a measure for interest group pluralism, all measured from 1981 to 2010. When measuring the relationship between executive-parties score and the various economic outcomes, I control for development by using the Human Development Index. I do so since economic outcomes are not solely determined by the government. I also control for population size since larger countries might have greater influence in international relations and trade, which could enable them to gain positive economic benefits. 

**The results of the regressions on the three economic measures are as follows**

**GDP**


| Variables | Coefficient | p value |
| ------------- | ------------- | --- |
| Executive-Parties Index  | 0.0478  | 0.7730 |
| HDI 2010  | -5.3135  | 0.0165 |
| Population Size | 8.508 * 10^-7 | 0.5204| 

**Adjusted R-Squared:** 0.2879

* According to our model, the effect of consensus democracy on GDP growth is very small. When the executive-parties score is increased by one unit, GDP growth only increases by 0.048 percent. 
* This effect is not statistically significant
* The explanatory power of the model is modest: the model explains approximately 29% of the variation in GDP growth. 

**Inflation**


| Variables | Coefficient | p value |
| ------------- | ------------- | --- |
| Executive-Parties Index  | 0.853  |0.6232  |
| HDI 2010  |-22.1447| 0.0957|
| Population Size | -1.133 * 10^-5 | 0.2318 |

**Adjusted R-Squared:** 0.004066 

* According to our model, consensus democracy has a small positive effect on inflation, but this relationship is not statistically significant. 
* The model's explanatory power is poor: it can only explain 0.4% in the variation of the GDP deflator across countries.  


**Unemployment**
[Insert Image] 


| Variables | Coefficient | p value |
| ------------- | ------------- | --- |
| Executive-Parties Index  |  1.826 |0.0570|
| HDI 2010  | -12.62 | 0.3509 |
| Population Size | -1.133 * 10^-5 | 0.3452 |


**Adjusted R-Squared:** 0.2717

* The analysis shows that when the executive-parties score increases by one unit, unemployment rates drop by 1.8% percent.
* The model has modest explanatory power: 27% of variance in unemployment can be explained by our model.
* The relationship between consensus democracy and unemployment is significant at the 10% level. Out of the three economic measures under consideration, unemployment is the only measure on which consensus democracy has a statistically significant effect. 

**Discussion**

The results of the analysis are surprising, as it seems that when the type of democracy has an influence on economic outcomes, consensus democracy produces superior outcomes.Regarding the influence that the different institutional structures of democracies have on economic outcomes, Olson (1982) claims that consensus democracy does not improve economic outcomes. According to Olson, organizations that represent only a small fraction of society have strong incentives to make economic decision based on their own interests without considering the cost of their activities on society as a whole. For example, in a federal system a representative of a federal unit with a lot of agriculture might be likely to support subsidies for agriculture, even though such subsidies will not benefit the national economy. 

However, the positive effects on unemployment might be explained by one trait included in the executive-parties index: interest group corporatism/pluralism. Lijphart states that the characteristics of the corporatists interest groups associated with consensus democracy are that they are “large in size and small in number” (p.158) and coordinated in monopolistic peak organizations which tend to include a large portion of a country’s labour force.


### Individual traits of consensus democracy on unemployment

The executive-parties index consists of individual elements that are considered traits of consensus democracies. These are: Interest group pluralism, number of parties, % of minimal winning cabinets, executive dominance and disproportionality. To investigate our hypothesis that interest group corporatism is driving the relationship between consensus democracy and lower unemployment rates and to understand this relationship further, I permorm a regression of the individual elements of the exectuive-parties index on unemployment, to see how each individual factor effects unemployment. I also control for development and population size as before. 

| Variables | Coefficient | p value |
| ------------- | ------------- | --- |
| Interest Group Pluralism  |3.316| 0.00255|
| Effective Number of Parties  |0.4759 | 0.57505|
| Effective Number of Parties  |0.4759 |0.29581|
| % of minimal winning cabinets | -0.03870  | 0.3452 |
| Executive dominance | 0.9151 |0.02079|
|Disproportionality | -0.2401 |0.19655|
| HDI 2010  | -0.1770  | 0.13240 |
| Population Size | -6.136 x 10*^-6 |0.56762|

**Adjusted R-Squared:** 0.5634

* These results show that out of the variables of the executive-parties dimension, interest group pluralism has a far greater effect on unemployment than any of the others do. An increase of one unit in interest group pluralism, results in 3.3% higher unemployment. Moreover, this relationship is statistically significant at the 1% level. 
* This confirms our hypothesis that interest group pluralism is driving the relationship between consensus democracy and lower unemployment rates
* The only other variable which has a statistically significant relationship with unemployment is executive dominance
* The model has decent explanatory power: About 56% of the variation in unemployment can be explained by the model.


## Conclusion

One would expect that consensus democracy does not improve economic outcomes, since actors have strong incentives to make economic decision based on their own interests without considering the cost of their activities on society as a whole. Having analysed the relationship between consensus democracy and GDP growth, inflation and unemployment, I find that the type of democracy only makes a significant difference when it comes to unemployment. Contrary to expectations, I find that consensus democracy decreases unemployment. However, I also find that interest group corporatism is the main driver of this relationship.
