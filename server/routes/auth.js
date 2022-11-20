const express = require('express')
const bcrypt = require('bcrypt')

const User = require('../models/user')
const authRouter = express.Router()

authRouter.post('/api/sign-up', async(req, res)=>{
    try{
        const {name, email, password} = req.body
        const existingUser = await User.findOne({email})
        if(existingUser){
            return res.status(400).json({msg: "Email already exits"})
        }
        const hashPassword = await bcrypt.hash(password, 8)
        let user = new User({
            name,
            email,
            password:hashPassword
        })
        user = await user.save()
        res.status(200).json(user)
    }catch(e){
        res.status(500).json({err:e.message})
    }
    
})

module.exports = authRouter