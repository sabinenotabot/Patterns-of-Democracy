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

* theealysis shows that when the executive-parties score increases by one unit, unemployment rates drop by 1.8% percent.


**Adjusted R-Squared:** 0.004066 



### Effect of individual traits on unemployment

## Conclusion
