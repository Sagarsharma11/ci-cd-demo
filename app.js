const express = require("express");
const app = express()

app.get("/",(req, res)=>{
    return res.status(200).json({
        message:"Node JS App demo"
    })
})

app.listen(8000, ()=>{
 console.log(`App is running on port 8000`)
})