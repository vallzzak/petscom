const express = require('express');
const axios = require('axios');
const path = require('path');

const app = express();
const PORT = 3000;

const API_KEY = '9b2f15bf8c61a2f25da556bc89874891692205b1ca';
const SECRET_KEY = '70b841c2c63163350cd0b1';

app.use(express.static(path.join(__dirname, '/')));

app.get('/api/access_token', async (req, res) => {
    try {
        const response = await axios.get('https://api.imweb.me/v2/auth', {
            params: {
                key: API_KEY,
                secret: SECRET_KEY
            }
        });
        res.json(response.data);
    } catch (error) {
        console.error('Error fetching access token:', error);
        res.status(500).json({ error: 'Error fetching access token' });
    }
});

app.get('/api/member_code', async (req, res) => {
    const accessToken = req.query.accessToken;
    const memberCode = req.query.memberCode;

    try {
        const response = await axios.get(`https://api.imweb.me/v2/member/members/${memberCode}`, {
            headers: {
                'access-token': accessToken
            }
        });
        res.json(response.data);
    } catch (error) {
        console.error('Error fetching member info:', error);
        res.status(500).json({ error: 'Error fetching member info' });
    }
});

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'Front.html'));
});

app.listen(PORT, '0.0.0.0', () => {
    console.log(`Server running at http://0.0.0.0:${PORT}`);
});
