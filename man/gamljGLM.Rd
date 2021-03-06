% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gamljglm.h.R
\name{gamljGLM}
\alias{gamljGLM}
\title{General Linear Model}
\usage{
gamljGLM(
  data,
  dep = NULL,
  factors = NULL,
  covs = NULL,
  modelTerms = NULL,
  fixedIntercept = TRUE,
  showParamsCI = TRUE,
  paramCIWidth = 95,
  contrasts = NULL,
  showRealNames = TRUE,
  showContrastCode = FALSE,
  plotHAxis = NULL,
  plotSepLines = NULL,
  plotSepPlots = NULL,
  plotRaw = FALSE,
  plotDvScale = FALSE,
  plotError = "none",
  ciWidth = 95,
  postHoc = NULL,
  eDesc = FALSE,
  eCovs = FALSE,
  simpleVariable = NULL,
  simpleModerator = NULL,
  simple3way = NULL,
  simpleScale = "mean_sd",
  cvalue = 1,
  percvalue = 25,
  simpleScaleLabels = "labels",
  postHocCorr = list("bonf"),
  scaling = NULL,
  effectSize = list("beta", "partEta"),
  homoTest = FALSE,
  qq = FALSE,
  normTest = FALSE,
  formula
)
}
\arguments{
\item{data}{the data as a data frame}

\item{dep}{a string naming the dependent variable from \code{data}; the
variable must be numeric. No needed if \code{formula} is used.}

\item{factors}{a vector of strings naming the fixed factors from
\code{data}. No needed if \code{formula} is used.}

\item{covs}{a vector of strings naming the covariates from \code{data}. No
needed if \code{formula} is used.}

\item{modelTerms}{a list of character vectors describing fixed effects
terms. No needed if \code{formula} is used.}

\item{fixedIntercept}{\code{TRUE} (default) or \code{FALSE}, estimates
fixed intercept. No needed if \code{formula} is used.}

\item{showParamsCI}{\code{TRUE} (default) or \code{FALSE} , parameters CI
in table}

\item{paramCIWidth}{a number between 50 and 99.9 (default: 95) specifying
the confidence interval width for the parameter estimates}

\item{contrasts}{a list of lists specifying the factor and type of contrast
to use, one of \code{'deviation'}, \code{'simple'}, \code{'difference'},
\code{'helmert'}, \code{'repeated'} or \code{'polynomial'}. If NULL,
\code{simple} is used.}

\item{showRealNames}{\code{TRUE} or \code{FALSE} (default), shows raw names
of the contrasts variables}

\item{showContrastCode}{\code{TRUE} or \code{FALSE} (default), shows
contrast coefficients tables}

\item{plotHAxis}{a string naming the variable placed on the horizontal axis
of the plot}

\item{plotSepLines}{a string naming the variable represented as separate
lines in the plot}

\item{plotSepPlots}{a string naming the variable defining the levels for
multiple plots}

\item{plotRaw}{\code{TRUE} or \code{FALSE} (default), plot raw data along
the predicted values}

\item{plotDvScale}{\code{TRUE} or \code{FALSE} (default), set the Y-axis
range equal to the range of the observed values.}

\item{plotError}{\code{'none'} (default), \code{'ci'}, or \code{'se'}. Use
no error bars, use confidence intervals, or use standard errors on the
plots, respectively.}

\item{ciWidth}{a number between 50 and 99.9 (default: 95) specifying the
confidence interval width for the plots.}

\item{postHoc}{a list of terms to perform post-hoc tests on.}

\item{eDesc}{\code{TRUE} or \code{FALSE} (default), provide lsmeans
statistics}

\item{eCovs}{\code{TRUE} or \code{FALSE} (default), provide lsmeans
statistics conditioned to  different values of the continuous variables in
the model. Which levels of the continuous variable should be used is set by
the \code{simpleScale} option.}

\item{simpleVariable}{The variable for which the simple effects (slopes)
are computed}

\item{simpleModerator}{the variable that provides the levels at which the
simple effects are computed}

\item{simple3way}{a moderator of the two-way interaction which is probed}

\item{simpleScale}{\code{'mean_sd'} (default), \code{'custom'} , or
\code{'percent'}. Use to condition the covariates (if any)}

\item{cvalue}{how many st.deviations around the means used to condition
simple effects and plots. Used if \code{simpleScale}=\code{'mean_sd'}}

\item{percvalue}{offsett (number of percentiles) around the median used to
condition simple effects and plots. Used if
\code{simpleScale}=\code{'percent'}}

\item{simpleScaleLabels}{how the levels of a continuous moderator should
appear in tables and plots: \code{labels}, \code{values} and
\code{values_labels}.}

\item{postHocCorr}{one or more of \code{'none'},  \code{'bonf'}, or
\code{'holm'}; provide no,  Bonferroni, and Holm Post Hoc corrections
respectively.}

\item{scaling}{a list of lists specifying the covariates scaling, one of
\code{'centered'} to the mean, \code{'standardized'}, or \code{'none'}.
\code{'none'} leaves the variable as it is}

\item{effectSize}{a list of effect sizes to print out. They can be:
\code{'eta'} for eta-square, \code{'partEta'} for partial eta-square,
\code{'omega'} for omega-square, and \code{'beta'} for standardized
coefficients (betas). Default is \code{beta} and \code{partial
eta-squared}.}

\item{homoTest}{\code{TRUE} or \code{FALSE} (default), perform homogeneity
tests}

\item{qq}{\code{TRUE} or \code{FALSE} (default), provide a Q-Q plot of
residuals}

\item{normTest}{\code{TRUE} or \code{FALSE} (default), provide a test for
normality of residuals}

\item{formula}{(optional) the formula to use, see the examples}
}
\value{
A results object containing:
\tabular{llllll}{
  \code{results$model} \tab \tab \tab \tab \tab The underlying \code{lm} object \cr
  \code{results$info} \tab \tab \tab \tab \tab a table \cr
  \code{results$main$anova} \tab \tab \tab \tab \tab a table of ANOVA results \cr
  \code{results$main$fixed} \tab \tab \tab \tab \tab a table \cr
  \code{results$main$contrastCodeTables} \tab \tab \tab \tab \tab an array of contrast coefficients tables \cr
  \code{results$postHocs} \tab \tab \tab \tab \tab an array of post-hoc tables \cr
  \code{results$simpleEffects$Anova} \tab \tab \tab \tab \tab a table of ANOVA for simple effects \cr
  \code{results$simpleEffects$Params} \tab \tab \tab \tab \tab a table \cr
  \code{results$emeansTables} \tab \tab \tab \tab \tab an array of predicted means tables \cr
  \code{results$descPlot} \tab \tab \tab \tab \tab a descriptives plot \cr
  \code{results$descPlots} \tab \tab \tab \tab \tab an array of results plots \cr
  \code{results$assumptions$homoTest} \tab \tab \tab \tab \tab a table of homogeneity tests \cr
  \code{results$assumptions$normTest} \tab \tab \tab \tab \tab a table of normality tests \cr
  \code{results$assumptions$qq} \tab \tab \tab \tab \tab a q-q plot \cr
}

Tables can be converted to data frames with \code{asDF} or \code{\link{as.data.frame}}. For example:

\code{results$info$asDF}

\code{as.data.frame(results$info)}
}
\description{
General Linear Model
}
\examples{
data('ToothGrowth')
gamlj::gamljGLM(formula = len ~ supp,  data = ToothGrowth)

}
