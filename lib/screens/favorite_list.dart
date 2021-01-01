import 'package:flutter/material.dart';
import 'package:gitrepo_searcher/models/entity/repository.dart';
import 'package:gitrepo_searcher/models/favorite_repository.dart';
import 'package:provider/provider.dart';

class FavoriteList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var favorite = context.watch<FavoriteRepoositoryModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite List'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return _FavoriteListItem(favorite.items[index]);
        },
        itemCount: favorite.items.length,
      ),
    );
  }
}

class _FavoriteListItem extends StatelessWidget {
  final Repository item;

  _FavoriteListItem(this.item, {Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: LimitedBox(
        child: Row(
          children: [
            IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.pink,
                ),
                onPressed: null),
            SizedBox(width: 24),
            Expanded(
              child:
                  Text(item.name, style: Theme.of(context).textTheme.bodyText1),
            ),
            IconButton(
                icon: Icon(Icons.auto_delete_sharp, color: Colors.black45),
                onPressed: () {
                  var favoriteItem = context.read<FavoriteRepoositoryModel>();
                  favoriteItem.remove(item);
                })
          ],
        ),
      ),
    );
  }
}
