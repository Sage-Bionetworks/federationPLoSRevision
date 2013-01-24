\name{submitCompetitionModel_micmaTrained}
\alias{submitCompetitionModel_micmaTrained}
\title{Submit a trained model for a breast cancer competition}
\usage{
  submitCompetitionModel_micmaTrained(modelName = NULL,
    trainedModel = NULL, rFiles = NULL, algorithm = NULL,
    geneList = NULL, cvPerformance = NULL,
    parentDatasetId = "syn1642232")
}
\arguments{
  \item{modelName}{the name of the model that will be
  stored in Synapse}

  \item{trainedModel}{object that has been trained using
  the training data. The customPredict() method of this
  model will be called with the validation data to evaluate
  model performance.}

  \item{rFiles}{list of files required to train the model.
  One of the files must be the class file defining the
  class of trained model and defining the customTrain() and
  customPredict() methods. Other files are dependencies
  required to run customTrain() and customPredict() on the
  class file.}

  \item{cvPerformance}{optional argument containing an
  object of class SurvivalModelPerformanceCV as returned by
  the function crossValidatePredictiveSurvivalModel.}

  \item{isPracticeModel}{binary argument specifying if the
  model is uploaded to the Synapse dataset containing
  practice models or models to be scored in the
  competition. Set to FALSE if you do not want the model to
  be evaluated.}
}
\description{
  Uploads a trained model and model code to Synapse to be
  evaluated in the breast cancer competition.
}
\author{
  Adam Margolin
}

