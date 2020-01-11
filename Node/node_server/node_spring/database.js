const mysql = require('mysql');

const dbConfig = {
    host: '192.168.6.55',
    port: 3306,
    user: 'dobee',
    password: '1004',
    database: 'dobee',
    connectionLimit : 50
}
const pool = mysql.createPool(dbConfig);

const getConn = function(callback) {
    pool.getConnection(function(err, connection) {
        callback(err, connection);
    });
}

module.exports = getConn;