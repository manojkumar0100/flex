const mysql = require('mysql2/promise');

const pool = mysql.createPool({
  

  host: 'localhost',
  user: 'root',
  database: 'flex',
  port     : '3306'
});




const queryAsync = async (sql, values) => {
  try {
    const [rows, fields] = await pool.execute(sql, values);
    return rows;
  } catch (error) {
    console.error('Database query error:', error);
    throw error;
  }
};

module.exports = {
  queryAsync,
};








