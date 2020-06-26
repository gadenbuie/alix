# alix

<!-- badges: start -->
<!-- badges: end -->

Warn about accessibility issues in html documents and apps.  
An R wrapper for [a11y.css](https://github.com/ffoodd/a11y.css/)

## Installation

You can install the released version of **alix** from GitHub.

``` r
# install.packages("remotes")
remotes::install_github("gadenbuie/alix")
```

## Usage

To use, simply add `alix::a11y_css()` to your Shiny app's UI or 
in a chunk in an HTML R Markdown document.

````markdown
```{r test-accessibility, echo=FALSE}
alix::a11y_css()
```
````

There are a number of supported languages,
and you can choose the level of accessibility tests and warnings,
listed here from most to least tests:

* `all`: every messages (called `advice` by `a11y.css`)
* `warning`: warnings and errors;
* `obsolete`: obsolete stuff, warnings and errors;
* `error`: only errors.

## a11y.css

For more information, check out

- [the a11y.css GitHub page](https://github.com/ffoodd/a11y.css)

- [the a11y.css wiki](https://github.com/ffoodd/a11y.css/wiki)
