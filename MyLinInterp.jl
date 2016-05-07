module MyLinInterp

export LinearInterpolation, get_interpolation
"""
Inplementation as a higher order function
"""
function get_interpolation(xs, ys)
  function f(x)
    xs[1] <= x <= xs[end] || throw(DomainError()) # throw an error if input x is out of domain
    i = searchsortedlast(xs, x) # find the first index i in xs where xs[i] >= x
    if i == length(xs)
      return ys[end]
    else
      return ys[i] + (ys[i+1] - ys[i]) / (xs[i+1] - xs[i]) * (x - xs[i])
    end
  end
end

"""
Inplementation as a type class
"""

immutable LinearInterpolation
  grids
  vals
end

function Base.call(a::LinearInterpolation, x)
  function f(x)
    i = searchsortedlast(a.grids, x)
    a.grids[1] <= x <= a.grids[end] || throw(DomainError()) # throw an error if input x is out of domain

    if i == length(a.grids)
      return a.vals[end]
    else
      return a.vals[i] + (a.vals[i+1] - a.vals[i]) / (a.grids[i+1] - a.grids[i]) * (x - a.grids[i])
    end
  end
  return map(f, x)
end

end
