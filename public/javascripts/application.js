// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
function deleteUser(userId) {
  if(confirm('Are you sure?')) {
    new $.ajaxSend(
       '/books/'+userId, {
         method : 'delete',
         on200 : function(){ Effect.DropOut('book_'+userId) },
         on500 : function(xhr){ alert(xhr.responseText) }
    });
  }
  return false;
}
$(document).ajaxSend(function(event, request, settings) {
  if (typeof(AUTH_TOKEN) == "undefined") return;
  // settings.data is a serialized string like "foo=bar&baz=boink" (or null)
  settings.data = settings.data || "";
  settings.data += (settings.data ? "&" : "") + "authenticity_token=" + encodeURIComponent(AUTH_TOKEN);
});


jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")} 
})

