unitTest_mod <- function(){
  ###################################################
  ### step 1: loadLibraries
  ###################################################
  library(predictiveModeling)
  library(BCC)
  library(survival)
  library(survcomp)
  library(MASS)
  library(federationPLoSRevision)

  ###### these are the utility functions to write #############
  # Metabric training - Metabric testing
  metabricTrainingData <- loadFederationMetabricTrainingData() 
  metabricTestData1 <- loadFederationMetabricTestData1()
  metabricTestData2 <- loadFederationMetabricTestData2()
  
  # Metabric training - MICMA testing
  metabricTrainingData1 <- loadMetabricMicmaTrainingData()
  micmaData <- loadFederationMicmaData()
  
  
  # only difference between previous Federation model submission was "Clinical Variates"
  # Coxph model is used for this unit test with new validation dataset
  source("~/SageGit/Sage-Bionetworks/Federation/CoxphModel.R")
  
  # Metabric
  coxTest<-CoxphModel$new()
  coxTest$customTrain(metabricTrainingData$exprData, metabricTrainingData$copyData,
                      metabricTrainingData$clinicalFeaturesData, metabricTrainingData$clinicalSurvData)
  
  metabricPredictions1 <- coxTest$customPredict(metabricTestData1$exprData, metabricTestData1$copyData,
                              metabricTestData1$clinicalFeaturesData)
  
  metabricPredictions2 <- coxTest$customPredict(metabricTestData2$exprData, metabricTestData2$copyData,
                                                metabricTestData2$clinicalFeaturesData)
  
  # Metabric with MICMA
  coxTest2<-CoxphModel$new()
  coxTest2$customTrain(metabricTrainingData1$exprData, metabricTrainingData1$copyData,
                       metabricTrainingData1$clinicalFeaturesData, metabricTrainingData1$clinicalSurvData)
  micmaPredictions <- coxTest2$customPredict(micmaData$exprData, micmaData$copyData,
                                            micmaData$clinicalFeaturesData)

}