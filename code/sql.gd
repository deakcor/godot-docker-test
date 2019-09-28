extends Node

const SQLite = preload("res://lib/gdsqlite.gdns")
const PATH = "res://db/base.sql"

#TEST AND CREATE
func test_DB() -> bool:
	var dir: Directory = Directory.new()
	var file: File = File.new()
	
	if ! dir.dir_exists("res://db"):
		dir.make_dir("res://db")
	if ! file.file_exists(PATH): 
		file.open(PATH, File.WRITE)
		file.close()
	return query("CREATE TABLE IF NOT EXISTS articles ( `id` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT UNIQUE, `name` TEXT, `price` NUMERIC, `image` TEXT )")

# QUERY VOID 
func query(query: String) -> bool:
	var db = SQLite.new()
	db.open_db(PATH)
	var result = db.query(query)
	db.close()
	print(str(result) + ":" + str(query))
	return result
	
#query ARRAY
func array(query: String) -> Array:
	var db = SQLite.new()
	db.open_db(PATH)
	print(query)
	var lst: Array = db.fetch_array(query)
	db.close()
	return  lst
	
