import express from 'express';

const app = express();

const apiRoute = ''

//Routes
import root from './routes/index.routes'

//Setings
app.set('port', process.env.PORT || 3000);

app.use(express.json());

app.use(apiRoute ,root);

export default app;