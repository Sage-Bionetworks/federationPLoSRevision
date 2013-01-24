library(devtools)

myGitHubUsername <- "AAMargolin"
myGitHubPassword <- "Set password here"
install_github("federationPLoSRevision", username="Sage-Bionetworks", auth_user=myGithubUsername, password=myGithubPassword)

require(federationPLoSRevision)
require(BCC)
require(predictiveModeling)

### if not automatically configured
synapseLogin()
metabricTrainingData <- loadMetabricMicmaTrainingData()

coxTestModel <-CoxphModel$new()

coxTestModel$customTrain(metabricTrainingData$exprData, metabricTrainingData$copyData,
                    metabricTrainingData$clinicalFeaturesData, metabricTrainingData$clinicalSurvData)

modelClassFile <- "/home/ubuntu/SageGit/Sage-Bionetworks/FederationPLoSRevision/R/CoxphModel.R"
submitCompetitionModel_micmaTrained(modelName = "CoxTestModel", trainedModel=coxTestModel, rFiles=modelClassFile,
                                    algorithm="boosting", geneList="MASP+clinical")
