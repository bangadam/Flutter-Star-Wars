import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/models/film.dart';
import 'package:flutter_mvvm_example/utils/star_wars_styles.dart';
import 'package:flutter_mvvm_example/views/pages/detail_film_page.dart';

class FilmsListItem extends StatelessWidget {
  final Film film;

  FilmsListItem({@required this.film});

  @override
  Widget build(BuildContext context) {
    var title = Text(
      film?.title,
      style: TextStyle(
        color: StarWarsStyles.titleColor,
        fontWeight: FontWeight.bold,
        fontSize: StarWarsStyles.titleFontSize,
      ),
    );

    var subTitle = Text(
      film?.director,
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
                  builder: (context) => DetailFilm(film: film)),
            );
          },
        ),
      ),
    );
    // return Column(
    //   children: <Widget>[
    //     Card(child: title,),
    //     ListTile(
    //       contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
    //       title: title,
    //       subtitle: subTitle,
    //     ),
    //     Divider(),
    //   ],
    // );
  }
}