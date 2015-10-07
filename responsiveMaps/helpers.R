
require(rworldmap)
# loads data
carbonData <- read.csv('../co2-world-data.csv', header=T)
countries <- as.vector(carbonData$Country.Code)

#gets all years of data
carbonEmissionDF <- data.frame(country = countries,
                               "1996" = carbonData$X1996..YR1996.,
                               "1997" = carbonData$X1997..YR1997.,
                               "1998" = carbonData$X1998..YR1998.,
                               "1999" = carbonData$X1999..YR1999.,
                               "2000" = carbonData$X2000..YR2000.,
                               "2001" = carbonData$X2001..YR2001.,
                               "2002" = carbonData$X2002..YR2002.,
                               "2003" = carbonData$X2003..YR2003.,
                               "2004" = carbonData$X2004..YR2004.,
                               "2005" = carbonData$X2005..YR2005.,
                               "2006" = carbonData$X2006..YR2006.,
                               "2007" = carbonData$X2007..YR2007.,
                               "2008" = carbonData$X2008..YR2008.,
                               "2009" = carbonData$X2009..YR2009.,
                               "2010" = carbonData$X2010..YR2010.,
                               "2011" = carbonData$X2011..YR2011.
                               )



carbonEmissionMap <- joinCountryData2Map(carbonEmissionDF,
                                         joinCode = "ISO3",
                                         nameJoinColumn = "country")
carbonEmissionMap



emission_map <- function(var, legend.title, min = 0, max=70) {
  #set the shades of the map
  shades <- colorRampPalette(c("green", "red"))(16)
  
  column <- paste0("X", legend.title)
  pmin <-min(carbonEmissionDF[column])
  pmax <-max(carbonEmissionDF[column])


  column <- paste0("X", legend.title)
  
  map <- mapCountryData(carbonEmissionMap,
                 nameColumnToPlot = column,
                 missingCountryCol = grey(.7),
                 colourPalette = shades,
                 numCats = 16,
                 catMethod = "logFixedWidth",
                 addLegend = F
                 )
  do.call(addMapLegend, c(map, legendWidth = 0.5, legendLabels ="all"))
}  
library(plyr)
# carbonEmissionDF$country[4]
emission_table <- function(year){
  column = paste0("X", year)
  countryHighestID <-which(max(carbonEmissionDF[column]) == carbonEmissionDF[column])
  countryHighestCode <- carbonEmissionDF$country[countryHighestID]
  results <- c(paste("Country, Highest Emissions:",as.character(countryHighestCode)), 
              summary(carbonEmissionDF[column]))
  t(matrix(results, nrow=7))
}

worst_offenders_table <- function(year){
  column = paste0("X", year)
  allYearsTable = subset(carbonEmissionDF, carbonEmissionDF[column] > 20)
  wtable <- data.frame("Country" = allYearsTable$country, "Metric_Tonnes_Per_Capita"=allYearsTable[column])
  wtable
  }

allNationsPlot <- function(year){
  column = paste0("X", year)
  print(column)
  axisLog <- 10^(c(-1.5, -1, -.5, 0, .5, 1.5))
  boxplot(y = year, x=carbonEmissionDF[column], ylab="Carbon Emissions in metric tonnes per capita", xlab=year) 
}
