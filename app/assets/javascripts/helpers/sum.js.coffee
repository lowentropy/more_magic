_.sum = (list, f) ->
  sum = 0
  _.each list, (elem) ->
    sum += parseInt(f?(elem) ?elem)
  sum