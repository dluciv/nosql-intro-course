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

limit = 100
skip  = 30

do
  err, db <-! mc.connect url

  console.log "BRO"
  err, cursor <-! db.collection(tgt_collection_name).aggregate do
    * {$sort: { "value": -1 }}
      { $match: { "_id.board": "bro" } }
      {$skip: skip}
      {$limit: limit}
  cursor.forEach (doc)!->
    console.log doc

  console.log "X"
  err, cursor <-! db.collection(tgt_collection_name).aggregate do
    * {$sort: { "value": -1 }}
      { $match: { "_id.board": "x" } }
      {$skip: skip}
      {$limit: limit}
  cursor.forEach (doc)!->
    console.log doc

  <-! db.close!
  console.log "Closed"
