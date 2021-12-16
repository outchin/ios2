import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../models/home_content.dart';
import '../../screen/genre_screen.dart';
import '../../screen/movie_by_genere_id.dart';
import '../../strings.dart';
import '../../style/theme.dart';
import '../../widgets/home_screen_more_widget.dart';

// ignore: must_be_immutable
class HomeScreenGenreList extends StatelessWidget {
  List<AllGenre>? genreList;
  bool? isDark;
  HomeScreenGenreList({required this.genreList, this.isDark});

  final List<LinearGradient> gradientBG = [
    CustomTheme.gradient1,
    CustomTheme.gradient2,
    CustomTheme.gradient3,
    CustomTheme.gradient4,
    CustomTheme.gradient5,
    CustomTheme.gradient6,
  ];

  int index = 0;
  LinearGradient getRandomColor() {
    if (index >= 5) {
      index = 0;
    }
    index++;
    return gradientBG[index];
  }

  @override
  Widget build(BuildContext context) {
    printLog("HomeScreenGenreList");
    return Container(
        );
  }
}
