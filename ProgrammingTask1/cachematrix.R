## Below are two functions that are used to create 
## a special object that stores a matrix and cache's its inverse.


## The first function, makeCacheMatrix creates a special
## "matrix" object, which contains functions to; 
## set the value of the stored matrix
## get the value of the stored matrix
## compute the inverse of the matrix
## get the Inverse of the matrix

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setinv <- function(inverse) inv <<- inverse 
    getinv <- function() inv
    
    list(set = set, get = get, 
         setinv = setinv, 
         getinv = getinv)

}


## The following function computes the inverse of the special "matrix" created with the
## makeCacheMatrix function. However, it first checks to see if the inverse has already been
## computed, If so, it gets the inverse from the cache and skips the computation.
## Otherwise, it computes the inverse of the matrix and sets the value of the inverse in the
## cache via the setinv function.


cacheSolve <- function(x, ...) {
    ## This function returns a matrix that is the inverse of 'x'
    inv <- x$getinv()
    if (!is.null(inv)){
        return(inv)
    }
    matdata <- x$get()
    inv <- solve(matdata, ...)
    x$setinv(inv)
    inv
    
}
