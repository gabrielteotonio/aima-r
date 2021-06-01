# Title: A* search
# Author: Gabriel Teotonio
# Date: 2021-05-27


A_star_search <- function(initial_state, h = "manhattan") {
  if (!is_solvable(initial_state)) {
    stop("The problem for this initial state is not solvable.")
  }
  
  frontier <- list(heuristic_value = list(), 
                   states = list(), 
                   path_cost = list(0),
                   path = list(),
                   action = list("Initial"))
  frontier$states <- list(initial_state)
  explored_set <- list()
  
  while (length(frontier$states) != 0) {
    node <- frontier$states[[1]]
    cost <- frontier$path_cost[[1]]
    action <- frontier$action[[1]]
    
    frontier$states[[1]] <- NULL
    frontier$heuristic_value[[1]] <- NULL
    frontier$path_cost[[1]] <- NULL
    frontier$action[[1]] <- NULL
    
    if (end_test(node)) {
      print("The algorithm found a solution.")
      return(list("Goal_node" = node,
                  "Cost" = cost,
                  "Actions" = action))
    } else {
      print("The algorithm will expand the current node.")
    }
    
    explored_set <- append(explored_set, list(node))
    
    valid_actions <- actions(node)
    
    if (length(valid_actions) != 0) {
      for (actuator in 1:length(valid_actions)) {
        new_state <- action_result(node, valid_actions[actuator])
        
        if (!lives_in(new_state, frontier$states) && !lives_in(new_state, explored_set)) {
          frontier <- append_ordered(state = new_state, 
                                     set = frontier, 
                                     cost = cost,
                                     action = action,
                                     current_action = valid_actions[actuator])
        } 
      } 
    }
    
    print("The current frontier is:")
    print(lapply(frontier$states, function(x) matrix(x, byrow = TRUE, 3, 3)))
  }
}



