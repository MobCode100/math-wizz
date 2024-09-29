import express, { json } from 'express';

import { create_user, login, update_user, delete_user, get_user } from "./objects/user.js";

const app = express();

app.use(json());

const server_port = 80;

app.listen(server_port, () => {
    console.log(`Server is listening to port ${server_port}`);
});

app.post('/register', create_user);
app.post('/login', login);
app.post('/update_user', update_user);
app.post('/delete_user', delete_user);
app.post('/fetch_user', get_user);