#  This is a manifest file that'll be compiled into application.js, which will include all the files
#  listed below.
# 
#  Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
#  or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
# 
#  It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
#  the compiled file.
# 
#  WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
#  GO AFTER THE REQUIRES BELOW.
# 
#= require jquery
#= require jquery_ujs
#= require bootstrap
#= require jqueryFileTree
#= require_self

window.setEditor = ->
  editor = ace.edit("editor")
  editor.getSession().setMode("ace/mode/html")
  content = editor.container.attributes['content'].nodeValue
  editor.setValue(content, -1)


  $(':submit').click ->
    newContent = editor.getValue()
    $('#page_content').val(newContent)

$(document).ready ->
  $('#fileTree').fileTree { root: 'app/views/pages/', script: '/admin/pages_content' }, (file) ->
    url = file.substring(16,file.length - 15);
    $.ajax(
      url: '/admin/pages/'+ url,
      success: (data) ->
        $('#main-content').html(data)
        setEditor()
    )
