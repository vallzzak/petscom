
const express = require('express');
const axios = require('axios');
const cors = require('cors');

const app = express();
app.use(cors());

const API_KEY = '9b2f15bf8c61a2f25da556bc89874891692205b1ca';
const SECRET_KEY = '70b841c2c63163350cd0b1';

app.get('/api/access_token', async (req, res) => {
    try {
        const response = await axios.post('https://api.imweb.me/v2/auth', {
            key: API_KEY,
            secret: SECRET_KEY
        });
        res.json(response.data);
    } catch (error) {
        console.error('Access Token Error:', error);
        res.status(500).json({ error: 'Failed to fetch access token' });
    }
});

app.get('/api/member_code', async (req, res) => {
    const { accessToken, memberCode } = req.query;
    try {
        const response = await axios.get(`https://api.imweb.me/v2/member/members/${memberCode}`, {
            headers: {
                'access-token': accessToken
            }
        });
        res.json(response.data);
    } catch (error) {
        console.error('Member Code Error:', error);
        res.status(500).json({ error: 'Failed to fetch member info' });
    }
});

app.listen(3000, () => {
    console.log('Server running at http://localhost:3000');
});
