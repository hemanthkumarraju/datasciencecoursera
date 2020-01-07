## Functions to create a special "Matrix" with set and get funcitons for the 
## value and set and get for the inverse of the matrix and a function to 
## calculate and cache the inverse of the special "Matrix"

## creates a special "Matrix", which is really a list containing a function to
## set and get the matrix value and to set and get the inverse of this matrix

makeCacheMatrix <- function(x = matrix()) {
    inverseMatrix <- NULL
    set <- function(y) {
        x <<- y
        inverseMatrix <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) inverseMatrix <<- inverse
    getInverse <- function() inverseMatrix
    list(set = set, get = get, 
         setInverse = setInverse, 
         getInverse = getInverse)
}


## calculates and caches the inverse of the special "Matrix" 
## first checks if an inverse already been calculated

cacheSolve <- function(x, ...) {
        inverseMatrix <- x$getInverse()
        if(!is.null(inverseMatrix)) {
            message("getting cached data")
            return(inverseMatrix)
        }
        data <- x$get()
        inverseMatrix <- solve(data)
        x$setInverse(inverseMatrix)
        inverseMatrix
}
