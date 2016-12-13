<h1 style="color: #000000; font-family: Babas; font-size: 4em;">README</h1>
<h2 style="color: #ff0000 ">WARNING:</h2>
<p>The current research study was done using the R version 3.3.1 software. The R codes included in this research study or research project has not been tested in previous R versions. It is very likely that errors might occur using older versions of R. Also, newer versions of R might be modified to behave differently in how it executes its code. Heed to this warning when trying to reproduce the works of the present study</p>

<ol type="1">
<li style="font-size: 2em; font-weight:bold">MastersThesisProject Directories and Files

  <ul style="list-style-type:square; font-weight:normal">
  <li>Data/</li>
  <p style="font-size: 0.75em;">
  The <b> Data </b> folder contains the following folders in it. Financials, GatherSource, SP500, and WOB. Additional files are included in the Data folder. This are MainData.csv, randomSample_ROAA_percentWOBGroup, randomSample_ROAE_percentWOBGroup, and variable_description.txt.
  </p>
  <p style="font-size: 0.75em;">
  The <b>variable_description.txt</b> file contains futher description about the folders and files contained in the Data directory.
  </p>
  
  <li>FinalDeposit</li>
  <p style="font-size: 0.75em;">
  The <b>FinalDeposit</b> directory contains the project report paper titled finalDepositFormat2.pdf. This file has been revised to meet the APA standards of writing. It is also a reworked or modified version of the Project.pdf file that is contained in the "Presentation" directory.
  </p>
  
  <li>Presentation/</li>
  <p style="font-size: 0.75em;">
  The <b>Presentation</b> directory contains several files and folders that was used for creating the research paper report file (i.e. Project.pdf). Futher description about how the file is created can be found in the <b>readme_presentation.txt</b> file contained in the Presentation directory.<br><b>NOTE!</b> an APA formatted and revised version of the Project.pdf file can be located in the "FinalDeposit" folder. The name of the file is <b>finalDepositFormat2.pdf</b>.
  </p>
  
  <li>README.md</li>
  <p style="font-size: 0.75em;">
  The primary readme file for the MastersThesisProject directory. Other version of readme files describing folders and files within the folders can be found in the sub directories of the MastersThesisProject directory. Where no readme file exist in a folder, this only indicates that none has been provided yet. Where necessary, updates shall be made available in the GitHub repository for the MastersThesisProject.
  </p>
  </ul>
</li>

<li style="font-size: 2em; font-weight:bold">Analytical Files
<p style="font-size: 0.75em;font-weight:normal">
There are a total of 15 R analytical files that was used for conducting the necessary statistical analysis that is intended for the present study. A full description about this file will be available in a later update. The files can be located in the "MastersThesisProject/Presentation/Article/Analysis" directory. They are </p>
<ul style="font-weight:normal; list-style-type:square; font-size: 0.75em">
<li>descriptive.R</li>
<li>plotKruskalTest.R</li>
<li>randomSamplingForKruskalTest_ROAA_percentWOB.R</li>
<li>randomSamplingForkruskalTest_ROAE_percentWOB.R</li>
<li>statisticForKruskalTest_ROAA_ROAE_percentWOBGroup.R</li>
<li>twoDatasetsROAA_ROAE_3O_randomFirms.R</li>
<li>scatterPlotX_pair_ROAA_ROAE_percentWOB.R</li>
<li>scatterPlotX_percentWOB_Y_ROAA_monotonic.R</li>
<li>scatterPlotX_percentWOB_Y_ROAE_monotonic.R</li>
<li>normalityTestShapiro.R</li>
<li>cor_percentWOB_ROAA_ROAE.R</li>
<li>corPair_percentWOB_ROAA_ROAE.R</li>
<li>correlationMatrix.R</li>
<li>spearmanCorrelationMatrix.R</li>
<li>spearmanProbabilityMatrix.R</li>
</ul>
</li>

<li style="font-size: 2em; font-weight:bold">Data Files
<p style="font-size: 0.75em;font-weight:normal">
Several data files (i.e. comma separated values and excel files) were used in the present study. Every data file used in the study are stored in the <b>MastersThesisProject/Data</b> directory. Refer to section 1 of this README.md file to learn more details about the directory. All comma separated values files (i.e. csv) and excel files (.xlsx) are listed below by thier respective directory:</p>
<ul style="font-weight:normal; list-style-type:square; font-size: 0.75em">
<li>/MainData.csv</li>
<li>/randomSample_ROAA_percentWOBGroup.csv</li>
<li>/randomSample_ROAE_percentWOBGroup.csv</li>
<li>Financials/financials.csv</li>
<li>firms/ (<i>71 .xlsx files</i>)</li>
<li>SP500/SP500.csv</li>
<li>WOB/uncleanWOB.csv</li>
<li>WOB/wob.csv</li>
</ul>
</li>

<li style="font-size: 2em; font-weight:bold">Steps for setting up the required directories for storing data
<p style="font-size: 0.75em;font-weight:normal">
Before obtaining the data from their respective sources, we will first have to create the directories where we want the data to be stored in. Create the following directories within the <b>MastersThesisProject/Data</b> directory, if you do not have these directories set up. If you have access to the Github repository or CD-R media, then you can clone or copy the whole MastersThesisProject directory into your C:/ root drive of your Windows OS, instead of having to create these folders on your own.</p>
<ul style="font-weight:normal; list-style-type:square; font-size: 0.75em">
<li>Financials/</li>
<li>Financials/firms</li>
<li>GatherSource/</li>
<li>SP500/</li>
<li>WOB/</li>
</ul>
</li>

<li style="font-size: 2em; font-weight:bold">Steps required to obtain all the data files at once
<p style="font-size: 0.75em;font-weight:normal">
Several R files as mentioned above were used to obtain the required data files (.csv and .xlsx) needed for conducting statistical analysis in the present study. Each one of these R files can be executed individually to obtain the data required for the study. However, a much straightforward and easier approach will be to use a single R file that runs all the necessary R files, in order to obtain at once, all the required data files needed for the study. The steps are discussed below.</p>
<h3 style="color: #ff0000 ">WARNING:</h3>
<p>The following steps below requires an installed R version 3.3.1 on the user's computer system, in order to work properly. The steps below may still not work properly if the Financials/firms directory is missing. In order to make the below steps work, make sure to create, clone or copy whichever it is the <b>firms</b> directory and all of the 71 .xlsx files that are contained within the directory before running the MakeFile.R file</p>

<ol style="font-weight:normal; list-style-type:square; font-size: 0.75em">
<li><b>Step 1:</b> Open the GatherSource directory that is located within the Data directory of the MastersThesisProject</li>
<li><b>Step 2:</b> Use the R software (preferably in RStudio) to open the MakeFile.R file in the GatherSource directory/firms</li>
<li><b>Step 3:</b> Press Ctrl + A to select all the lines of codes displayed in the MakeFile.R file/</li>
<li><b>Step 4:</b> Hit Ctrl + Enter to run all codes at once and create all of the csv files needed for the present study</li>
</ol>
</li>

<li style="font-size: 2em; font-weight:bold">Data sources
<ul style="font-weight:normal; list-style-type:square; font-size: 0.75em">
<li>[YCharts](https://www.ycharts.com/)</li> Data source used to obtain data on the United States technology firms listed in the Standard and Poor's (S&P) 500 index for the year 2016.
<li>[SEC.GOV](https://www.sec.gov/)</li> Data source used to obtain financial data on the United States technology firms included in the present study. 
<li>[2020 Women On Boards](https://www.2020wob.com/)</li> Data source used to obtain data on the composition of board of directors in the United States technology firms included in the present study. 
</ul>
</li>
</Ol>

--------------------------------------------------------------------------------------------

&copy; 2016 Obinna Mogbogu<br>
Illinios State University<br>
All rights Reserved

![](https://upload.wikimedia.org/wikipedia/en/f/f9/Illinois_State_University_Seal.png)

Author: Obinna Mogbogu<br>
Contact: mastersthesis.obinnamogbogu@gmail.com<br>
Date Created: October 12, 2016<br>
Last Modified: December 12, 2016
