#!/bin/fennel
;; For repl run using:
;; fennel --assert-as-repl main.fnl

(local fennel (require :fennel))
(local sql (require :sql))

(local db (sql.get-db "chinook.db"))

;; get table from default db
(fn get-table [table_name]
  (sql.get-db-table db table_name))

;; Enter repl with functions
(assert nil "Entering repl")
