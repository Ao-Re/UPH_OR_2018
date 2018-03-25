library("lpSolveAPI")
print("Question 17")

#representing problem
#max 50c + 100d
#subject to
#2c + 5d <= 400
#c <= 120
#d <= 60
#11c + 15d <= 1650

lprec <- make.lp(0,2)
lp.control(lprec, sense="max")
set.objfn(lprec, c(50, 100))
add.constraint(lprec, c(2, 5), "<=", 400)
add.constraint(lprec, c(1, 0), "<=", 120)
add.constraint(lprec, c(0, 1), "<=", 600)
add.constraint(lprec, c(11, 15), "<=", 1650)
colnames(lprec)<-list("Chair", "Desk")

#display the matrix
print(lprec)

#solve
solve(lprec)

#get the maximum profit
print(sprintf("The maximum profit is $%s", get.objective(lprec)))

#get the solutions
get.variables(lprec)
print(sprintf("Optimal production mix = %1.f chairs and %1.f desks", get.variables(lprec)[1], get.variables(lprec)[2]))
