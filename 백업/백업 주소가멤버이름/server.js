const express = require('express');
const axios = require('axios');
const cors = require('cors');

const app = express();
const PORT = 3000;

app.use(cors());

const apiKey = '9b2f15bf8c61a2f25da556bc89874891692205b1ca';
const secretKey = '70b841c2c63163350cd0b1';

app.get('/api/access_token', async (req, res) => {
    try {
        const response = await axios.get('https://api.imweb.me/v2/auth', {
            params: {
                key: apiKey,
                secret: secretKey
            }
        });
        res.json(response.data);
    } catch (error) {
        console.error('Error fetching access token:', error);
        res.status(500).json({ error: 'Error fetching access token' });
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
        console.error('Error fetching member code:', error);
        res.status(500).json({ error: 'Error fetching member code' });
    }
});

app.listen(PORT, () => {
    console.log(`Server running at http://localhost:${PORT}`);
});
