# run all programs from beginning to end 



# paths 

# Search for basepath using rprojroot. If that fails, search for a directory called R, set working directory within that directory, and try again.

find_basepath <- function() {
  # First, try to find project root using rprojroot
  mywd <- getwd()
  tryCatch({
    proj_path <- rprojroot::find_root(rprojroot::has_file("example-R-data.Rproj"))
    return(proj_path)
  }, error = function(e) {
    # If rprojroot fails, look for R directory
    r_dir <- file.path(mywd, "R")
    message(paste0("Trying directory ", r_dir))
    
    if (dir.exists(r_dir)) {
      setwd(r_dir)
      proj_path <- rprojroot::find_root(rprojroot::has_file("example-R-data.Rproj"))
      setwd(mywd)
      return(proj_path)
    } else {
      stop("Could not find project root or R directory")
    }
  })
}

# Usage
basepath <- find_basepath()
message(paste0("Basepath is ", basepath))

# Main directories

outputdata <- file.path(basepath,"data","outputdata") # this is where you would write the data you create in this project
results <- file.path(basepath,"tables")       # All tables for inclusion in your paper go here
programs <- file.path(basepath,"programs")    # All programs (which you might <- file.path(include") are to be found here


dtam  <- file.path(outputdata,"pumsak.dta")  # Stata PUMS merged data 



source(file.path(programs,"02_table1.R"),echo=TRUE)


