#!/bin/fennel

(local luasql (require "luasql.sqlite3"))
(local env (luasql.sqlite3))

(fn get-cursor [db query_sql]
  (db:execute query_sql))

(fn get-next-row [cursor]
  (if cursor
    (cursor:fetch {} "a")
    (do
      (print "Cursor closed!")
      nil)))

(fn cursor-to-table [cursor]
  (local tbl {})
  (var row (get-next-row cursor))
  (while row
    (table.insert tbl row)
    (set row (get-next-row cursor))
    )
  tbl)



;; Functions that are returned on require
(local out {})

(fn out.get-db [filename]
  (env:connect "chinook.db"))

(fn out.get-db-table [db table_name]
  (local query_sql
    (.. "SELECT * FROM " table_name ";"))
  (cursor-to-table (get-cursor db query_sql))
  )

out
