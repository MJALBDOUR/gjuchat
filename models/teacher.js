"use strict";
const mongoose = require("mongoose"),
  { Schema } = require("mongoose"),
  passport = require("passport-local-mongoose");

let teacherSchema = new Schema(
  {
    idNumber: {
      type: Number,
      required: true,
      unique: true,
    },

    name: {
      first: {
        type: String,
        trim: true,
        required: true
      },
      last: {
        type: String,
        trim: true,
        required: true
      }
    },
    email: {
      type: String,
      lowercase: true,
      required: true,
      unique: true
    },

    passwordHash: {
      type: String,
      required: true
    },

    courses: [{ type: Schema.Types.ObjectId, ref: "Course" }],
    messages: [{ type: Schema.Types.ObjectId, ref: "Message" }]
  },
  {
    timestamps: true
  }
);

teacherSchema.virtual("fullName", function() {
  return `${this.name.first} ${this.name.last}`;
});

teacherSchema.plugin(passport, {
  usernameField: "email"
});

module.exports = mongoose.model("Teacher", teacherSchema);