





## @knitr leaflet1

library(leaflet)
m = leaflet() %>% addTiles()
m  # a map with the default OSM tile layer

## @knitr leaflet2
m = leaflet() %>% 
addTiles() %>%
setView(32.23, -110.95, zoom = 17)
m





## @knitr linegraph

library(dygraphs)
dygraph(nhtemp, main = "New Haven Temperatures") %>% 
  dyRangeSelector(dateWindow = c("1920-01-01", "1960-01-01"))



## @knitr networks

library(networkD3)
data(MisLinks, MisNodes)
forceNetwork(Links = MisLinks, Nodes = MisNodes, Source = "source",
             Target = "target", Value = "value", NodeID = "name",
             Group = "group", opacity = 0.4)




## @knitr linegraph2

library(htmltools)
library(htmlwidgets)
library(metricsgraphics)
library(RColorBrewer)

tmp <- data.frame(year=seq(1790, 1970, 10), uspop=as.numeric(uspop))

tmp %>%
  mjs_plot(x=year, y=uspop) %>%
  mjs_line() %>%
  mjs_add_marker(1850, "Something Wonderful") %>%
  mjs_add_baseline(150, "Something Awful")


## @knitr linegraph3

tmp %>%
  mjs_plot(x=uspop, y=year, width=500, height=400) %>%
  mjs_bar() %>%
  mjs_axis_x(xax_format = 'plain')



## @knitr linegraph4

mtcars %>%
  mjs_plot(x=wt, y=mpg, width=600, height=500) %>%
  mjs_point(color_accessor=carb, size_accessor=carb) %>%
  mjs_labs(x="Weight of Car", y="Miles per Gallon")



## @knitr linegraph5

mtcars %>%
  mjs_plot(x=wt, y=mpg, width=600, height=500) %>%
  mjs_point(color_accessor=cyl,
            x_rug=TRUE, y_rug=TRUE,
            size_accessor=carb,
            size_range=c(5, 10),
            color_type="category",
            color_range=brewer.pal(n=11, name="RdBu")[c(1, 5, 11)]) %>%
  mjs_labs(x="Weight of Car", y="Miles per Gallon") %>%
  mjs_add_legend(legend="X")



## @knitr linegraph6

mtcars %>%
  mjs_plot(x=wt, y=mpg, width=600, height=500) %>%
  mjs_point(least_squares=TRUE) %>%
  mjs_labs(x="Weight of Car", y="Miles per Gallon")



## @knitr linegraph7

set.seed(1492)
stocks <- data.frame(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4))

stocks %>%
  mjs_plot(x=time, y=X) %>%
  mjs_line() %>%
  mjs_add_line(Y) %>%
  mjs_add_line(Z) %>%
  mjs_axis_x(xax_format="date") %>%
  mjs_add_legend(legend=c("X", "Y", "Z"))




## @knitr 3dplot

library(threejs)
z <- seq(-10, 10, 0.01)
x <- cos(z)
y <- sin(z)
scatterplot3js(x,y,z, color=rainbow(length(z)))



