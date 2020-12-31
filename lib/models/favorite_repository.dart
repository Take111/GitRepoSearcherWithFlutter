import 'package:flutter/material.dart';
import 'package:gitrepo_searcher/models/entity/repository.dart';

class FavoriteRepoositoryModel extends ChangeNotifier {
  List<Repository> _repositories;

  final List<int> _repoIds = [];

  set repository(List<Repository> repositories) {
    _repositories = repositories;
    notifyListeners();
  }

  void add(Repository repository) {
    _repoIds.add(repository.id);
    notifyListeners();
  }

  void remove(Repository repository) {
    _repoIds.remove(repository.id);
    notifyListeners();
  }
}
