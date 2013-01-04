$(document).ready ->
  editor = ace.edit("editor")
  editor.getSession().setMode("ace/mode/html")
  content = editor.container.attributes['content'].nodeValue
  editor.setValue(content, -1)


  $(':submit').click ->
    newContent = editor.getValue()
    $('#page_content').val(newContent)