// A dummy backend service for the example app

const express = require('express');
const app = express();
const port = 3000;

app.post('/login', (req, res) => {

  const data = {
    firstName: "John",
    lastName: "Appleseed",
    username: "flurryflutter",
    level: "100",
  }

  res.json(data);
});

// Allow connections from all IPs to work for emulators and such
app.listen(port, '0.0.0.0', () => console.log(`Example app listening at http://localhost:${port}`));

