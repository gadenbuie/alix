#' Test your document or app for accessibility issues.
#'
#' Uses [a11y.css](https://github.com/ffoodd/a11y.css) to include warnings and
#' diagnostics about potential accessibility issues in your HTML document or
#' Shiny web app.
#'
#' @param language Your desired language
#' @param level The level of errors:
#'
#'   * `all`: every messages (called `advice` by `a11y.css`)
#'   * `warning`: warnings and errors;
#'   * `obsolete`: obsolete stuff, warnings and errors;
#'   * `error`: only errors.
#'
#' @return An `htmltools` tag list with the `a11y.css` dependency.
#' @export
a11y_css <- function(
  language = c("en", "ar", "fr", "gr", "pt-br", "ru", "zh"),
  level = c("all", "error", "obsolete", "warning")
) {
  htmltools::tagList(html_dependency_a11y_css(language, level))
}

#' @describeIn a11y_css The `a11y.css` html dependency alone
#' @export
html_dependency_a11y_css <- function(
  language = c("en", "ar", "fr", "gr", "pt-br", "ru", "zh"),
  level = c("all", "error", "obsolete", "warning")
) {
  language <- match.arg(language)
  level = match.arg(level)

  style_file <- if (level == "all") {
    paste0("a11y-", language, ".css")
  } else {
    paste0("a11y-", language, "_", level, ".css")
  }

  htmltools::htmlDependency(
    name = "a11y.css",
    version = a11y_version(),
    package = "alix",
    src = "css",
    stylesheet = style_file,
    all_files = FALSE
  )
}

a11y_version <- function() {
  readLines(system.file("css", ".version", package = "alix"), warn = FALSE)
}
