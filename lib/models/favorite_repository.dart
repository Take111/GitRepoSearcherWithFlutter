import 'package:flutter/material.dart';
import 'package:gitrepo_searcher/models/entity/repository.dart';

class FavoriteRepoositoryModel extends ChangeNotifier {
  Repository _repository;

  final List<Repository> _repositories = [];

  List<Repository> get items => _repositories;

  set repository(Repository repository) {
    _repository = repository;
    notifyListeners();
  }

  void add(Repository repository) {
    _repositories.add(repository);
    notifyListeners();
  }

  void remove(Repository repository) {
    _repositories.remove(repository);
    notifyListeners();
  }
}
