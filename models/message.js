"use strict";

const mongoose = require("mongoose"),
  { Schema } = require("mongoose");

let messageSchema = new Schema(
  {
    content: {
      type: String,
      required: true
    },

    userName: {
      type: String,
      unique: true,
      required: true
    },
    sender: {
      type: Schema.Types.ObjectId,
      ref: "Sender", // no sure about this so far
      required: true
    }
  },
  {
    timestamps: true
  }
);

module.exports = mongoose.model("Message", messageSchema);
