% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/flags.R
\name{parse_flags}
\alias{parse_flags}
\title{Parse Configuration Flags for a TensorFlow Application}
\usage{
parse_flags(config = Sys.getenv("R_CONFIG_ACTIVE", unset = "default"),
  file = "flags.yml", arguments = commandArgs(TRUE))
}
\arguments{
\item{config}{The configuration to use. Defaults to the
active configuration for the current environment (as
specified by the \code{R_CONFIG_ACTIVE} environment
variable), or \code{default} when unset.}

\item{file}{The configuration file to read.}

\item{arguments}{The command line arguments (as a
character vector) to be parsed.}
}
\value{
A named \R list, mapping configuration keys to values.
}
\description{
Parse configuration flags for a TensorFlow application. Use
this to parse and unify the configuration(s) specified through
a \code{flags.yml} configuration file, alongside other arguments
set through the command line.
}
\examples{
# examine an example configuration file provided by tensorflow
file <- system.file("examples/config/flags.yml", package = "tensorflow")
cat(readLines(file), sep = "\\n")

# read the default configuration
FLAGS <- tensorflow::parse_flags("default", file = file)
str(FLAGS)

# read the alternate configuration: note that
# the default configuration is inherited, but
# we override the 'string' configuration here
FLAGS <- tensorflow::parse_flags("alternate", file = file)
str(FLAGS)

# override configuration values using command
# line arguments (normally, these would be
# passed in through the command line invocation
# used to start the process)
FLAGS <- tensorflow::parse_flags(
  "alternate",
  file = file,
  arguments = c("--foo=1")
)
str(FLAGS)
}
