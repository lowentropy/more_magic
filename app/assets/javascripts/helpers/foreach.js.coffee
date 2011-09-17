window.foreach = (list, fun) ->
  arr = []
  list.each (e) ->
    arr.push fun(e)
  arr.join ''
