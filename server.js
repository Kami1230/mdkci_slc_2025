/*const WebSocket = require('ws');
const http = require('http');
const fs = require('fs');

const PORT = process.env.PORT || 8080;
const server = http.createServer();
const wss = new WebSocket.Server({ server });

let messages = [];

function heartbeat() {
  this.isAlive = true;
}

try {
  const data = fs.readFileSync('messages.json', 'utf8');
  messages = JSON.parse(data);
} catch (err) {
  console.error('Error reading messages file:', err);
}

wss.on('connection', (ws) => {
    console.log('Client connected');
    ws.isAlive = true;
    ws.on('pong', heartbeat);

    ws.send(JSON.stringify({ type: 'history', messages: messages }));

    ws.on('message', (message) => {
        if (message === 'ping') {
            ws.pong();
            return;
        }

        console.log(`Received: ${message}`);
        let parsedMessage;
        try {
            parsedMessage = JSON.parse(message);
        } catch (e) {
            parsedMessage = message.toString();
        }
        messages.push(parsedMessage);
        fs.writeFileSync('messages.json', JSON.stringify(messages));

        const broadcastMessage = typeof parsedMessage === 'object' ? JSON.stringify(parsedMessage) : parsedMessage;

        wss.clients.forEach((client) => {
            if (client !== ws && client.readyState === WebSocket.OPEN) {
                client.send(broadcastMessage);
            }
        });
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

server.listen(PORT, () => {
    console.log(`WebSocket server is running on port ${PORT}`);
});*/

const WebSocket = require('ws');
const http = require('http');
const storage = require('node-persist');

const PORT = process.env.PORT || 8080;
const server = http.createServer();
const wss = new WebSocket.Server({ server });

let messages = [];

function heartbeat() {
  this.isAlive = true;
}

// Initialize storage and load messages
async function initializeStorage() {
  await storage.init({ dir: './persistent-storage' });
  messages = await storage.getItem('messages') || [];
  console.log('Loaded messages:', messages);
}

wss.on('connection', async (ws) => {
    console.log('Client connected');
    ws.isAlive = true;
    ws.on('pong', heartbeat);

    ws.send(JSON.stringify({ type: 'history', messages: messages }));

    ws.on('message', async (message) => {
        if (message === 'ping') {
            ws.pong();
            return;
        }

        console.log(`Received: ${message}`);
        let parsedMessage;
        try {
            parsedMessage = JSON.parse(message);
        } catch (e) {
            parsedMessage = message.toString();
        }
        messages.push(parsedMessage);
        await storage.setItem('messages', messages);
        console.log('Updated messages:', messages);

        const broadcastMessage = typeof parsedMessage === 'object' ? JSON.stringify(parsedMessage) : parsedMessage;

        wss.clients.forEach((client) => {
            if (client !== ws && client.readyState === WebSocket.OPEN) {
                client.send(broadcastMessage);
            }
        });
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
/*const WebSocket = require('ws');
const http = require('http');
const fs = require('fs');

const PORT = process.env.PORT || 8080;
const server = http.createServer();
const wss = new WebSocket.Server({ server });

let messages = [];

function heartbeat() {
  this.isAlive = true;
}

try {
  const data = fs.readFileSync('messages.json', 'utf8');
  messages = JSON.parse(data);
} catch (err) {
  console.error('Error reading messages file:', err);
}

wss.on('connection', (ws) => {
    console.log('Client connected');
    ws.isAlive = true;
    ws.on('pong', heartbeat);

    ws.send(JSON.stringify({ type: 'history', messages: messages }));

    ws.on('message', (message) => {
        if (message === 'ping') {
            ws.pong();
            return;
        }

        console.log(`Received: ${message}`);
        let parsedMessage;
        try {
            parsedMessage = JSON.parse(message);
        } catch (e) {
            parsedMessage = message.toString();
        }
        messages.push(parsedMessage);
        fs.writeFileSync('messages.json', JSON.stringify(messages));

        const broadcastMessage = typeof parsedMessage === 'object' ? JSON.stringify(parsedMessage) : parsedMessage;

        wss.clients.forEach((client) => {
            if (client !== ws && client.readyState === WebSocket.OPEN) {
                client.send(broadcastMessage);
            }
        });
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

server.listen(PORT, () => {
    console.log(`WebSocket server is running on port ${PORT}`);
});*/

const WebSocket = require('ws');
const http = require('http');
const storage = require('node-persist');

const PORT = process.env.PORT || 8080;
const server = http.createServer();
const wss = new WebSocket.Server({ server });

let messages = [];

function heartbeat() {
  this.isAlive = true;
}

// Initialize storage and load messages
async function initializeStorage() {
  await storage.init({ dir: './persistent-storage' });
  messages = await storage.getItem('messages') || [];
  console.log('Loaded messages:', messages);
}

wss.on('connection', async (ws) => {
    console.log('Client connected');
    ws.isAlive = true;
    ws.on('pong', heartbeat);

    ws.send(JSON.stringify({ type: 'history', messages: messages }));

    ws.on('message', async (message) => {
        if (message === 'ping') {
            ws.pong();
            return;
        }

        console.log(`Received: ${message}`);
        let parsedMessage;
        try {
            parsedMessage = JSON.parse(message);
        } catch (e) {
            parsedMessage = message.toString();
        }
        messages.push(parsedMessage);
        await storage.setItem('messages', messages);
        console.log('Updated messages:', messages);

        const broadcastMessage = typeof parsedMessage === 'object' ? JSON.stringify(parsedMessage) : parsedMessage;

        wss.clients.forEach((client) => {
            if (client !== ws && client.readyState === WebSocket.OPEN) {
                client.send(broadcastMessage);
            }
        });
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
