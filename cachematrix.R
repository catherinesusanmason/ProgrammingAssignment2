## The following functions will create a "special matrix"
## Create the inverse and cache the inverse
## When run if a value exists in cache, this is retrieved
## Else a new inverse if calculated and set in cache

makeCacheMatrix <- function(x = matrix()) {
  # This function creates a special "matrix" object that can cache its inverse.
  z<- NULL
  set <- function(y) {
    x <<- y
    z <<- NULL
    ## assign value of y to x and NULL value to m.  Double arrow assignment operator used
    ## to set value in parent environment
  }
  
  get<- function() x
  setinverse<- function(solve) z <<- solve 
  getinverse<- function() z
  ## create list containing get, set, setinverse , getinverse
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse) 
}

cacheSolve <- function(x, ...) {
  ## This function will return a matrix that is the inverse of 'x'
  z <- x$getinverse()
  ## this command retrieves latest value of inverse
  if(!is.null(z)) {
    message("getting cached data")
    ## If inverse exists, gets inverse from the cache
    return(z)
  }
  data <- x$get()
  z <- solve(data, ...)
  ## if no cached inverse exists, calculates inverse
  message("calculating inverse")
  x$setinverse(z)
  ##set value in cache to calculated inverse
  Z
}