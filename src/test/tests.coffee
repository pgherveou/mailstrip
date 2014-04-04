should    = require('chai').should()
mailstrip = require '../lib'

describe 'strip', ->

  sender = 'test@test.com'

  it 'after From: test@test.com', ->
    mailstrip(
      '''
      content
      From: test@test.com
      xxx
      '''
    ).should.equal 'content'

  it 'after <xxx@xxx.com>', ->
    mailstrip(
      '''
      content
      <test@test.com>
      xxx
      '''
    ).should.equal 'content'

  it 'after yyyy/mm/dd ... <xxx@xxx.com>', ->
    mailstrip(
      '''
      content
      2012/10/30 ... <xxx@xxx.com>
      xxx
      '''
    ).should.equal 'content'

  it 'after ... <xxx@xxx.com> ...', ->
    mailstrip(
      '''
      content

      On Tue, Oct 2, 2012 at 1:18 PM, Image Description <someone@domain.com> wrote:
      xxx
      '''
    ).should.equal 'content'

  it 'after On ..., ...\n... wrote:', ->
      mailstrip(
        '''
        content

        On Tue, Oct 2, 2012 at 1:18 PM, Image Description
        <someone@domain.com> wrote:
        xxx
        '''
      ).should.equal 'content'

  it 'after On xxx wrote:', ->
    content = '''
    On your mark
    Ready
    GO !
    '''
    mailstrip(
      """
      #{content}
      On Fri, May 25, 2012 at 1:33 PM test@test.com wrote:
      xxx
      """
    ).should.equal content

  it 'after On xxx wrote: (2)', ->
    mailstrip(
      '''
      content
      On Thu, Apr 3, 2014 at 5:57 PM, Pierre-Guillaume Herveou <
      notifications@jogabo.com> wrote:

      > xxx
      > xxx
      '''
    ).should.equal('content')

  it 'after Le xxx a écrit', ->
    mailstrip(
      '''
      content
      Le 12 juin 2012 à 17:50, "test" <test@test.com> a écrit :
      xxx
      '''
    ).should.equal 'content'

  it 'after Le xxx a écrit (2)', ->
    mailstrip(
      '''
      voila le content
      Le 12 juin 2012 à 17:50, "test" <test@test.com> a écrit :
      xxx
      '''
    ).should.equal 'voila le content'

  it 'after sent from my xxx:', ->
    mailstrip(
      '''
      content
      Sent from my Iphone
      xxx
      '''
    ).should.equal 'content'

  it 'after Envoye de mon xxx', ->
    mailstrip(
      '''
      content
      envoyé de mon ipad
      xxx
      '''
    ).should.equal 'content'

  it 'after envoyé depuis mon xxx', ->
    mailstrip(
      '''
      content
      envoyé depuis mon iphone
      xxx
      '''
    ).should.equal 'content'

  it 'after reply ABOVE...', ->
    mailstrip(
      '''
      content
      reply ABOVE THIS LINE
      xxx
      '''
    ).should.equal 'content'

  it 'after original message', ->
    mailstrip(
      '''
      content
      ---original message---
      xxx
      '''
    ).should.equal 'content'

  it 'after signature', ->
    mailstrip(
      '''
      content
      --
      foo Lestavel
      xxx
      '''
    ).should.equal 'content'

  it 'quotation', ->
    mailstrip(
      '''
      content
      > xxxxx
      > xxxxx
      '''
    ).should.equal 'content'
