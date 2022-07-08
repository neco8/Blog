"use strict";

const { marked } = require("marked");

exports.parse_ = (left) => (right) => (parsed) => (str) => {
  try {
    return right(parsed(marked.parse(str)));
  } catch (e) {
    return left(e);
  }
};
