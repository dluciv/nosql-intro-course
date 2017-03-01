## MongoDB: пример запроса

    x2 = db.contact.aggregate([
         { $match: { "hiredate": {"$lt": new ISODate("20130601") }}},
         { $unwind: "$phones"},
         { $group: { "_id": "$phones.type",
                     "n": {$sum: 1},
                     "who": {$push: "$name"},
                   }},
         { $match: { "n": {"$gt": 1}} },
         { $sort: { "n": -1, "_id": 1} }
         ]);
    x2.forEach(function(r) { printjson(r); });
