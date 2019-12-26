"use strict";

const mongoose = require("mongoose"),
  { Schema } = require("mongoose");

let messageSchema = new Schema(
  {
    content: {
      type: String,
      required: true
    },

    username: {
      type: String,
      unique: true,
      required: true
    },
    sender: {
      type: Schema.Types.ObjectId,
      ref: "Sender",
      required: true
    },
    course: {
      type: Schema.Types.ObjectId,
      ref: "Course",
      required: true
    }
  },
  {
    timestamps: true
  }
);

module.exports = mongoose.model("Message", messageSchema);
