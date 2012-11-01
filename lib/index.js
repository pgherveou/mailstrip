/*
Strip email to keep only the actual reply
text: text body
*/

module.exports = function(text) {
  var emailReg, exp, index, m;
  text = text.replace(/^>.*$/gm, '');
  emailReg = '[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}';
  exp = RegExp("^From:\\s*" + emailReg + "|^.*<" + emailReg + ">.*$|^On.*wrote:|^Le.*" + 'a écrit :' + "|^-+original\\s+message-+|^Sent.*from.*my.*|^envoyé\\s+depuis\\s+mon.*|^envoyé\\s+de\\s+mon.*|^" + 'reply above this line' + "|^--\\n.*", "gmi");
  m = exp.exec(text);
  index = m ? m.index : text.length;
  return text.slice(0, index).trim();
};
