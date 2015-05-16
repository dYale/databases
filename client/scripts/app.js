var app = {}

app.init = function() {
  this.rooms = {}
	this.server = 'http://127.0.0.1:3000';
	this.$roomSelect = $('#roomSelect');
	this.$chats = $('#chats');
	this.$formMessage = $('#formMessage');
  this.pollMessages();
};

$('#formMessage').on('submit', function (e) {
  console.log("submitted");
  e.preventDefault()
  var messageText = e.currentTarget.message.value
  console.log("Sending message:", messageText)
  // Clear the input field
  e.currentTarget.message.value = ''

  app.createMessage({
    text: messageText,
    roomname: app.$roomSelect.val(),
    username: this.username
  })
  .then(app.fetchAndRender)
})

// .then is similar to using a success method, and catch would replace error  been removed

app.createMessage = function(messageObj) {
  console.log(messageObj)
  return $.ajax({
    url: 'https://127.0.0.1:3000',
    type: 'POST',
    data: JSON.stringify(messageObj),
    contentType: 'application/json'
  })
}

app.fetch = function() {
  return $.ajax({
    // This is the url you should use to communicate with the parse API server.
    url: this.server,
    type: 'GET',
    contentType: 'application/json'
  }).then(function(response) {
    return response.results;
  })
};

app.renderMessages = function(data) {
  // on successful fetch(), delete all child divs of #chats
  app.clearMessages();
  // iterate through data from server
  _.each(data, function(item) {
    // populate select dropdown element with rooms
    app.addRoom(item.roomname);
    // only add messages of currently selected room
    var currentRoom = app.$roomSelect.val();
    // app.addMessage(item.text );
    if (item.roomname === currentRoom) {
      app.addMessage(item.text, item.username)
    }
  })
}

app.fetchAndRender = function() {
  console.log("refreshing feed")
  app.fetch().then(app.renderMessages)
}

app.pollMessages = function() {
  console.log("fetching...")
  app.fetchAndRender();
  setInterval(app.fetchAndRender, 5000)
}

app.addRoom = function(name) {
  if( app.rooms[name] === undefined ) {
    app.$roomSelect.append($('<option></option>').attr("id", name).text(name));
    app.rooms[name] = 1;
  }
};

app.addMessage = function(message, user) {
  // break into spans
  app.$chats.append($('<div></div>').text(user + ": " + message).addClass("chat"))//.attr("class", "chat"))
};

app.clearMessages = function() {
  this.$chats.empty()
}

