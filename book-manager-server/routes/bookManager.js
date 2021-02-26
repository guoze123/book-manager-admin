let express = require("express");
let router = express.Router();
let bookDB = require("../data_base/bookDB.js");
router.post("/query", (req, res) => {
  let bookName = req.body.bookName;
  let bookAuthor = req.body.bookAuthor;
  bookDB.query(bookName, bookAuthor).then((data) => {
    let responseJSON = {
      errorPage: "",
      resultHint: "",
      resultValue: "",
      successful: true,
      type: "",
    };
    if (data.length > 0) {
      responseJSON.successful = true;
      responseJSON.resultValue = data;
    } else {
      responseJSON.successful = false;
      responseJSON.resultValue = [];
    }

    res.send(responseJSON);
  });
});
module.exports = router;
