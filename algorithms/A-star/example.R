# Title: A* search running examples
# Author: Gabriel Teotonio
# Date: 2021-05-31

# Ref: https://www.andrew.cmu.edu/course/15-121/labs/HW-7%20Slide%20Puzzle/lab.html
# board     \ number of moves \ solution
# 123405786	\ 2	              \	RD
# 123745086	\ 4	              \	URRD
# 123480765	\ 5	              \	DLURD
# 413726580	\ 8	              \	LLUURDDR
# 162530478	\ 9	              \	LURDLLDRR
# 512630478	\ 11              \ LLURRDLLDRR

# suggested on question's pdf: list(1,8,2,4,3,0,7,6,5)

initial_state <- list(1,2,3,4,0,5,7,8,6)

result <- A_star_search(initial_state)

result$Cost
result$Actions