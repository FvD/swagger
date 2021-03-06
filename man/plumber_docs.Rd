% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plumber.R
\name{plumber_docs}
\alias{plumber_docs}
\title{Plumber `register_doc()` information}
\usage{
plumber_docs()
}
\description{
Normally documentation is registered in the `.onLoad()` method of the package.
To avoid a circular dependency with `swagger` when `plumber` are starting up,
`plumber` must retrieve this information manually on it's startup.
}
\details{
See the examples for how documentation should regularly be registered.
}
\examples{
\dontrun{
## Suggested setup for other packages trying to register visual docs for plumber
.onLoad <- function(...) {
  plumber_register_ui <- function() {
    tryCatch({
      do.call(plumber::register_ui, plumber_docs())
    }, error = function(e) {
      message("Error registering swagger docs. Error: ", e)
    })
  }

  setHook(packageEvent("plumber", "onLoad"), function(...) {
    plumber_register_ui()
  })
  if ("plumber" \%in\% loadedNamespaces()) {
    plumber_register_ui()
  }
}
}
}
\keyword{internal}
