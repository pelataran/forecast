\name{tslm}
\alias{tslm}
\title{Fit a linear model with time series components}
\usage{tslm(formula, data, subset, lambda=NULL, biasadj=FALSE, ...)
}

\arguments{
\item{formula}{an object of class "formula" (or one that can be coerced to that class): a symbolic description of the model to be fitted.}
\item{data}{an optional data frame, list or environment (or object coercible by as.data.frame to a data frame) containing the variables in the model. If not found in data, the variables are taken from environment(formula), typically the environment from which lm is called.}
\item{subset}{an optional subset containing rows of data to keep. For best results, pass a logical vector of rows to keep. Also supports \code{\link[base]{subset}()} functions.}
\item{lambda}{Box-Cox transformation parameter. Ignored if NULL. Otherwise, data are transformed via a Box-Cox transformation.}
\item{biasadj}{Use adjusted back-transformed mean for Box-Cox transformations. If TRUE, point forecasts and fitted values are mean forecast. Otherwise, these points can be considered the median of the forecast densities.}
\item{...}{Other arguments passed to \code{\link[stats]{lm}()}}.
}

\description{\code{tslm} is used to fit linear models to time series including trend and seasonality components.}

\details{\code{tslm} is largely a wrapper for \code{\link[stats]{lm}()} except that it allows variables "trend" and "season" which are created on the fly from the time series characteristics of the data. The variable "trend" is a simple time trend and "season" is a factor indicating the season (e.g., the month or the quarter depending on the frequency of the data).}

\value{Returns an object of class "lm".}

\seealso{\code{\link{forecast.lm}}, \code{\link[stats]{lm}}.}

\author{Mitchell O'Hara-Wild and Rob J Hyndman}

\examples{
y <- ts(rnorm(120,0,3) + 1:120 + 20*sin(2*pi*(1:120)/12), frequency=12)
fit <- tslm(y ~ trend + season)
plot(forecast(fit, h=20))
}
\keyword{stats}
