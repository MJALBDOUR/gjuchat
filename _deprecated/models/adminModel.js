"use strict";

const mongoose = require("mongoose"),
  { Schema } = require("mongoose");

let adminSchema = new Schema(
  {
    personalInformation: {
      required: true,
      adminId: {
        type: Number,
        min: 0,
        max: 100,
        required: true,
        unique: true
      },
      name: {
        required: true,
        type: String,
        trim: true,
        firstName,
        fatherName,
        grandfatherName,
        lastName
      },
      username: {
        type: String,
        lowercase: true,
        required: [true, "can't be blank"],
        match: [/^[a-zA-Z0-9]+$/, "is invalid"],
        index: true,
        unique: true
      },
      nationality: {
        type: String,
        required: true
      },
      gender: {
        type: String,
        required: true
      },
      birthdate: {
        type: Date,
        required: true
      },
      religion: {
        type: String
      },
      maritialStatus: {
        type: String,
        default: "single"
      }
    },
    contactInformation: {
      required: true,
      hashPassword: {
        type: String
      },
      gjuEmail: {
        type: String,
        lowercase: true,
        required: [true, "can't be blank"],
        match: [/\S+@\S+\.\S+/, "is invalid"],
        index: true,
        unique: true
      },
      secondaryEmail: {
        type: String,
        lowercase: true,
        required: [true, "can't be blank"],
        match: [/\S+@\S+\.\S+/, "is invalid"],
        unique: true
      },
      mobileNumber: {
        type: Number,
        unique: true
      },
      address: {
        street: {
          type: String
        },
        city: {
          type: String,
          default: "amman"
        },
        zipCode: {
          type: Number,
          min: [00000, "zip code too low"],
          max: [99999, "zip code too high"]
        }
      }
    }
  },
  {
    timestamps: true
  }
);

adminSchema.virtual("firstLastName").get(function() {
  return `${this.personalInformation.name.firstName} ${this.personalInformation.name.lastName}`;
});

adminSchema.virtual("fullName").get(function() {
  return `${this.personalInformation.name.firstName} ${this.personalInformation.name.fatherName} ${this.personalInformation.name.grandfatherName} ${this.personalInformation.name.lastName}`;
});
module.exports = mongoose.model("Admin", adminSchema);
