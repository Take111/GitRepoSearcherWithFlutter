import 'package:flutter/material.dart';
import 'package:gitrepo_searcher/models/entity/repository.dart';
import 'package:gitrepo_searcher/models/favorite_repository.dart';
import 'package:gitrepo_searcher/screens/favorite_list.dart';
import 'package:gitrepo_searcher/screens/list.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => Repository()),
        ChangeNotifierProxyProvider<Repository, FavoriteRepoositoryModel>(
          create: (context) => FavoriteRepoositoryModel(),
          update: (context, repository, favorite) {
            favorite.repository = repository;
            return favorite;
          },
        ),
      ],
      child: MaterialApp(        
        initialRoute: '/list',
        routes: {
          '/list': (context) => RepoList(),
          '/favorite_list': (context) => FavoriteList(),
        },
      ),
    );
  }
}