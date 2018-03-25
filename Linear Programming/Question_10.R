library("lpSolveAPI")
print("Question 10")


#representing problem
#max g + 1.35w
#subject to
#0.2g + 0.4w <=60
#g <= 200
#w <= 120

lprec <- make.lp(0,2)
lp.control(lprec, sense="max")
set.objfn(lprec, c(1, 1.35))
add.constraint(lprec, c(0.2, 0.4), "<=", 60)
add.constraint(lprec, c(1, 0), "<=", 200)
add.constraint(lprec, c(0, 1), "<=", 120)
colnames(lprec)<-list("Grano", "Wheatie")

#display the matrix
print(lprec)

#solve
solve(lprec)

#get the maximum profit
print(sprintf("The maximum profit is $%s", get.objective(lprec)))

#get the solutions
get.variables(lprec)
print(sprintf("Optimal product allocation for Grano = %1.f", get.variables(lprec)[1]))
print(sprintf("Optimal product allocation for Wheatie = %1.f", get.variables(lprec)[2]))
print(sprintf("In percentage =  %1.f%% for Grano and %1.f%% for Wheatie", get.variables(lprec)[1]/250*100, get.variables(lprec)[2]/250*100))