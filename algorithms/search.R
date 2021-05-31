# Title: A* search
# Author: Gabriel Teotonio
# Date: 2021-05-27

# use message() to print


A_star_search <- function(initial_state, h = "manhattan") {
  if (!is_solvable(initial_state)) {
    stop("The problem for this initial state is not solvable.")
  }
  
  frontier <- list(initial_state)
  explored_set <- list()
  
  while (length(frontier) != 0) {
    node <- frontier[[1]]
    frontier[[1]] <- NULL
    
    if (end_test(node)) {
      message("The algorithm found a solution")
      return(node)
    }
    explored_set <- append(explored_set, list(node))
    
    valid_actions <- actions(node)
    for (actuator in 1:length(valid_actions)) {
      new_state <- action_result(node, valid_actions[actuator])
      
      if (new_state)
    }
  }
}




for child in node.expand(problem):
  if child.state not in explored and child not in frontier:
  frontier.append(child)
elif child in frontier:
  if f(child) < frontier[child]:
  del frontier[child]
frontier.append(child)
return None