###
Strip email to keep only the actual reply
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

  exp = ///
    From:\s* #{email}                   # From: test@test.com
    | <#{email}>                        # <test@test.com>
    | On .* \s* .* wrote:               # On Fri, May 25, 2012 at 1:33 PM, xxx wrote:
    | -+original \s+ message-+          # ---Original Message---
    | \s+ Sent \s+ from \s+ my .*       # Sent from my Iphone
    | \n .* #{'reply above this line'}  # reply ABOVE THIS LINE
    | --\n .*                           # -- signature
  ///gi

  m = exp.exec text
  index = if m then m.index else text.length

  # stripped & trim
  text[...index].trim()



