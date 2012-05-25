mailstrip
=========

simple function that intent to strip signature and history from an email
to return only the content body.
Its just a simple list of regexp that defines where the email need to be truncate
each regexp has its own test. Feel free to contribute by adding
a regexp and a testcase

install
-------

```
npm install mailstrip
```

usage
-----

```javascript
var mailstrip = require('mailstrip')
  , content = mailstrip(senderEmail, emailData);
```

test
-----

```
# build first
$ cake build

# run mocha
$ mocha
```
