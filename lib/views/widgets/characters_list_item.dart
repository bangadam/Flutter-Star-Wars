import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/views/pages/detail_character_page.dart';
import 'package:flutter_mvvm_example/models/character.dart';
import 'package:flutter_mvvm_example/utils/star_wars_styles.dart';

class CharactersListItem extends StatelessWidget {
  final Character character;

  CharactersListItem({@required this.character});

  @override
  Widget build(BuildContext context) {
    var title = Text(
      character?.name,
      style: TextStyle(
        color: StarWarsStyles.titleColor,
        fontWeight: FontWeight.bold,
        fontSize: StarWarsStyles.titleFontSize,
      ),
    );

    var subTitle = Text(
      character?.birthYear,
      style: TextStyle(
        color: StarWarsStyles.subTitleColor,
      ),
    );

    return  InkWell(
      child: Card(
          child: ListTile(title: title,
          subtitle: subTitle,
          trailing: Icon(Icons.arrow_right),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailCharacter(character: character)),
            );
          },
        ),
      ),
    );
  }
}