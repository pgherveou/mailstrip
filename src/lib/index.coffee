# js regexp escape
# RegExp.escape = (text) -> text.replace /[-[\]{}()*+?.,\\^$|#\s]/g, "\\$&"

###
Strip email to keep only the actual reply
text: text body
###
module.exports = (text) ->

  # remove quotation in the end
  text = text.replace /^>.*$/gm, ''

  emailReg = '[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}'

  exp = ///
    From:\s* #{emailReg}                # From: test@test.com
    | <#{emailReg}>                     # <test@test.com>
    | On .* \s* .* wrote:               # On Fri, May 25, 2012 at 1:33 PM, xxx wrote:
    | Le .* \s* .* #{'a écrit :'}       # Le 12 juin 2012 à 17:50, xxx a écrit :"
    | -+original \s+ message-+          # ---Original Message---
    | \s+ Sent \s+ from \s+ my .*       # Sent from my Iphone
    | \s+ envoyé \s+ depuis \s+ mon .*  # Envoye depuis my Iphone
    | \s+ envoyé \s+ de \s+ mon .*      # Envoye depuis de mon ipad
    | \n .* #{'reply above this line'}  # reply ABOVE THIS LINE
    | --\n .*                           # -- signature
  ///gi

  m = exp.exec text
  index = if m then m.index else text.length

  # stripped & trim
  text[...index].trim()
