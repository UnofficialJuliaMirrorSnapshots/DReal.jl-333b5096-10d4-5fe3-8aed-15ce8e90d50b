using DReal

b = ForallVar(Float64, -10.0, 10.0)
c = ForallVar(Float64,  -10.0, 10.0)
d = Var(Float64,-10.,10.)

f(x,y) = (x + y)*d + 6

add!(f(b,c) > 5.0)
@show is_satisfiable()
@show model(d)
