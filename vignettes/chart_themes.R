## ----message=FALSE, include = FALSE-------------------------------------------
# install package
library(g3viz)
library(cBioPortalData)
library(knitr)

## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
	echo = TRUE,
	collapse = TRUE,
	comment = "#>"
)

## ----include = TRUE-----------------------------------------------------------
# read data
mutation.dat <- readMAF("tables/tp53-msk_impact_2017.tsv", sep="\t")

## ----include = TRUE-----------------------------------------------------------
chart.options = g3Lollipop.theme(
      theme.name = "default",
      title.text = "default theme title",
      y.axis.label = "y-label",
      legend.title = "legend-title")

g3Lollipop(mutation.dat,
           plot.options = chart.options,
           btn.style = "blue",
           gene.symbol = "TP53")

## ----include = TRUE-----------------------------------------------------------
g3Lollipop(mutation.dat,
           plot.options =
             g3Lollipop.theme(theme.name = "blue",
                              title.text = "blue theme title",
                              y.axis.label = "y-label",
                              legend.title = "legend-title"),
           btn.style = "blue",
           gene.symbol = "TP53")

## ----include = TRUE-----------------------------------------------------------
g3Lollipop(mutation.dat,
           plot.options =
             g3Lollipop.theme(theme.name = "simple",
                              title.text = "simple theme title",
                              y.axis.label = "y-label",
                              legend.title = "legend-title"),
           btn.style = "blue",
           gene.symbol = "TP53")

## ----include = TRUE-----------------------------------------------------------
g3Lollipop(mutation.dat,
           plot.options =
             g3Lollipop.theme(theme.name = "cbioportal",
                              title.text = "cbioportal theme title",
                              y.axis.label = "y-label",
                              legend.title = "legend-title"),
           btn.style = "blue",
           gene.symbol = "TP53")

## ----include = TRUE-----------------------------------------------------------
g3Lollipop(mutation.dat,
           plot.options =
             g3Lollipop.theme(theme.name = "nature",
                              title.text = "nature theme title",
                              y.axis.label = "y-label",
                              legend.title = "legend-title"),
           btn.style = "blue",
           gene.symbol = "TP53")

## ----include = TRUE-----------------------------------------------------------

g3Lollipop(mutation.dat,
           plot.options =
             g3Lollipop.theme(theme.name = "nature2",
                              title.text = "nature2 theme title",
                              y.axis.label = "y-label",
                              legend.title = "legend-title"),
           btn.style = "blue",
           gene.symbol = "TP53")

## ----include = TRUE-----------------------------------------------------------
g3Lollipop(mutation.dat,
           plot.options =
             g3Lollipop.theme(theme.name = "ggplot2",
                              title.text = "ggplot2 theme title",
                              y.axis.label = "y-label",
                              legend.title = "legend-title"),
           btn.style = "blue",
           gene.symbol = "TP53")

## ----include = TRUE-----------------------------------------------------------
g3Lollipop(mutation.dat,
           plot.options =
             g3Lollipop.theme(theme.name = "dark",
                              title.text = "dark theme title",
                              y.axis.label = "y-label",
                              legend.title = "legend-title"),
           btn.style = "blue",
           gene.symbol = "TP53")

