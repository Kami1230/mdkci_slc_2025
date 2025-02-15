const WebSocket = require('ws');
const http = require('http');
const storage = require('node-persist');
const path = require('path');
const fs = require('fs');

const PORT = process.env.PORT || 8080;
const server = http.createServer();
const wss = new WebSocket.Server({ server });

// Set the directory path (replace with your actual directory path)
const directoryPath = path.join(__dirname, 'message_storage');

let messages = [];

function heartbeat() {
    this.isAlive = true;
}

// Initialize storage and load messages
async function initializeStorage() {
    await storage.init({ dir: directoryPath });
    messages = await storage.getItem('messages') || [];
    console.log('Loaded messages:', messages);
}

wss.on('connection', async (ws) => {
    console.log('Client connected');
    ws.isAlive = true;
    ws.on('pong', heartbeat);

    // Send only the 'content' of messages in history
    const historyToSend = messages.map(msg => msg.content);
    ws.send(JSON.stringify({ type: 'history', messages: historyToSend }));

    ws.on('message', async (message) => {
        if (message === 'ping') {
            ws.pong();
            return;
        }

        if (message === 'clear') {
            messages = [];
            await storage.setItem('messages', messages);
            wss.clients.forEach((client) => {
                client.send(JSON.stringify({ type: 'clear' }));
            });
            return;
        }

        console.log(`Received: ${message}`);
        let parsedMessage;
        try {
            parsedMessage = JSON.parse(message);
        } catch (e) {
            parsedMessage = message.toString();
        }

        // Store only the 'content' and ensure it's not undefined
        if (typeof parsedMessage === 'object' && parsedMessage !== null && parsedMessage.content) {
            messages.push({ content: parsedMessage.content });  //Store content inside an object
            await storage.setItem('messages', messages);
            console.log('Updated messages:', messages);

            const broadcastMessage = JSON.stringify({ content: parsedMessage.content }); // Send only the content
            wss.clients.forEach((client) => {
                if (client !== ws && client.readyState === WebSocket.OPEN) {
                    client.send(broadcastMessage);
                }
            });
        }
    });
});

const interval = setInterval(() => {
    wss.clients.forEach((ws) => {
        if (ws.isAlive === false) return ws.terminate();
        ws.isAlive = false;
        ws.ping();
    });
}, 30000);

wss.on('close', () => {
    clearInterval(interval);
});

// Initialize storage before starting the server
initializeStorage().then(() => {
    server.listen(PORT, () => {
        console.log(`WebSocket server is running on port ${PORT}`);
    });
});