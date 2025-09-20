; Alpine.js attribute value injections
((attribute
  (attribute_name) @_attr
  (quoted_attribute_value
    (attribute_value) @injection.content))
  (#match? @_attr "^x-(data|show|if|for|model|text|html|bind|on|transition|effect|init|ref)$")
  (#set! injection.language "javascript"))

; Alpine.js event handlers
((attribute
  (attribute_name) @_attr
  (quoted_attribute_value
    (attribute_value) @injection.content))
  (#match? @_attr "^@(click|submit|keydown|keyup|change|input|mouseenter|mouseleave|focus|blur|scroll)")
  (#set! injection.language "javascript"))

; Alpine.js x-on: handlers
((attribute
  (attribute_name) @_attr
  (quoted_attribute_value
    (attribute_value) @injection.content))
  (#match? @_attr "^x-on:")
  (#set! injection.language "javascript"))

; Alpine.js :class and other shorthand bindings
((attribute
  (attribute_name) @_attr
  (quoted_attribute_value
    (attribute_value) @injection.content))
  (#match? @_attr "^:(class|style|disabled|checked|required|readonly|hidden|selected)")
  (#set! injection.language "javascript"))