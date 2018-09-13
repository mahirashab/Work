const express = require("express");
const hbs = require("hbs");

const app = express();

app.set("view engine", "hbs");
// app.use(express.static(__dirname + "/static"));

app.get("/", (req, res) => {
  res.render("index.hbs", {
    name: "Mahir"
  });
});

app.get("/about", (req, res) => {
  res.render("about.hbs", {
    time: new Date().getFullYear()
  });
});

app.listen(3000, () => {
  console.log("server is up !!!!!!!");
});
