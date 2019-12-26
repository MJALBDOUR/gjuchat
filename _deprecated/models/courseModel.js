"use strict";

const mongoose = require("mongoose"),
  { Schema } = require("mongoose");

let courseSchema = new Schema(
  {
    courseId: {
      type: Number,
      min: 0,
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

    students: [{ type: Schema.Types.ObjectId, ref: "Student", min: 0 }],
    teachers: [{ type: Schema.Types.ObjectId, ref: "Teacher", min: 0 }],
    messages: [{ type: Schema.Types.ObjectId, ref: "Message" }]
  },
  {
    timestamps: true
  }
);

module.exports = mongoose.model("Course", courseSchema);
