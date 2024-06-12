const express = require('express');
const axios = require('axios');
const path = require('path');
const mysql = require('mysql');
const bodyParser = require('body-parser'); // Add this line

const app = express();
const PORT = 3000;

const API_KEY = '9b2f15bf8c61a2f25da556bc89874891692205b1ca';
const SECRET_KEY = '70b841c2c63163350cd0b1';

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '1234',
    database: 'tail45'
});

db.connect((err) => {
    if (err) {
        console.error('Error connecting to the database:', err);
        return;
    }
    console.log('Connected to the database.');
});

app.use(express.static(path.join(__dirname, '/')));
app.use(bodyParser.json()); // Add this line

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

app.get('/api/local_member', (req, res) => {
    const memberCode = req.query.memberCode;

    db.query('SELECT num, PassRemain, PassType, LeaseTicket, SnackTicket FROM member WHERE code = ?', [memberCode], (err, results) => {
        if (err) {
            console.error('Error fetching local member info:', err);
            res.status(500).json({ error: 'Error fetching local member info' });
            return;
        }
        res.json(results[0]);
    });
});

// Add this new endpoint for extending pass
app.post('/api/extend_pass', (req, res) => {
    const { memberCode, days } = req.body;

    db.query('SELECT PassRemain FROM member WHERE code = ?', [memberCode], (err, results) => {
        if (err) {
            console.error('Error fetching local member info:', err);
            res.status(500).json({ error: 'Error fetching local member info' });
            return;
        }

        if (results.length === 0) {
            res.status(404).json({ error: 'Member not found' });
            return;
        }

        let currentPassRemain = results[0].PassRemain ? new Date(results[0].PassRemain) : new Date();
        if (currentPassRemain < new Date()) {
            currentPassRemain = new Date(); // Reset to today if expired
        }
        currentPassRemain.setDate(currentPassRemain.getDate() + days);

        db.query('UPDATE member SET PassRemain = ? WHERE code = ?', [currentPassRemain, memberCode], (err) => {
            if (err) {
                console.error('Error updating pass info:', err);
                res.status(500).json({ error: 'Error updating pass info' });
                return;
            }

            res.json({ success: true });
        });
    });
});

// Add this new endpoint for setting pass to today
app.post('/api/set_pass_today', (req, res) => {
    const { memberCode } = req.body;
    const today = new Date();

    db.query('UPDATE member SET PassRemain = ? WHERE code = ?', [today, memberCode], (err) => {
        if (err) {
            console.error('Error updating pass info:', err);
            res.status(500).json({ error: 'Error updating pass info' });
            return;
        }

        res.json({ success: true });
    });
});

// Add this new endpoint for updating pass type
app.post('/api/update_pass_type', (req, res) => {
    const { memberCode, passType } = req.body;

    db.query('UPDATE member SET PassType = ? WHERE code = ?', [passType, memberCode], (err) => {
        if (err) {
            console.error('Error updating pass type:', err);
            res.status(500).json({ error: 'Error updating pass type' });
            return;
        }

        res.json({ success: true });
    });
});

// Add this new endpoint for updating lease ticket count
app.post('/api/update_lease_ticket', (req, res) => {
    const { memberCode, count } = req.body;

    db.query('UPDATE member SET LeaseTicket = LeaseTicket + ? WHERE code = ?', [count, memberCode], (err) => {
        if (err) {
            console.error('Error updating lease ticket count:', err);
            res.status(500).json({ error: 'Error updating lease ticket count' });
            return;
        }

        res.json({ success: true });
    });
});

app.post('/api/update_snack_ticket', (req, res) => {
    const { memberCode, count } = req.body;

    db.query('SELECT SnackTicket FROM member WHERE code = ?', [memberCode], (err, results) => {
        if (err) {
            console.error('Error fetching member snack ticket info:', err);
            res.status(500).json({ error: 'Error fetching member snack ticket info' });
            return;
        }

        if (results.length === 0) {
            res.status(404).json({ error: 'Member not found' });
            return;
        }

        let currentSnackTicket = results[0].SnackTicket || 0;
        currentSnackTicket += count;

        db.query('UPDATE member SET SnackTicket = ? WHERE code = ?', [currentSnackTicket, memberCode], (err) => {
            if (err) {
                console.error('Error updating snack ticket info:', err);
                res.status(500).json({ error: 'Error updating snack ticket info' });
                return;
            }

            res.json({ success: true });
        });
    });
});



app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'Front.html'));
});

app.listen(PORT, '0.0.0.0', () => {
    console.log(`Server running at http://0.0.0.0:${PORT}`);
});
