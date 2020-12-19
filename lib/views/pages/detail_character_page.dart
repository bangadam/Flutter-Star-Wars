import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/models/character.dart';

class DetailCharacter extends StatelessWidget {
  final Character character;
  DetailCharacter({this.character});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(character?.name),
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
                      Text("Jenis Kelamin : ${character?.gender}"),
                      Text("Tinggi badan : ${character?.height} cm"),
                      Text("Tanggal Lahir : ${character?.birthYear}"),
                      Text("Warna Mata : ${character?.eyeColor}"),
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