## Put comments here that give an overall description of what your
## functions do

## The makeCacheMatrix takes a matrix as input an create a list of function
## to interact with the object
## this function stores 2 matrices: x=original matrix, i=inverse of x
## set stores the "original" matrix
## get retrieve the "original" matrix
## setinverse stores the inverse matrix
## getinverse retrieve the inverse matrix

makeCacheMatrix <- function(x = matrix()) {
  i <- NULL
  set <- function(y) {
    x <<- y
    i <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) i <<- inverse
  getinverse <- function() i
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


## x must be an object of "makeCacheMatrix class" eventhough it is eventually an R list
## if $getinverse() is NULL it means that the matrix has never been "solved"
## hence solved in i variable and stored with setinverse for future use
## else
## just printing a message for this sheer assignment otherwise useless

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
  i <- x$getinverse()
  if(is.null(i)) {
    i <- solve(x$get(), ...)
    x$setinverse(i)
  }
  else
  {
    message("getting cached data")
    }
  i
}
