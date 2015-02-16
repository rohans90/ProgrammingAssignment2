# this function works like a class, it creates a list that contains 4 member
# functions: set, get, setinverse, getinverse. It uses <<- assignment operator so that 
#these Internal variables are not exposed to the outside environment

makeCacheMatrix <- function(x = matrix()) {
m <- NULL
set <- function(y)
{
x <<- y
m <<- NULL
}
get <- function() x
setInverse <- function(inverse) m <<- inverse
getInverse <- function() m
list (set = set, get = get, setInverse = setInverse, getInverse = getInverse)
}

cacheSolve <- function(x,...){
##Returns a matrix that is the inverse of 'x'
m <- x$getInverse()
if(!is.null(m)){
message("getting cached data")
return(m)
}
data <- x$get()
m <- solve(data,...)
x$setInverse(m)
m
}
#Test
#generate a random non singular matrix
test <- matrix(runif(9,1,100),3,3)
#generate the makeCacheMatrix object with the matrix
testCached <- makeCacheMatrix(test)

