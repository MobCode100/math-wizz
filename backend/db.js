import mysql from 'mysql2/promise';
export default mysql.createPool({
    host     : 'localhost',
    user     : 'root',
    password : 'math@wizz',
    database : 'math-wizz',
    waitForConnections: true,
    connectionLimit: 100,
    queueLimit: 0,
    enableKeepAlive: true,
    keepAliveInitialDelay: 0,
});