import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:gitrepo_searcher/manager/search_manager.dart';
import 'package:gitrepo_searcher/models/entity/repository.dart';

class RepoList extends StatelessWidget {
  final manager = SearchManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RepoLIst'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite, color: Colors.white),
            onPressed: () {
              Navigator.pushNamed(context, '/favorite_list');
            },
          ),
        ],
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
    final int starCount = item.starCount;
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
            // 本当はitem.starCountで埋め込みたい、、、
            Text("\ $starCount stars")
          ],
        ),
      ),
    );
  }
}
