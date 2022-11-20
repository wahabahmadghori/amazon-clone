const express = require('express')
const mongoose = require('mongoose')

const authRouter = require('./routes/auth')
const app = express()
const PORT = 3000
const DB = 'mongodb+srv://admin:admin321@cluster0.rjq2fav.mongodb.net/?retryWrites=true&w=majority'


mongoose.connect(DB).then(()=>{
    console.log('Connected Successfully')
}).catch((e)=>{
    console.log(e)
})
app.use(express.json())
app.use(authRouter)


app.listen(PORT, "0.0.0.0", ()=>{
    console.log(`App is running at ${PORT}`)
})