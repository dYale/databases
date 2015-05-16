var Sequelize = require('Sequelize')
var orm = new Sequelize('chat','dan','dan');

var User = orm.define('User', {
username: Sequelize.STRING
});

var Message = orm.define('Message', {
	text: Sequelize.STRING,
	roomname: Sequelize.STRING
});


exports.User = User;
exports.Message = Message;

User.hasMany(Message);
Message.belongsTo(user);

User.sync();
User.message();
// var mysql = require('mysql');



// var connection = mysql.createConnection({
// 	user: 'dan',
// 	password: 'dan',
// 	database: 'chat'
// });

// connection.connect();

// module.exports = connection;