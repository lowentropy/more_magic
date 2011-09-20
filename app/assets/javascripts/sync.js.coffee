$ ->
  methodMap =
    'create': 'POST'
    'update': 'PUT'
    'delete': 'DELETE'
    'read'  : 'GET'
  
  getUrl = (object) ->
    return null if !(object && object.url)
    if _.isFunction(object.url) then object.url() else object.url
  
  urlError = ->
    throw "A 'url' property or function must be specified"

  Backbone.sync = (method, model, options) ->
    type = methodMap[method]

    # Default JSON-request options.
    params = _.extend {
      type:         type,
      dataType:     'json',
      beforeSend:   (xhr) ->
        token = $('meta[name="csrf-token"]').attr('content')
        xhr.setRequestHeader('X-CSRF-Token', token) if token
    }, options
    
    params.url ?= getUrl(model) ? urlError()
    
    # Ensure that we have the appropriate request data.
    if !params.data && model && (method == 'create' || method == 'update')
      params.contentType = 'application/json'
    
      data = {}
      json = model.toJSON()
      
      delete json.updated_at
      delete json.created_at
      for param in model.hiddenParams ? []
        delete json[param]
    
      if model.paramRoot
        data[model.paramRoot] = json
      else
        data = json
    
      params.data = JSON.stringify(data)
    
    # Don't process data on a non-GET request.
    if (params.type != 'GET')
      params.processData = false;
    
    # Make the request.
    $.ajax(params)
