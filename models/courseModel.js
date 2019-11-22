"use strict";

const mongoose = require("mongoose"),
  { Schema } = require("mongoose");

let courseSchema = new Schema(
  {
    idNumber: {
      type: Number,
      required: true,
      unique: true
    },

    title: {
      type: String,
      required: true,
      unique: true
    },

    description: {
      type: String,
      required: true
    },

    students: [{ type: Schema.Types.ObjectId, ref: "Student" }],
    teachers: [{ type: Schema.Types.ObjectId, ref: "Teacher" }],
    messages: [{ type: Schema.Types.ObjectId, ref: "Message" }]
  },
  {
    timestamps: true
  }
);

module.exports = mongoose.model("Course", courseSchema);
