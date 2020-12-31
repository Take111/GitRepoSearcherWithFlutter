import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:gitrepo_searcher/manager/search_manager.dart';
import 'package:gitrepo_searcher/models/repository.dart';

class RepoList extends StatelessWidget {
  final manager = SearchManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RepoLIst'),
      ),
      body: SearchBar(
        onSearch: manager.searchRepo,
        onItemFound: (repo, index) {
          return _RepoListItem(repo);
        },
      ),
    );
  }
}

class _RepoListItem extends StatelessWidget {
  final Repository item;

  _RepoListItem(this.item, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int startCount = item.starCount;
    final bool isFavorite = false;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: LimitedBox(
        maxHeight: 30,
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.favorite,
                    color: isFavorite ? Colors.pink : Colors.grey),
                onPressed: null), // TODO
            SizedBox(width: 24),
            Expanded(
              child: Text(
                item.name,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            SizedBox(width: 24),
            Text("\ $startCount stars")
          ],
        ),
      ),
    );
  }
}
