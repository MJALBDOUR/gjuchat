"use strict"

const Admin = require('../models/admin'),
  Student = require('../models/student'),
  teacher = require('../models/teacher'),

getStudentParams = body => {
  return {
    idNumber: body.idNumber,
    name: {
      first: body.firstName,
      last: body.lastName
    },

    email: body.email,
    passwordHash: body.passwordHash
  }
}