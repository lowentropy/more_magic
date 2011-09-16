# (backbone-) Brace
# -----------------

# Find a JST template and return a new template function
# that uses the toJSON() of a backbone `Model` as the subject
# of the template.
Brace = (name) ->
  template = JST[name]
  return (model) ->
    template model.toJSON()

# Export `Brace` into the global scope.
(exports ? window).Brace = Brace
