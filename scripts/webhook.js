// Description:
// This script receives a post at /splunk/:room endpoint and invokes telegram to send a hello world to the specified room!


module.exports = function (robot) {

	robot.router.post('/splunk/:room', function (req, res) {
		var room = req.params.room;
		robot.emit('telegram:invoke', 'sendMessage', {
			chat_id: room,
			text: 'Hello World!'
		}, function (error, response) {
			if(error){
				console.log(error);
			}
			console.log(response);
		});
		res.send('OK');
	});
};
