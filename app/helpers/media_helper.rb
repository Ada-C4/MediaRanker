module MediaHelper

# Returns a dynamic path based on the provided parameters
def media_path(type = "medium", medium = nil, action = nil)
  send "#{format_media(action, type, medium)}_path", medium
end

def format_media(action, type, medium)
  action || medium ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
end

def format_action(action)
  action ? "#{action}_" : ""
end

end
