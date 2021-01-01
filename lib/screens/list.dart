import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:gitrepo_searcher/manager/search_manager.dart';
import 'package:gitrepo_searcher/models/entity/repository.dart';
import 'package:gitrepo_searcher/models/favorite_repository.dart';
import 'package:provider/provider.dart';

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
            _FavoriteButton(item: item),
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

class _FavoriteButton extends StatelessWidget {
  final Repository item;

  const _FavoriteButton({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInFavorite = context.select<FavoriteRepoositoryModel, bool>(
      (favorite) => favorite.items.contains(item),
    );

    return IconButton(
        icon: Icon(
          Icons.favorite,
          color: isInFavorite ? Colors.pink : Colors.grey,
        ),
        onPressed: isInFavorite
            ? () {
                print("Is In Favorite");
                var favoriteItem = context.read<FavoriteRepoositoryModel>();
                favoriteItem.remove(item);
              }
            : () {
                print("Is not In Favorite");
                var favoriteItem = context.read<FavoriteRepoositoryModel>();
                favoriteItem.add(item);
              });
  }
}
