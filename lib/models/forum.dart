class Forum {
  late final String title;
  late List<dynamic> posts;
  late final String id;

  Forum({required this.title, required this.posts, required this.id});

}

class ForumPost{
  late final String title;
  late final String text;

  ForumPost({required this.title, required this.text});
}