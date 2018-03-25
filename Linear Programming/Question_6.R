library("lpSolveAPI")
print("Question 6")

#representing problem
#max 40s+35b
#subject to
#3s + 4b <= 1200
#s <= 550
#b <= 580

lprec <- make.lp(0,2)
lp.control(lprec, sense="max")
set.objfn(lprec, c(40, 35))
add.constraint(lprec, c(3, 4), "<=", 1200)
add.constraint(lprec, c(1, 0), "<=", 550)
add.constraint(lprec, c(0, 1), "<=", 580)
colnames(lprec)<-list("Al Sheets", "Al Bars")

#display the matrix
print(lprec)

#solve
solve(lprec)

#get the maximum profit
print(sprintf("The maximum profit is $%s", get.objective(lprec)))

#get the solutions
get.variables(lprec)
print(sprintf("Optimal daily production mix for aluminum sheets = %1.f", get.variables(lprec)[1]))
print(sprintf("Optimal daily production mix for aluminum bars = %1.f", get.variables(lprec)[2]))