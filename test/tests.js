var mailstrip, should;

should = require('chai').should();

mailstrip = require('../lib');

describe('strip', function() {
  var sender;
  sender = 'test@test.com';
  it('after From: test@test.com', function() {
    var content, text;
    text = "content\nFrom: test@test.com\nxxx";
    content = mailstrip(sender, text);
    return content.should.equal('content');
  });
  it('after <xxx@xxx.com>', function() {
    var content, text;
    text = "content\n<test@test.com>\nxxx";
    content = mailstrip(sender, text);
    return content.should.equal('content');
  });
  it('after xxx wrote:', function() {
    var content, text;
    text = "content\nOn Fri, May 25, 2012 at 1:33 PM\ntest@test.com wrote:\nxxx";
    content = mailstrip(sender, text);
    return content.should.equal('content');
  });
  it('after sent from my xxx:', function() {
    var content, text;
    text = "content\nSent from my Iphone\nxxx";
    content = mailstrip(sender, text);
    return content.should.equal('content');
  });
  it('after reply ABOVE...', function() {
    var content, text;
    text = "content\nreply ABOVE THIS LINE\nxxx";
    content = mailstrip(sender, text);
    return content.should.equal('content');
  });
  it('after original message', function() {
    var content, text;
    text = "content\n---original message---\nxxx";
    content = mailstrip(sender, text);
    return content.should.equal('content');
  });
  it('after signature', function() {
    var content, text;
    text = "content\n--\nfoo Lestavel\nxxx";
    content = mailstrip(sender, text);
    return content.should.equal('content');
  });
  return it('quotation', function() {
    var content, text;
    text = "content\n> xxxxx\n> xxxxx";
    content = mailstrip(sender, text);
    return content.should.equal('content');
  });
});
