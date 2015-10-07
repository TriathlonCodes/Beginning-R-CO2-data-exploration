This Repository is an exploration of R as well as an exploration of co2 emission data for the years 1996 to 2010. All data comes from The World Bank ("http://data.worldbank.org/indicator/EN.ATM.CO2E.PC")

#Goals for the exploration:

1) Learn and comprehend R

2) Explore the different facets of data visualization

3) Practice different forms of exporting data, familiarizing myself with Shiny, RStudio, and any other frameworks

4) Practice agile development, implementing skills of single responsibility functions and packages

##How it works

The main file with the most polished work is the CO2-interactive-markdown.RMD file. The responsiveMaps directory holds the helper.R file, which in MVC format would be considered the model. This is where functions and variables are being stored. The data comes from a downloaded csv file repsesenting the CO2 emissions in 193 countries from 1996 to 2011 in units metric tonnes per capita. 

##How to contribute

Contributions are welcome and helpful! As a new user of R, there are certainly bits of code that could be done in a better way. There any many limitations in R, especially while getting familiar with all the packages, there are a few plots and data sets that require attention to be the best representation of the data (note the box plot on the main page).

To contribute submit an issue or fork, clone and create a pull request. 

##How to clone & set up

If you don't already have R or rStudio on your computer, you will need both. A quick google search will bring you to the CRAN webpage for R, and the studio page. Download the most current versions. 

Clone the repo and open up rstudio and set the working directory to the front page of the Repo. Open up the CO2-interactive-markdown.RMD file and the helpers file found in the responsiveMaps directory. Run all the code in the helper file, and make sure there were no errors (errors might include not finding the csv fill, depending on your computer and working directory, you may need to reset it to access the file). THEN run the rmd app using the button on the upper right of the page display "Run App". 

Feel free to explore the other files, both shiny R and the flat RMD files. 
