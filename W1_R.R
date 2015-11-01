# Wk 1 solution
# Student: Mauricio Sanchez
# Date: Nov 1st 2015

# 1. Write a loop that calculates 12-factorial.
f <- 12
c <- 1
x <- 12

while(c < 12)
{
  x <- (x * (f-c))
  c <- c + 1
}
print(x)
# 2. Show how to create a numeric vector that contains the sequence from 20 to 50 by 5.

x = 20
seq(x, 50, 5)

# 3. Show how to take a trio of input numbers a, b, and c and implement the quadratic equation
a = 2
b = -4
c = -3

r1 <- (-b + sqrt(b^2 - 4*a*c)) / (2*a)
r2 <- (-b - sqrt(b^2 - 4*a*c)) / (2*a)

result <- c(r1, r2)
print(result)
