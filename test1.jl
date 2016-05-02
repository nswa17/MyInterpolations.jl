using PyPlot

function get_interpolation(xs, ys)
  function f(x)
    @assert xs[1] <= x <= xs[end]
    i = searchsortedlast(xs, x)
    @show i
    if i == length(xs)
      return ys[end]
    else
      return ys[i] + (ys[i+1] - ys[i]) / (xs[i+1] - xs[i]) * (x - xs[i])
    end
  end
end

f = get_interpolation([1, 2], [2, 0])
plot(1:0.1:2, map(f, 1:0.1:2))
