#!/usr/bin/env lsc -k

require! \mongodb
require! \glob
require! \path
require! \fs
pl = require \prelude-ls

mc = mongodb.MongoClient

collection_name = 'aib_texts'
db_name = 'text_tests'
url = "mongodb://localhost:27017/#{db_name}"

var cnt
cnt := 0

insdata = (col, cbb) !->

  insdoc = (fn, cb) !->
    err, filecontent <-! fs.readFile fn

    content = filecontent.toString!.replace /\r\n/g, '\n'

    [bn, ns, void, void] = (path.parse fn).base.split '.'
    nv = Number.parseInt ns
    doc = do
      imageboard: 'iichan'
      order: nv
      board: bn
      plaintext: content
    err, res <-! col.insert doc
    cnt += 1
    console.log "#{cnt} -- #{err} -- #{res}"
    cb!

  insdocs = (l, cb) !->
    if not pl.empty l
      <-! insdoc pl.head l
      insdocs (pl.tail l), cb
    else
      cb!

  err, filenames <-! glob.glob '__data/*'
  insdocs filenames, cbb  

do
  err, db <-! mc.connect url

  err, res <-! db.collection(collection_name).remove!

  err, col <-! db.createCollection collection_name

  <-! insdata col

  <-! db.close!
  console.log "Closed"
