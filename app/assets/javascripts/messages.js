window.updateMessages = function() {
  $.getJSON(window.location.pathname + ".json", function(messages)  {
    e = $('.messages');
    e.html('');
    for (i in messages){
      message = messages[i];
      e.append("<div class='message'><strong>" + message.username + ":</strong> " + message.content + "</div>");
    };
  });
};
