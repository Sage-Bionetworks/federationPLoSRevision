library(devtools)

myGithubUsername <- "AAMargolin"
myGithubPassword <- "Set password here"
install_github("federationPLoSRevision", username="Sage-Bionetworks", auth_user=myGithubUsername, password=myGithubPassword)

require(federationPLoSRevision)

demo_trainModelWithGeneList <- function(synapseGeneListId = "syn1652976"){
  geneListEntity <- loadEntity(synapseGeneListId)
  geneList <- read.table(paste(geneListEntity$cacheDir, geneListEntity$files[[1]], sep="/"), stringsAsFactors=FALSE)
  geneList <- geneList[,1]
  
  metabricTrainingData <- loadMetabricMicmaTrainingData()
  
  exprData <- exprs(metabricTrainingData$exprData)
  exprData_filtered <- exprData[which(rownames(exprData) %in% geneList), ]
  
  copyData <- exprs(metabricTrainingData$copyData)
  copyData_filtered <- copyData[which(rownames(copyData) %in% geneList), ]
  
  coxTestModel <-CoxphModel$new()
  
  coxTestModel$customTrain(exprData_filtered, copyData_filtered,
                           metabricTrainingData$clinicalFeaturesData, metabricTrainingData$clinicalSurvData)
  
  modelClassFile <- "/home/ubuntu/SageGit/Sage-Bionetworks/federationPLoSRevision/R/CoxphModel.R"
  submitCompetitionModel_micmaTrained(modelName = "CoxTestModel_mammapringGenes", trainedModel=coxTestModel, rFiles=modelClassFile,
                                      algorithm="Cox", geneList=geneListEntity$properties$name)
  
}
