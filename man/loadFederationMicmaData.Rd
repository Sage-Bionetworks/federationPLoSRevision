\name{loadFederationMicmaData}
\alias{loadFederationMicmaData}
\title{Load test data for the metabric re-evaluation with MICMA dataset}
\usage{
  loadFederationMicmaData(loadSurvData = FALSE)
}
\arguments{
  \item{loadSurvData}{specifies if survival data is loaded.
  Should be set to false to users who do not have access to
  validation data. Set to true for automated model
  evaluation harness.}
}
\value{
  a list with elements: exprData, containing an
  ExpressionSet of gene expression features; copyData,
  containing an ExpressionSet of copy number features;
  clinicalFeaturesData, containing an AnnotatedDataFrame of
  clinical covariates; and clinicalSurvData, if
  loadSurvData=TRUE, containing a Surv object of survival
  times and censor values.
}
\description{
  Loads data for gene expression, copy number, clinical
  covariates and clinical survival times for the test
  dataset used to evlauate model scores.
}
\author{
  Adam Margolin and In Sock Jang
}

