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
module.export.strip = (sender, text) ->

  # escape sender email
  email = RegExp.escape from

  #To remove quotation in the end:
  new Regex("^>.*$", RegexOptions.IgnoreCase | RegexOptions.Multiline);


  regexps =
    /// From: \s* #{email}        /// # From: test@test.com
    /// <#{email}>                /// # <test@test.com>
    /// #{email} \s+ wrote:       /// # test@test.com wrote
    /// \n .* On .* \S* wrote:    /// # On Fri, May 25, 2012 at 1:33 PM, xxx wrote:
    /// "-+original \s+ message-+ /// # ---Original Message---
    /// \n \s+ ABOVE THIS LINE    /// # reply ABOVE THIS LINE

  ]

  # init index at the bottom of the text
  index = text.length

  #calculates the matching regex closest to top of page
  m = reg.exec text for reg in regexps
  index = m.index if m and index > m.index

  # return stripped text
  text[..index]


