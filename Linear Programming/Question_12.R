library("lpSolveAPI")
print("Question 12")

#representing problem
#max 8a + 5b
#subject to
#2a + b <= 400 
#a <= 150
#b <= 200

lprec <- make.lp(0,2)
lp.control(lprec, sense="max")
set.objfn(lprec, c(8, 5))
add.constraint(lprec, c(2, 1), "<=", 400)
add.constraint(lprec, c(1, 0), "<=", 150)
add.constraint(lprec, c(0, 1), "<=", 200)
colnames(lprec)<-list("Type I Hat", "Type II Hat")

#display the matrix
print(lprec)

#solve
solve(lprec)

#get the maximum profit
print(sprintf("The maximum profit is $%s", get.objective(lprec)))

#get the solutions
get.variables(lprec)
print(sprintf("Optimal production mix for Type I hat = %1.f", get.variables(lprec)[1]))
print(sprintf("Optimal production mix for Type II hat = %1.f", get.variables(lprec)[2]))
