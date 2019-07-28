## A pair of functions to cache the inverse of a matrix. 
## The two functions are used to create a special object that stores a matrix 
## and cache's its inverse.

## For the purpose of this assignment, it is assumed that 
## the matrix supplied is always invertible.

## The first function makeCacheMatrix() creates a special matrix object that can cache its inverse.
## makeCacheMatrix() creates a special matrix object, which is really a list containing a function to
## set the value of the matrix, get the value of the matrix, set the value of the inverse and 
## get the value of the inverse.

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) inv <<- inverse
  getinverse <- function() inv
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## The second function cacheSolve() computes the inverse of the special "matrix" returned by makeCacheMatrix above. 
## If the inverse has already been calculated (and the matrix has not changed), then the cachesolve 
## should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
    
    ## Return the matrix if the inverse has already been calculated
    if(!is.null(inv)) {
      message("Getting cached data")
      return(inv)
    }
    data <- x$get()
    inv <- solve(data, ...)
    x$setinverse(inv)
    inv
}

