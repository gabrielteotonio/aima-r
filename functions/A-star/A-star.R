# Title: A* functions
# Author: Gabriel Teotonio
# Date: 2021-05-26

# Libs
library(useful)


is_solvable <- function(state) {
  # Return TRUE if the given state is solvable
  
  inversion <- 0
  
  for (i in 1:(length(state) - 1)) {
    for (j in (i + 1):length(state)) {
      if (state[[i]] > state[[j]] && state[[i]] != 0 && state[[j]] != 0) {
        inversion <- inversion + 1
      }
    }
  }
  
  return(inversion %% 2 == 0)
}


end_test <- function(state) {
  # Return TRUE if the given state is the goal
  
  goal <- list(1, 2, 3, 4, 5, 6, 7, 8, 0)
  
  return(sum(which(compare.list(state, goal) == FALSE)) == 0)
}


find_blank_square <- function(state) {
  # Return the index of the blank square in a given state
  
  return(which(state == 0))
}


actions <- function(state) {
  # Return a vector of valid actions to be executed in a given state
  
  possible_actions <- c('LEFT', 'RIGHT', 'UP', 'DOWN')
  position_blank_square <- find_blank_square(state)
  
  if (position_blank_square == 1 || position_blank_square == 4 || position_blank_square == 7) {
    possible_actions <- possible_actions[-which(possible_actions == 'LEFT')]
  }
  if (position_blank_square < 4) {
    possible_actions <- possible_actions[-which(possible_actions == 'UP')]
  } 
  if (position_blank_square == 3 || position_blank_square == 6 || position_blank_square == 9) {
    possible_actions <- possible_actions[-which(possible_actions == 'RIGHT')]
  } 
  if (position_blank_square > 6) {
    possible_actions <- possible_actions[-which(possible_actions == 'DOWN')]
  }
  
  return(possible_actions)
}

action_result <- function(state, action) {
  # Return a new state as result from an action (valid) and a given state
  
  position_blank_square <- find_blank_square(state)
  new_state <- state
  shift <- list('LEFT' = -1, 'RIGHT' = 1, 'UP' = -3, 'DOWN' = 3)
  
  shift_square <- position_blank_square + shift[[action]]
  aux <- new_state[[position_blank_square]]
  new_state[[position_blank_square]] <- new_state[[shift_square]]
  new_state[[shift_square]] <- aux
  
  return(new_state)
}


heuristic_fun <- function(state) {
  # Return the heuristic value for a given state
  
  goal <- list(1, 2, 3, 4, 5, 6, 7, 8, 0)
  
  return(length(which(compare.list(state, goal) == FALSE)) - 1)
}
  