## ----message=FALSE, include = FALSE-------------------------------------------
# install package
library(g3viz)
library(knitr)
library(kableExtra)

## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
	echo = TRUE,
	collapse = TRUE,
	comment = "#>"
)

## ----include = TRUE, message=FALSE, eval=FALSE--------------------------------
#  # load g3viz package
#  library(g3viz)

## ----include = TRUE-----------------------------------------------------------
# System file
maf.file <- system.file("extdata", "TCGA.BRCA.varscan.somatic.maf.gz", package = "g3viz")

# ============================================
# Read in MAF file
#   In addition to read data in, g3viz::readMAF function does
#     1. parse "Mutation_Class" information from the "Variant_Classification"
#        column (also named "Mutation_Type" in some files)
#     2. parse "AA_position" (amino-acid position) from the "HGVSp_Short" column 
#        (also named "amino_acid_change" in some files) (e.g., p.Q136P)
# ============================================
mutation.dat <- readMAF(maf.file)

## ----include = TRUE-----------------------------------------------------------
# ============================================
# Chart 1
# "default" chart theme
# ============================================
chart.options <- g3Lollipop.theme(theme.name = "default",
                                  title.text = "PIK3CA gene (default theme)")

g3Lollipop(mutation.dat,
           gene.symbol = "PIK3CA",
           plot.options = chart.options,
           output.filename = "default_theme")

## ----include=TRUE-------------------------------------------------------------
# load data
mutation.csv <- system.file("extdata", "ccle.csv", package = "g3viz")

# ============================================
# read in data
#   "gene.symbol.col"    : column of gene symbol
#   "variant.class.col"  : column of variant class
#   "protein.change.col" : colum of protein change column
# ============================================
mutation.dat <- readMAF(mutation.csv,
                        gene.symbol.col = "Hugo_Symbol",
                        variant.class.col = "Variant_Classification",
                        protein.change.col = "amino_acid_change",
                        sep = ",")  # column-separator of csv file

# set up chart options
plot.options <- g3Lollipop.options(
  # Chart settings
  chart.width = 600,
  chart.type = "pie",
  chart.margin = list(left = 30, right = 20, top = 20, bottom = 30),
  chart.background = "#d3d3d3",
  transition.time = 300,
  # Lollipop track settings
  lollipop.track.height = 200,
  lollipop.track.background = "#d3d3d3",
  lollipop.pop.min.size = 1,
  lollipop.pop.max.size = 8,
  lollipop.pop.info.limit = 5.5,
  lollipop.pop.info.dy = "0.24em",
  lollipop.pop.info.color = "white",
  lollipop.line.color = "#a9A9A9",
  lollipop.line.width = 3,
  lollipop.circle.color = "#ffdead",
  lollipop.circle.width = 0.4,
  lollipop.label.ratio = 2,
  lollipop.label.min.font.size = 12,
  lollipop.color.scheme = "dark2",
  highlight.text.angle = 60,
  # Domain annotation track settings
  anno.height = 16,
  anno.margin = list(top = 0, bottom = 0),
  anno.background = "#d3d3d3",
  anno.bar.fill = "#a9a9a9",
  anno.bar.margin = list(top = 4, bottom = 4),
  domain.color.scheme = "pie5",
  domain.margin = list(top = 2, bottom = 2),
  domain.text.color = "white",
  domain.text.font = "italic 8px Serif",
  # Y-axis label
  y.axis.label = "# of TP53 gene mutations",
  axis.label.color = "#303030",
  axis.label.alignment = "end",
  axis.label.font = "italic 12px Serif",
  axis.label.dy = "-1.5em",
  y.axis.line.color = "#303030",
  y.axis.line.width = 0.5,
  y.axis.line.style = "line",
  y.max.range.ratio = 1.1,
  # Chart title settings
  title.color = "#303030",
  title.text = "TP53 gene (customized chart options)",
  title.font = "bold 12px monospace",
  title.alignment = "start",
  # Chart legend settings
  legend = TRUE,
  legend.margin = list(left=20, right = 0, top = 10, bottom = 5),
  legend.interactive = TRUE,
  legend.title = "Variant classification",
  # Brush selection tool
  brush = TRUE,
  brush.selection.background = "#F8F8FF",
  brush.selection.opacity = 0.3,
  brush.border.color = "#a9a9a9",
  brush.border.width = 1,
  brush.handler.color = "#303030",
  # tooltip and zoom
  tooltip = TRUE,
  zoom = TRUE
)

g3Lollipop(mutation.dat,
           gene.symbol = "TP53",
           protein.change.col = "amino_acid_change",
           btn.style = "blue", # blue-style chart download buttons
           plot.options = plot.options,
           output.filename = "customized_plot")

## ----include=TRUE-------------------------------------------------------------
# Retrieve mutation data of "msk_impact_2017" from cBioPortal
mutation.dat <- getMutationsFromCbioportal("msk_impact_2017", "TP53")

# "cbioportal" chart theme
plot.options <- g3Lollipop.theme(theme.name = "cbioportal",
                                 title.text = "TP53 gene (cbioportal theme)",
                                 y.axis.label = "# of TP53 Mutations")

g3Lollipop(mutation.dat,
           gene.symbol = "TP53",
           btn.style = "gray", # gray-style chart download buttons
           plot.options = plot.options,
           output.filename = "cbioportal_theme")

## ----include=TRUE, echo=FALSE-------------------------------------------------
mutation.mapping.df = read.table("tables/mutation_mapping.tsv", sep="\t", header=TRUE, quote="")
kable(mutation.mapping.df) %>% 
  kable_styling(bootstrap_options = c("striped", "hover", "bordered", "condensed"), full_width = TRUE) %>%
  pack_rows("Inframe", 1, 4)  %>%
  pack_rows("Missense", 5, 5) %>%
  pack_rows("Truncating", 6, 12)  %>%
  pack_rows("Other", 13, 28)

## ----include = TRUE-----------------------------------------------------------
# Example 1: TP53 has single UniProt entry
hgnc2pfam("TP53", output.format = "list")

# Example 2: GNAS has multiple UniProt entries
#   `guess = TRUE`: the Pfam domain information of the longest 
#                   UniProt protein is returned
hgnc2pfam("GNAS", guess = TRUE)

## ----chunk-label, out.width = "620px", fig.align='center', fig.cap='**Figure 1.** List of color schemes supported by `g3viz`', echo = FALSE----
knitr::include_graphics("figures/color_scheme.png")

## ----include=TRUE, echo=FALSE-------------------------------------------------
chart.options.df = read.table("tables/chart_options.tsv", sep="\t", header=TRUE, quote="", comment.char="")
kable(chart.options.df, caption = "Chart options of `g3viz`") %>% 
  kable_styling(bootstrap_options = c("striped", "hover", "bordered", "condensed"), full_width = TRUE) %>%
  pack_rows("Chart settings", 1, 5)  %>%
  pack_rows("Lollipop track settings", 6, 20) %>%
  pack_rows("Domain annotation track settings", 21, 29) %>%
  pack_rows("Y-axis settings", 30, 38) %>%
  pack_rows("Chart title settings", 39, 43) %>%
  pack_rows("Chart legend settings", 44, 47) %>%
  pack_rows("Brush selection tool settings", 48, 53) %>%
  pack_rows("Tooltip and zoom tools", 54, 55)

## ----include=TRUE-------------------------------------------------------------
sessionInfo()

