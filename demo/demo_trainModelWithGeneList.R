library(devtools)

myGithubUsername <- "AAMargolin"
myGithubPassword <- "Set password here"
install_github("federationPLoSRevision", username="Sage-Bionetworks", auth_user=myGithubUsername, password=myGithubPassword)

require(federationPLoSRevision)

demo_trainModelWithGeneList <- function(synapseGeneListId = "syn1652976"){
  geneListEntity <- loadEntity(synapseGeneListId)
  geneList <- read.table(paste(geneListEntity$cacheDir, geneListEntity$files[[1]], sep="/"), stringsAsFactors=FALSE)
  geneList <- geneList[,1]
  
  metabricMicmaTrainingData <- loadMetabricMicmaTrainingData()
  
  exprData <- exprs(metabricMicmaTrainingData$exprData)
  exprData_filtered <- exprData[which(rownames(exprData) %in% geneList), ]
  
  copyData <- exprs(metabricMicmaTrainingData$copyData)
  copyData_filtered <- copyData[which(rownames(copyData) %in% geneList), ]
  
  coxTestModel <-CoxphModel$new()
  
  coxTestModel$customTrain(exprData_filtered, copyData_filtered,
                           metabricMicmaTrainingData$clinicalFeaturesData, metabricMicmaTrainingData$clinicalSurvData)
  
  modelClassFile <- "/home/ubuntu/SageGit/Sage-Bionetworks/federationPLoSRevision/R/CoxphModel.R"
  submitCompetitionModel_micmaTrained(modelName = "CoxTestModel_mammaprintGenes", trainedModel=coxTestModel, rFiles=modelClassFile,
                                      algorithm="Cox", geneList=geneListEntity$properties$name)
  
}
