module MyLinInterp

  export LinearInterpolation, get_interpolation
  """
  Inplementation as a higher order function
  """
  function get_interpolation(grid, vals)
    function f(x)
      grid[1] <= x <= grid[end] || throw(DomainError()) # throw an error if input x is out of domain
      i = searchsortedlast(grid, x) # find the first index i in grid where grid[i] >= x
      if i == length(grid)
        return vals[end]
      else
        return vals[i] + (vals[i+1] - vals[i]) / (grid[i+1] - grid[i]) * (x - grid[i])
      end
    end
    return f
  end

  """
  Inplementation as a type class
  """

  immutable LinearInterpolation
    grid
    vals
  end

  function call(a::LinearInterpolation, xs)
    map(xs) do x
      a.grid[1] <= x <= a.grid[end] || throw(DomainError()) # throw an error if input x is out of domain

      i = searchsortedlast(a.grid, x)
      if i == length(a.grid)
        return a.vals[end]
      else
        return a.vals[i] + (a.vals[i+1] - a.vals[i]) / (a.grid[i+1] - a.grid[i]) * (x - a.grid[i])
      end
    end
  end

end
