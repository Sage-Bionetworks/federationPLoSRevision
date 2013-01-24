\name{loadFederationMetabricTrainingData}
\alias{loadFederationMetabricTrainingData}
\title{Load training data for the metabric reevaluation}
\usage{
  loadFederationMetabricTrainingData()
}
\value{
  a list with elements: exprData, containing an
  ExpressionSet of gene expression features; copyData,
  containing an ExpressionSet of copy number features;
  clinicalFeaturesData, containing an AnnotatedDataFrame of
  clinical covariates; and clinicalSurvData, containing a
  Surv object of survival times and censor values.
}
\description{
  Loads data for gene expression, copy number, clinical
  covariates and clinical survival times for the training
  dataset used to train predicitve models.
}
\author{
  Adam Margolin and In Sock
}

