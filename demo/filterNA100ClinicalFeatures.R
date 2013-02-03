# NA filtering process with Metabric validation dataset2
# find how many NAs in each clinical features?
K<-c()
for(k in 1:length(metabricTestingData2$clinicalFeaturesData)){
  K<-c(K,length(which(is.na(metabricTestingData2$clinicalFeaturesData[,k])==1)))
}
names(K)<-names(metabricTestingData2$clinicalFeaturesData)

# Give a threshold(100) and find which covariates 
a<-which(K>=100)
TraingData1CFData<-metabricTrainingData1$clinicalFeaturesData[,-a]
TestingData2CFData<-metabricTestingData2$clinicalFeaturesData[,-a]
TestingData1CFData<-metabricTestingData1$clinicalFeaturesData[,-a]

newEntity <- Data(list(name= "Training METABRIC clinical features data filtered with 100 NAs", parentId = "syn1588463"))
newEntity<-createEntity(newEntity)          
addObject(newEntity, TraingData1CFData)
storeEntity(newEntity)

newEntity <- Data(list(name= "Validation 1 METABRIC clinical features data filtered with 100 NAs", parentId = "syn1588464"))
newEntity<-createEntity(newEntity)          
addObject(newEntity, TestingData1CFData)
storeEntity(newEntity)

newEntity <- Data(list(name= "Validation 2 METABRIC clinical features data filtered with 100 NAs", parentId = "syn1588465"))
newEntity<-createEntity(newEntity)          
addObject(newEntity, TestingData2CFData)
storeEntity(newEntity)

