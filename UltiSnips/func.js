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

function get_quoting_style() {
  return SINGLE_QUOTES;
}

function get_markdown_title() {
  return jsFuncDecorator("js_markdown_title");
}

function js_markdown_title(vsContext) {
  Logger.debug("Get doc:", vsContext.document);
  Logger.debug("Get pos:", vsContext.position);
  Logger.debug("Get tok:", vsContext.token);
  Logger.debug("Get ctx:", vsContext.context);
  let fn = vsContext.document.fileName;

  return path.basename(fn, path.extname(fn));
}

function triple_quotes() {
  return get_quoting_style().repeat(3);
}

