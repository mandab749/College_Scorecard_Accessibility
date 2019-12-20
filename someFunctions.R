# Notice that percent pell grant is a single column.

# Accessibility1 <- dataframe[column_name]

# We want a function that will allow us to transform one probability into another.
# Here we just calculate the variances of colleges.

variance_of_colleges <- function(dataframe, column_names_vector){
  #We can change this to simply work on vectors, or whatever we need for functionality
  # Only like this for "backbone".
  atc  <- dataframe[column_names_vector[0]] #average tuition cost
  ac <- list()                              # average cost of different income groups as a list

  ac[[1]] <- dataframe[column_names_vector[1]] #average cost for lowest income group
  ac[[2]] <- dataframe[column_names_vector[2]]
  ac[[3]] <- dataframe[column_names_vector[3]]
  ac[[4]] <- dataframe[column_names_vector[4]]
  ac[[5]] <- dataframe[column_names_vector[5]] #average cost for highest income group

  burden <- list()                              # list for the burden of different groups.
  for (i in 1:5){
    burden[[i]] <- (ac[[i]] - atc)/atc
    rm(ac[[i]])    # This removes the data from our workspace
  }

  # Here we calculate a variance for the colleges:
  # I think I have another possible measure that accounts for inversions!
  # This is temporary as proof of concept!
  cumalitive <- rep(0, nrow(dataframe))
  for (i in 1:5){
    cumalitive <- abs(burden[[i]])
  }
  return(cumalitive)
}

resizing <- function(global_max, global_min, college_variance){
   #This function remaps the points between [min, max] to points between [0,1]
   (global_min-college_variance)/(global_min-global_max)
}

Homeomorphism <- function(time, firstVar, secondVar, unsmooth = TRUE){
  # First Variable and Second Variable are the percentages of accessibility.
  # At time 0, we have firstVar. At time 1, we have second var
  if (unsmooth){
    newvar <- (1-time)*firstVar + time*secondVar
  } else {
  newvar <- (1-((-1/2 * cos(time*pi)) + 1/2))*firstVar + ((-1/2 * cos(time*pi)) + 1/2) * secondVar
  }
}
