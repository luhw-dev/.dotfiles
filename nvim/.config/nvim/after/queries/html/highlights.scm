; Inherits: html

; Alpine.js directives
((attribute_name) @keyword.directive
  (#match? @keyword.directive "^x-(data|show|if|for|model|text|html|bind|on|transition|effect|init|ref|cloak|ignore)"))

; Alpine.js event handlers
((attribute_name) @keyword.directive
  (#match? @keyword.directive "^@(click|submit|keydown|keyup|change|input|mouseenter|mouseleave|focus|blur|scroll)"))

; Alpine.js x-on: handlers
((attribute_name) @keyword.directive
  (#match? @keyword.directive "^x-on:"))

; Alpine.js shorthand bindings
((attribute_name) @keyword.directive
  (#match? @keyword.directive "^:(class|style|disabled|checked|required|readonly|hidden|selected)"))