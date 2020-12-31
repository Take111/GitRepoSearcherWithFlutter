class Repository {
  final int id;
  final String name;
  final int starCount;

  Repository({this.id, this.name, this.starCount});

  factory Repository.fromJson(Map<String, dynamic> json) {
    return Repository(
      id: json['id'],
      name: json['name'],
      starCount: json['stargazers_count'],
    );
  }
}

class Repositories {
  final int totalCount;
  final List<Repository> items;

  Repositories({this.totalCount, this.items});

  factory Repositories.fromJson(Map<String, dynamic> json) {
    var list = json['items'] as List;
    List<Repository> items =
        list.map((item) => Repository.fromJson(item)).toList();

    return Repositories(totalCount: json['total_count'], items: items);
  }
}
