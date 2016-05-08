module MyLinInterp

  export LinearInterpolation

  immutable LinearInterpolation #Inplementation as a type class
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
