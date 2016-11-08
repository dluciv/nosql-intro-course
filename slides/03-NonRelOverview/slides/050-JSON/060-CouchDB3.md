## CouchDB: пример запроса (view)

    function find_users_whose_last_names_start_with(db, query) {
        var matches;
        matches = db.view('users/last_names',
                          { startkey: query,
                            endkey:   query + "\u9999" });
        return matches.rows.map(dot('value'));
    }
