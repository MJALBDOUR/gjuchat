const express = require("express"),
  app = express();

app.set("port", process.env.PORT || 3000);

app.get("/", (req, res) => {
  res.send("Server is working!");
});

app.listen(
  app.get("port"),
  console.log(`Server is listening on: http://localhost:${app.get("port")}`)
);
