# QP example
#
#    minimize 2 x^2 + y^2 + xy + x + y
#
#       s.t.  x, y >= 0
#             x + y = 1
#
#    solution: (0.25, 0.75), objv = 1.875
#

using Xpress 

model = Xpress.Model("qp_02")

add_cvars!(model, [1., 1.], 0., Inf)
#update_model!(model)

add_qpterms!(model, [1, 1, 2], [1, 2, 2], [2., 1., 1.])
add_constr!(model, [1., 1.], '=', 1.)
#update_model!(model)

println(model)

optimize(model)

println("sol = $(get_solution(model))")
println("obj = $(get_objval(model))")
