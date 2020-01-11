const promiseMysql = require('promise-mysql');

const pool = promiseMysql.createPool({
    host : '192.168.6.55',
    port:3306,
    user : 'dobee',
    password : '1004',
    database:'dobee',
    waitForConnections : false
});

export const connect = fn => async () => {
    /*db 커넥션*/


};