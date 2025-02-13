const WebSocket = require('ws');
const http = require('http');

const PORT = process.env.PORT || 8080;
const server = http.createServer();
const wss = new WebSocket.Server({ server });

wss.on('connection', (ws) => {
    console.log('Client connected');

    ws.on('message', (message) => {
        console.log(`Received: ${message}`);
        let parsedMessage;
        try {
            parsedMessage = JSON.parse(message);
        } catch (e) {
            parsedMessage = message.toString();
        }

        const broadcastMessage = typeof parsedMessage === 'object' ? JSON.stringify(parsedMessage) : parsedMessage;

        wss.clients.forEach((client) => {
            if (client.readyState === WebSocket.OPEN) {
                client.send(broadcastMessage);
            }
        });
    });

    ws.send('Welcome to the WebSocket server!');
});

server.listen(PORT, () => {
    console.log(`WebSocket server is running on port ${PORT}`);
});