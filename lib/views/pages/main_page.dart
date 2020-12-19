import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_example/view_models/main_page_view_model.dart';
import 'package:flutter_mvvm_example/views/widgets/characters_panel.dart';
import 'package:flutter_mvvm_example/views/widgets/films_panel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  final MainPageViewModel viewModel;

  MainPage({Key key, @required this.viewModel}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  TabController tabController;

  Future loadData() async {
    await widget.viewModel.setFilms();
    await widget.viewModel.setCharacters();
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'STAR WARS INFO',
        ),
        bottom: TabBar(
          controller: tabController,
          indicatorColor: Colors.yellowAccent,
          indicatorWeight: 3.0,
          tabs: <Widget>[
            Tab(child: Text("Daftar Film"),),
            Tab(child: Text("Pemain Film"),),
          ],
        ),
      ),
      body: ScopedModel<MainPageViewModel>(
        model: widget.viewModel,
        child: TabBarView(
          controller: tabController,
          children: <Widget>[
            FilmsPanel(),
            CharactersPanel(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController?.dispose();
    super.dispose();
  }
}