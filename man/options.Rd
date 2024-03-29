% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/options.R
\name{options}
\alias{options}
\title{AnnotationGx Options}
\description{
Internally used, package-specific options. All options will prioritize R options() values, and fall back to environment variables if undefined. If neither the option nor the environment variable is set, a default value is used.
}
\section{Checking Option Values}{

Option values specific to \code{AnnotationGx} can be
accessed by passing the package name to \code{env}.

\if{html}{\out{<div class="sourceCode">}}\preformatted{options::opts(env = "AnnotationGx")

options::opt(x, default, env = "AnnotationGx")
}\if{html}{\out{</div>}}
}

\section{Options}{

\describe{
\item{log_level}{\describe{
The log level to use. Possible values are 'ERROR', 'WARNING', 'DEBUG', 'INFO' Default is 'WARNING'.\item{default: }{\preformatted{"WARNING"}}
\item{option: }{annotationgx_log_level}
\item{envvar: }{ANNOTATIONGX_LOGLEVEL (evaluated if possible, raw string otherwise)}
}}

\item{verbose}{\describe{
The verbosity level to use. Default is FALSE.\item{default: }{\preformatted{FALSE}}
\item{option: }{annotationgx_verbose}
\item{envvar: }{ANNOTATIONGX_VERBOSE (evaluated if possible, raw string otherwise)}
}}

}
}

\seealso{
options getOption Sys.setenv Sys.getenv
}
