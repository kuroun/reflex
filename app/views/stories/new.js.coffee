$(document.body).append("<%=j render 'stories/modal_form', locals: { form_name: 'New Story'}%>")
$('#storyForm').modal 'show'
