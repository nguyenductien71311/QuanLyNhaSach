const initOptions = {
  /* initialization options */
};
const pgp = require("pg-promise")(initOptions);

const cn = {
  host: "localhost",
  port: 5432,
  database: "QLNS",
  user: "postgres",
  password: "713112411",//"123",
  max: 30, // use up to 30 connections

  // "types" - in case you want to set custom type parsers on the pool level
};

const db = pgp(cn);

module.exports = db;
