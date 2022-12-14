const mongoose = require('mongoose')

const userSchema = mongoose.Schema({
    name:{
        type: String,
        required: true,
    },
    email:{
        type: String,
        required: true,
        validate:{
            validator:(val)=>{
                const re = /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i
                return val.match(re)
            },
            message:"please enter a valid email address"
        }
    },
    password:{
        type: String,
        required: true
    },
    address:{
        type: String,
        default: ''
    },
    type:{
        type: String,
        default: 'user'
    }
})

const User = mongoose.model('user', userSchema)
module.exports = User