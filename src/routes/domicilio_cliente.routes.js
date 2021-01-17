import { Router } from 'express';
import data_base from '../database';

const router = Router();

router.get('/', async (req, res) => {
    const response = await data_base.query('SELECT * FROM DOMICILIO_CLIENTE;');
    res.json(response.rows);
});

export default router;