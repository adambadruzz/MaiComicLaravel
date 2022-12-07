class FavoriteModel {
  final String cover,
      comic_name,
      author_name,
      // comic_name,
      // user_username,
      status,
      type,
      description,
      username,
      email,
      instagram,
      password;
  final int id_bookmark, comic_id, user_id, episode;

  FavoriteModel(
      {required this.id_bookmark,
      required this.comic_id,
      required this.user_id,
      required this.cover,
      required this.comic_name,
      // required this.comic_name,
      // required this.user_username,
      required this.author_name,
      required this.status,
      required this.type,
      required this.description,
      required this.username,
      required this.email,
      required this.instagram,
      required this.password,
      required this.episode});

  factory FavoriteModel.fromJSON(Map parsedJson) {
    return FavoriteModel(
        id_bookmark: parsedJson['id_bookmark'],
        comic_id: parsedJson['comic_id'],
        user_id: parsedJson['user_id'],
        cover: parsedJson['cover'],
        comic_name: parsedJson['comic_name'],
        // comic_name: parsedJson['comic_name'],
        // user_username: parsedJson['user_username'],
        author_name: parsedJson['author_name'],
        status: parsedJson['status'],
        type: parsedJson['type'],
        description: parsedJson['description'],
        username: parsedJson['username'],
        email: parsedJson['email'],
        instagram: parsedJson['instagram'],
        password: parsedJson['password'],
        episode: parsedJson['episode']);
  }
}

class FavoriteModelDetail {
  final int id_bookmark, comic_id, user_id;

  FavoriteModelDetail({
    required this.id_bookmark,
    required this.comic_id,
    required this.user_id,
  });

  factory FavoriteModelDetail.fromJSON(Map parsedJson) {
    return FavoriteModelDetail(
        id_bookmark: parsedJson['id_bookmark'],
        comic_id: parsedJson['comic_id'],
        user_id: parsedJson['user_id']);
  }
}
