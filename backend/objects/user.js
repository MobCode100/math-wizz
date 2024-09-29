// API definition for object user

import db from  "../db.js"

const _log = async (data,res_data) => {
    console.log("Received: ",data);
    console.log("Responded:",res_data);
}

const create_user = async (req, res) => {
    const data = req.body;
    let code = 500;
    let res_data = {message:"Unexpected database error",data:data};
    const conn = await db.getConnection();
    await conn.execute(
        'INSERT INTO user (username,name,password) VALUES (?,?,?)',[data.username,data.name,data.password]
    ).then(() => {
        code = 200;
        res_data.message = "User registered successfully";
    }).catch(err => {
        res_data.err_message = err.message;
        if(err.code == "ER_DUP_ENTRY"){
            code = 422;
            res_data.message = "Username is already taken";
        } 
    });
    conn.release(); 
    res.status(code).json(res_data);
    _log(data,res_data);
}

const login = async (req,res) => {
    const data = req.body;
    const res_data = {message:"User logged-in successfully"};
    let code = 200;

    const conn = await db.getConnection();
    res_data.data = (
        await conn.execute('SELECT username,name,highest_score,is_admin FROM user WHERE username = ? AND password = ?',
        [data.username,data.password])
    )[0];
    conn.release();

    if(!res_data.data.length){
        code = 422;
        res_data.message = "Username or password incorrect";
    }

    res.status(code).json(res_data);
    _log(data,res_data);
}

const update_user = async (req,res) => {
    const data = req.body;
    let code = 422;
    const res_data = {message: "Bad input data. Missing username/columns?",data: data};

    // Generating sql statement
    let sql = "UPDATE user SET ";
    const username = data.username;
    delete data.username;
    const columns_to_update = Object.keys(data);
    const sql_data = [data[columns_to_update[0]]];
    sql += columns_to_update[0];
    for (let i = 1, len = columns_to_update.length; i < len; i++){
        sql += " = ?, " + columns_to_update[i];
        sql_data.push(data[columns_to_update[i]]);
    }
    sql_data.push(username);
    sql += " = ? WHERE username = ?";

    const conn = await db.getConnection();
    await conn.execute(sql,sql_data).then(() => {
        code = 200;
        res_data.message = "User updated successfully";
    }).catch((err) => {
        res_data.err_message = err.message;
        if(err.code){
            res_data.message = err.message;
        }
    });
    conn.release();         

    res.status(code).json(res_data);
    _log(data,res_data);
}

const delete_user = async (req,res) => {
    const data = req.body;
    let code = 422;
    const res_data = {message: "Bad input data. Missing username?",data: data};

    const conn = await db.getConnection();
    await conn.execute(
        "DELETE FROM user WHERE username = ?",[data.username]
    ).then(() => {
        code = 200;
        res_data.message = "User deleted successfully";
    }).catch(err => {
        res_data.err_message = err.message;
        if(err.code){
            res_data.message = "Unexpected database error";
            code = 500;
        }
    });
    conn.release(); 

    res.status(code).json(res_data);
    _log(data,res_data);
}

const get_user = async (req,res) => {
    // This endpoint can receive limit and username, if none specified, it will retrieve all users
    let data = req.body;

    // Generating sql statement
    let sql = "SELECT * FROM user";
    const sql_data = [];

    if(data.username){
        sql += " WHERE username = ?";
        sql_data.push(data.username);
    }

    if(data.limit){
        sql += " LIMIT ?";
        sql_data.push();
    }

    const conn = await db.getConnection();
    data = (await conn.execute(sql,sql_data))[0];
    conn.release();

    res.json({message:"Data retrieved successfully", data: data});
}

export { create_user, login, update_user, delete_user, get_user };