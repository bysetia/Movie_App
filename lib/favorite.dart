import 'package:flutter/material.dart';
import 'db_movie.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'detailPage.dart';

class Favmviepge extends StatefulWidget {
  const Favmviepge({Key? key}) : super(key: key);

  @override
  State<Favmviepge> createState() => _FavmviepgeState();
}

class _FavmviepgeState extends State<Favmviepge> {
  var database;

  List<Results> movifav = <Results>[];

//open database
  Future initDb() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'movie_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE movie(id INTEGER, title TEXT, posterPath TEXT, overview TEXT, originalLanguage TEXT, popularity INTEGER,backdropPath TEXT, releaseDate INTEGER)',
        );
      },
      version: 1,
    );
    getMovifav().then((value) {
      setState(() {
        movifav = value;
      });
    });
  }

//ambil data dari database
  Future<List<Results>> getMovifav() async {
    final Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('movie');
    return List.generate(maps.length, (i) {
      return Results(
        id: maps[i]['id'] as int,
        title: maps[i]['title'] as String,
        overview: maps[i]['overview'] as String,
        originalLanguage: maps[i]['originalLanguage'] as String,
        posterPath: maps[i]['posterPath'],
        popularity: maps[i]['popularity'],
        backdropPath: maps[i]['backdropPath'],
        releaseDate: maps[i]['releaseDate'],
      );
    });
  }

//Delete data
  Future<void> deleteResult(int? id) async {
    final db = await database;
    await db.delete(
      'movie',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  @override
  void initState() {
    super.initState();
    initDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.white,
              )),
        ],
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          "Favorite",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView.builder(
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                          movie: movifav[index],
                        )),
              ).then((value) => initDb());
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 5.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  color: Color.fromARGB(255, 28, 28, 28),
                  child: Container(
                    margin: EdgeInsets.all(15),
                    child: Container(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: FadeInImage.assetNetwork(
                              placeholder: 'image/loading.gif',
                              image: 'https://themoviedb.org/t/p/w500/' +
                                  movifav[index].posterPath.toString(),
                              height: 100,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: 150,
                                    child: Text(
                                      movifav[index].title.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    child: Text(
                                      "ID : " + movifav[index].id.toString(),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                ]),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 90),
                            child: InkWell(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text("Delete " +
                                        movifav[index].title.toString()),
                                    content: Text("Are you sure to delete " +
                                        movifav[index].title.toString() +
                                        " from favorite"),
                                    actions: <Widget>[
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("No")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            deleteResult(movifav[index].id!)
                                                .then((value) {
                                              getMovifav().then((value) {
                                                setState(() {
                                                  movifav = value;
                                                });
                                              });
                                            });
                                          },
                                          child: Text("Yes")),
                                    ],
                                  ),
                                );
                              },  
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 30,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        itemCount: movifav.length,
      ),
    );
  }
}
