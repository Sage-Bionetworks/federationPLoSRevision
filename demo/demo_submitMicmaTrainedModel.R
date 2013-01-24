library(devtools)

install_github("Sage-Bionetworks/federationPLoSRevision")

require(federationPLoSRevision)
require(BCC)
require(predictiveModeling)

metabricTrainingData <- loadMetabricMicmaTrainingData()

coxTestModel <-CoxphModel$new()

coxTestModel$customTrain(metabricTrainingData$exprData, metabricTrainingData$copyData,
                    metabricTrainingData$clinicalFeaturesData, metabricTrainingData$clinicalSurvData)

modelClassFile <- "/home/ubuntu/SageGit/Sage-Bionetworks/FederationPLoSRevision/R/CoxphModel.R"
submitCompetitionModel_micmaTrained(modelName = "CoxTestModel", trainedModel=coxTestModel, rFiles=modelClassFile,
                                    algorithm="boosting", geneList="MASP+clinical")
