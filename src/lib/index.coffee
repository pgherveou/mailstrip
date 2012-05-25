###
Strip email to keep only the actual reply
code inspired from this thread
http://stackoverflow.com/questions/278788/parse-email-content-from-quoted-reply
###

# js regexp escape
RegExp.escape = (text) -> text.replace /[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&"

###
sender: sender email
text  : text body
###
module.exports = (sender, text) ->

  # escape sender email
  email = RegExp.escape sender

  # remove quotation in the end
  text = text.replace /^>.*$/gm, ''

  # test text against the following regexp list
  regexps = [
    /// From:\s* #{email}             ///gi # From: test@test.com
    /// <#{email}>                    ///gi # <test@test.com>
    /// On .* \s* .* wrote:           ///gi # On Fri, May 25, 2012 at 1:33 PM, xxx wrote:
    /// -+original \s+ message-+      ///gi # ---Original Message---
    /// \s+ Sent \s+ from \s+ my .*   ///gi # Sent from my Iphone
    /// \n .* #{'ABOVE THIS LINE'}    ///gi # reply ABOVE THIS LINE
    /// --\n .*                       ///gi # -- signature
  ]

  # init index at the bottom of the text
  index = text.length

  #calculates the matching regex closest to top of page
  for reg in regexps
    m = reg.exec text
    index = m.index if m and index > m.index


  # stripped & trim
  text[...index].trim()



