#!/usr/bin/env lsc -k

require! \mongodb
require! \glob
require! \path
require! \fs
pl = require \prelude-ls

mc = mongodb.MongoClient

src_collection_name = 'aib_texts'
tgt_collection_name = 'aib_words_count'
db_name = 'text_tests'
url = "mongodb://localhost:27017/#{db_name}"

do
  err, db <-! mc.connect url

  err, res <-! db.collection(tgt_collection_name).remove!

  err, res <-! db.collection(src_collection_name).mapReduce do
    !->
      words = this.plaintext.match /[\u0400-\u04FF\u0500-\u052F-]+/g
      if words # matched something
        stemmed_words = rporter_stemmer words
        for w in stemmed_words
          emit {board: this.board, word: w}, 1
      else # english text for example
        print "No russian words in #{this.plaintext}"
    (key, values) ->
      var r
      r := 0
      # not just values.length: http://stackoverflow.com/a/11264843/539470
      for v in values
        r += v
      r
    do
      out: tgt_collection_name

  console.log "MapReduce error, if any: #{err}"

  err, res <-! db.collection(tgt_collection_name).createIndex {"value": -1}

  <-! db.close!
  console.log "Closed"
