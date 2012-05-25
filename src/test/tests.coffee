should    = require('chai').should()
mailstrip = require '../lib'

describe 'strip', ->

  sender = 'test@test.com'

  it 'after From: test@test.com', ->

    text =
    """
    content
    From: test@test.com
    xxx
    """
    content = mailstrip sender, text
    content.should.equal 'content'

  it 'after <xxx@xxx.com>', ->

    text =
    """
    content
    <test@test.com>
    xxx
    """
    content = mailstrip sender, text
    content.should.equal 'content'

  it 'after xxx wrote:', ->

    text =
    """
    content
    On Fri, May 25, 2012 at 1:33 PM
    test@test.com wrote:
    xxx
    """
    content = mailstrip sender, text
    content.should.equal 'content'

  it 'after sent from my xxx:', ->

    text =
    """
    content
    Sent from my Iphone
    xxx
    """
    content = mailstrip sender, text
    content.should.equal 'content'

  it 'after reply ABOVE...', ->

    text =
    """
    content
    reply ABOVE THIS LINE
    xxx
    """
    content = mailstrip sender, text
    content.should.equal 'content'

  it 'after original message', ->

    text =
    """
    content
    ---original message---
    xxx
    """
    content = mailstrip sender, text
    content.should.equal 'content'

  it 'after signature', ->

    text =
    """
    content
    --
    foo Lestavel
    xxx
    """
    content = mailstrip sender, text
    content.should.equal 'content'

  it 'quotation', ->

    text =
    """
    content
    > xxxxx
    > xxxxx
    """
    content = mailstrip sender, text
    content.should.equal 'content'
