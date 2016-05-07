#using PyPlot

function get_interpolation(xs, ys)
  function f(x)
    xs[1] <= x <= xs[end] || throw(DomainError())
    i = searchsortedlast(xs, x)
    #@show i
    if i == length(xs)
      return ys[end]
    else
      return ys[i] + (ys[i+1] - ys[i]) / (xs[i+1] - xs[i]) * (x - xs[i])
    end
  end
end

immutable Interpolation
  grids
  vals
end

function Base.call(a::Interpolation, x)
  f = get_interpolation(a.grids, a.vals)
  return map(f, x)
end

f = Interpolation(10:0.1:20, 0:0.1:10)
println(f(12.5))
println(f([12, 13, 14, 15]))
#f = get_interpolation([1, 2], [2, 0])
#plot(1:0.1:2, map(f, 1:0.1:2))
