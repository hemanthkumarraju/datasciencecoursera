## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## So basically what this function does is to set & get the value of both the 
## matrix and its inverse
## Similar to the mean function, it just need to get the matrix inverse instead of mean
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


## Write a short comment describing this function
## This function calculates the matrix input by the above "makeCacheMatrix" function
## If the inverse matrix is already calculated, then it will get the result from 
## cache instead of calculating it again
cacheSolve <- function(x, ...) {
        i <- x$getinverse()
        if(!is.null(i)) {
                message("getting cached data")
                return(i)
        }
        data <- x$get()
        i <- solve(data, ...)
        x$setinverse(i)
        i
        ## Return a matrix that is the inverse of 'x'
}
