# WORLD DEVELOPMENT INDICATORS

**World Development Indicators** is the World Bank's premier compilation of cross-country comparable data on development. They are a compilation of relevant, high-quality, and internationally comparable statistics about global development and the fight against poverty. 

The database contains 1,400 time series indicators for 217 economies and more than 60 country groups, with data for many indicators going back more than 50 years. The main topics covered in the data are:

- **Poverty and inequality** (poverty, prosperity, consumption, income distribution...)
- **People** (people dynamics, education, labor, health, gender...)
- **Environment** (agriculture, climate change, energy, biodiversity, water, sanitation...)
- **Economy** (growth, economic structure, income and savings, trade, labour productivity...)
- **States and Markets** (business, stock markets, military, communications, transport, technology)
- **Global Links** (debt, trade, aid dependency, refugee, tourism, migration)

The database for the world development indicators can be found here: https://datatopics.worldbank.org/world-development-indicators/ 


### Checkout and run

You can clone this repository by using the command:

```
git clone https://github.com/aridhia/demo-world-development-indicators
```

Open the .Rproj file in RStudio and use `runApp()` to start the app.

### Deploying to the workspace

1. Download this GitHub repo as a .zip file.
2. Create a new blank Shiny app in your workspace called "world-development-indicators".
3. Navigate to the `world-development-indicators` folder under "files".
4. Delete the `app.R` file from the `world-development-indicators` folder. Make sure you keep the `.version` file!
5. Upload the .zip file to the `world-development-indicators` folder.
6. Extract the .zip file. Make sure "Folder name" is blank and "Remove compressed file after extracting" is ticked.
7. Navigate into the unzipped folder.
8. Select all content of the unzipped folder, and move it to the `world-development-indicators` folder (so, one level up).
9. Delete the now empty unzipped folder.
10. Start the R console and run the `dependencies.R` script to install all R packages that the app requires.
11. Run the app in your workspace.

For more information visit https://knowledgebase.aridhia.io/article/how-to-upload-your-mini-app/

