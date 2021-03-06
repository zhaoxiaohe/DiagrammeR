% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/select_nodes.R
\name{select_nodes}
\alias{select_nodes}
\title{Select nodes in a graph}
\usage{
select_nodes(graph, conditions = NULL, set_op = "union", nodes = NULL)
}
\arguments{
\item{graph}{a graph object of class
\code{dgr_graph}.}

\item{conditions}{an option to use filtering
conditions for the retrieval of nodes.}

\item{set_op}{the set operation to perform upon
consecutive selections of graph nodes. This can
either be as a \code{union} (the default), as an
intersection of selections with \code{intersect},
or, as a \code{difference} on the previous
selection, if it exists.}

\item{nodes}{an optional vector of node IDs for
filtering the list of nodes present in the graph.}
}
\value{
a graph object of class \code{dgr_graph}.
}
\description{
Select nodes from a graph object of
class \code{dgr_graph}.
}
\examples{
# Create a node data frame (ndf)
ndf <-
  create_node_df(
    n = 4,
    type = c("a", "a", "z", "z"),
    label = TRUE,
    value = c(3.5, 2.6, 9.4, 2.7))

# Create an edge data frame (edf)
edf <-
  create_edge_df(
    from = c(1, 2, 3),
    to = c(4, 3, 1),
    rel = c("a", "z", "a"))

# Create a graph with the ndf and edf
graph <-
  create_graph(
    nodes_df = ndf,
    edges_df = edf)

# Explicitly select nodes `1` and `3`
graph <-
  graph \%>\%
  select_nodes(nodes = c(1, 3))

# Verify that the node selection has been made
# using the `get_selection()` function
get_selection(graph)
#> [1] 1 3

# Select nodes based on the node `type`
# being `z`
graph <-
  graph \%>\%
  clear_selection() \%>\%
  select_nodes(
    conditions = "type == 'z'")

# Verify that an node selection has been made, and
# recall that the `3` and `4` nodes are of the
# `z` type
get_selection(graph)
#> [1] 3 4

# Select edges based on the node value attribute
# being greater than 3.0 (first clearing the current
# selection of nodes)
graph <-
  graph \%>\%
  clear_selection() \%>\%
  select_nodes(
    conditions = "value > 3.0")

# Verify that the correct node selection has been
# made; in this case, nodes `1` and `3` have values
# for `value` greater than 3.0
get_selection(graph)
#> [1] 1 3
}
