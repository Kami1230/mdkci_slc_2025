/*import { WebSocketServer } from 'ws';

const wss = new WebSocketServer({ port: 8080 });

wss.on('connection', function connection(ws) {
  console.log('New client connected');

  ws.on('message', function message(data) {
    console.log('Received:', data.toString());
    ws.send('Message received: ' + data);
  });

  ws.send('Welcome to the WebSocket server!');
});

console.log('WebSocket server is running on port 8080');*/

const WebSocket = require('ws');

const wss = new WebSocket.Server({ port: 8080 });

wss.on('connection', (ws) => {
    console.log('Client connected');

    // Broadcast messages to all connected clients
    ws.on('message', (message) => {
        console.log(`Received: ${message}`);
        wss.clients.forEach((client) => {
            if (client.readyState === WebSocket.OPEN) {
                client.send(message);
            }
        });
    });

    ws.send('Welcome to the WebSocket server!');
});

console.log('WebSocket server running on ws://localhost:8080');