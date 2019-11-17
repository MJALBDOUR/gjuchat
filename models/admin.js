"use strict";
const mongoose = require("mongoose"),
  { Schema } = require("mongoose"),
  passport = require("passport-local-mongoose");

let adminSchema = new Schema(
  {
    idNumber: {
      type: Number,
      required: true,
      unique: true
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

    messages: [{ type: Schema.Types.ObjectId, ref: "Message" }]
  },
  {
    timestamps: true
  }
);

adminSchema.virtual("fullName", function() {
  return `${this.name.first} ${this.name.last}`;
});

studentSchema.plugin(passport, {
  usernameField: "email"
});

module.exports = mongoose.model("Admin", adminSchema);
