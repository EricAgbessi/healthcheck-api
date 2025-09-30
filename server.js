const express = require('express');
const app = express();
const port = 3000;

app.get('/health', (req, res) => {
  res.send('Hello World!');
});

app.get('/health/add',(req, res)=>{
  res.send('Tu peu ajouter un nous health check')
})

app.listen(port, () => {
  console.log(`Server is running at http://localhost:${port}`);
});