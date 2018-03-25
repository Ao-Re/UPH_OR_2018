library("lpSolveAPI")
print("Question 16")

#representing problem
#max 8s + 12b
#subject to
#s + 3b <= 3000
#7s + 6b <= 8400
#3s + b <= 3000

lprec <- make.lp(0,2)
lp.control(lprec, sense="max")
set.objfn(lprec, c(8, 12))
add.constraint(lprec, c(1, 3), "<=", 3000)
add.constraint(lprec, c(7, 6), "<=", 8400)
add.constraint(lprec, c(3, 1), "<=", 3000)
colnames(lprec)<-list("Shirts", "Blouse")

#display the matrix
print(lprec)

#solve
solve(lprec)

#get the maximum profit
print(sprintf("The maximum profit is $%s", get.objective(lprec)))

#get the solutions
get.variables(lprec)
print(sprintf("Optimal weekly production schedule for Burroughs = %1.f shirts and %1.f blouses", get.variables(lprec)[1], get.variables(lprec)[2]))
