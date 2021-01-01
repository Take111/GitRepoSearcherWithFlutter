import 'package:flutter/material.dart';

class FavoriteList extends StatelessWidget {
  final items = ["AAA", "BBB", "CCC"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite List'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return _FavoriteListItem(items[index]);
        },
        itemCount: items.length,
      ),
    );
  }
}

class _FavoriteListItem extends StatelessWidget {
  final String item;

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
              child: Text(item, style: Theme.of(context).textTheme.bodyText1),
            ),
            IconButton(
                icon: Icon(Icons.auto_delete_sharp, color: Colors.black45),
                onPressed: null)
          ],
        ),
      ),
    );
  }
}
