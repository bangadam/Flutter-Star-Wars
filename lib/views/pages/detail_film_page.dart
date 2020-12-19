import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/models/character.dart';
import 'package:flutter_mvvm_example/models/film.dart';

class DetailFilm extends StatelessWidget {
  final Film film;
  DetailFilm({this.film});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(film?.title),
      ),
      body: Column(
        children: <Widget>[
          Card(child: 
            Row(children: [
              Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Judul Film : ${film?.title}"),
                      Text("Tanggal Rilis : ${film?.releaseDate}"),
                      Text("Produser : ${film?.producer}"),
                      Text("Deskripsi : ${film?.openingCrawl}"),
                    ],
                  ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}