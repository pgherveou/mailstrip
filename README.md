mailstrip
=========

simple function that intent to strip signature and history from an email
to return only the content body.
Its just a simple list of regexp that defines where the email need to be truncated
each regexp has its own test.

Feel free to contribute by adding, a regexp and a testcase (tests are built with [mocha] [1] & [chai] [2])

install
-------

```
npm install mailstrip
```

usage
-----

```javascript
var mailstrip = require('mailstrip')
  , content = mailstrip(emailBody);
```

test
-----

```
# build first
$ cake build

# run mocha
$ mocha
```


[1]: https://mochajs.org/   "mocha"
[2]: http://chaijs.com/                     "chai"
