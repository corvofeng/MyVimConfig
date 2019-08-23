"use strict";
// vim: ts=2 sw=2 sts=2 et:
/*
 *=======================================================================
 *    Filename: func.js
 *
 *     Version: 1.0
 *  Created on: July 31, 2019
 *
 *      Author: corvo
 *=======================================================================
 */

// import * as fs from "fs";
// import * as path from "path";


LOG.debug("Hello from file");
let SINGLE_QUOTES = "'";
let DOUBLE_QUOTES = '"';

module.exports = {
  get_quoting_style: function () {
    return SINGLE_QUOTES;
  },

  get_markdown_title: function () {
    return jsFuncDecorator("js_markdown_title");
  },

  triple_quotes: function () {
    return get_quoting_style().repeat(3);
  },

  js_markdown_title: function (vsContext) {
    let fn = vsContext.document.fileName;
    return path.basename(fn, path.extname(fn));
  },

  context_example: function (vsContext) {
    LOG.debug("Get ctx:", vsContext.context);
    LOG.debug("Get doc:", vsContext.document);
    LOG.debug("Get pos:", vsContext.position);
    LOG.debug("Get tok:", vsContext.token);
    return vsContext.document.fileName;
  },
  test_for_context: function () {
    return jsFuncDecorator('context_example');
  },

  test_for_simple: function () {
    return "This is a simple func which user defined";
  },

};