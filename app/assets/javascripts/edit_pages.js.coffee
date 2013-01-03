$(document).ready ->
  editor = ace.edit("page_content")
  editor.setTheme("ace/theme/monokai") 
  editor.getSession().setMode("ace/mode/html")