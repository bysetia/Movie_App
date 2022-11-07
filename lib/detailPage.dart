import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:like_button/like_button.dart';
import 'db_movie.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key, required this.movie}) : super(key: key);
  Results movie;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool onthefav = false;
  var database;
  void initState() {
    super.initState();
    initDb();
  }

  Future initDb() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'movie_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE movie(id INTEGER, title TEXT, posterPath TEXT, overview TEXT, originalLanguage TEXT, popularity INTEGER, backdropPath TEXT, releaseDate INTEGER)',
        );
      },
      version: 1,
    );
    onthefav = await read(widget.movie.title);
    setState(() {});
  } //Read

  Future<bool> read(String? title) async {
    final Database db = await database;
    final data =
        await db.query('movie', where: "title = ?", whereArgs: [title]);
    if (data.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> delete(Results? movie) async {
    final db = await database;
    await db.delete(
      'movie',  
      where: "title = ?",
      whereArgs: [movie!.title],
    );
    setState(() {
      onthefav = false;
    });
  }

  Future<void> insertApi(Results movie) async {
    final db = await database;
    await db.insert(
      'movie',
      movie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    setState(() {
      onthefav = true;
    });
  }

  db_movie? apiMovie;
  bool isloaded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 34, 37, 53),
        body: Column(children: [
          Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: FadeInImage.assetNetwork(
                placeholder: 'image/loading.gif',
                image: "https://themoviedb.org/t/p/w500/" +
                    widget.movie.backdropPath.toString(),
                fit: BoxFit.fitWidth,
              )),
          Container(
            margin: EdgeInsets.only(left: 50, top: 20),
            child: Row(
              children: [
                Container(
                    margin: EdgeInsets.only(right: 20),
                    width: 100,
                    height: 150,
                    child: FadeInImage.assetNetwork(
                      placeholder: 'image/loading.gif',
                      image: "https://themoviedb.org/t/p/w500/" +
                          widget.movie.posterPath.toString(),
                    )),
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 10, right: 80),
                      width: 150,
                      child: Text(
                        widget.movie.title.toString(),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 75),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          star(),
                          star(),
                          star(),
                          star(),
                          star(),
                          Text(
                            " " + widget.movie.popularity.toString(),
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 12, right: 60),
                      alignment: Alignment.topLeft,
                      child: Row(
                        children: [
                          Text(
                            "Release Date :  ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          Text(
                            widget.movie.releaseDate.toString(),
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: IconButton(
                                  onPressed: () {
                                    onthefav
                                        ? delete(widget.movie)
                                        : insertApi(widget.movie);
                                  },
                                  icon: onthefav
                                      ? Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                          size: 35,
                                        )
                                      : Icon(
                                          Icons.favorite_border,
                                          color: Colors.white,
                                          size: 35,
                                        )),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 20, right: 10),
                              child: Text(
                                "Favorite",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10, top: 10),
                          child: LikeButton(likeBuilder: (isTapped) {
                            return Icon(
                              Icons.bookmark,
                              size: 35,
                              color: isTapped ? Colors.pink : Colors.grey,
                            );
                          }),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                            "Save",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "______________________________________________________",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 5),
            width: 350,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Overview : ",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    widget.movie.overview.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}

class star extends StatelessWidget {
  const star({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      color: Colors.yellow,
      size: 18,
    );
  }
}
