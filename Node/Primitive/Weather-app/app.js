const request = require("request");

request(
  {
    url:
      "https://maps.googleapis.com/maps/api/geocode/json?address=rajshahi,%20bangladesh"
  },
  (err, res, body) => {
    console.log(body);
  }
);
