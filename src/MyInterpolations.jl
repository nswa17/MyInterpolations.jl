module MyInterpolations

  export LinearInterpolation

  struct LinearInterpolation # Inplementation as a type class
    grid::Array
    vals::Array
  end

  function (a::LinearInterpolation)(x)
      #a.grid[1] <= x <= a.grid[end] || throw(DomainError()) # throw an error if input x is out of domain
    if x < a.grid[1]
        return a.vals[1]
        elseif x > a.grid[end]
        return a.vals[end]
    end

    i = searchsortedlast(a.grid, x) # find the first index i in grid where grid[i] >= x
    if i == length(a.grid)
        return a.vals[end]
    else
        return a.vals[i] + (a.vals[i+1] - a.vals[i]) / (a.grid[i+1] - a.grid[i]) * (x - a.grid[i])
    end
  end

end
