import 'package:flutter/material.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';

class RepoList extends StatelessWidget {
  final model = RepoModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RepoLIst'),
      ),
      body: SearchBar(
        onSearch: null,
        onItemFound: (number, index) {
          print("itemFound");
          return _RepoListItem("");
        },
      ),
    );
  }
}

class _RepoListItem extends StatelessWidget {
  final String name;

  _RepoListItem(this.name, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: LimitedBox(
        maxHeight: 30,
        child: Row(
          children: [
            Icon(Icons.access_alarm_sharp),
            SizedBox(width: 24),
            Expanded(
              child: Text(
                name,
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
            SizedBox(width: 24),
          ],
        ),
      ),
    );
  }
}

class RepoModel {
  final List<String> repos = ["AAA", "BBB", "CCC", "DDD", "EEE"];
}
