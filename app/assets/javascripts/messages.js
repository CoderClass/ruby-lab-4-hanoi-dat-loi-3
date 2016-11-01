window.updateMessagesViaJSON = function() {
  console.log("inside updateMessagesViaJSON");
  $.getJSON(window.location.pathname + '.json', function(messages) {
    console.log(messages);
    document.querySelector('.message-box');
    // loop through the messages and render them
    // you can use $(".messages").append("blah") 
    // to add blah to the <div class="messages">...</div> element
  })
}