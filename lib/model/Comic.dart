class ComicModel {
  final String cover, comic_name, author_name, status, type, description;
  final int author_id, id_comic, episode;

  ComicModel({
    required this.cover,
    required this.comic_name,
    required this.author_name,
    required this.id_comic,
    required this.episode,
    required this.author_id,
    required this.status,
    required this.type,
    required this.description,
  });

  factory ComicModel.fromJSON(Map parsedJson) {
    return ComicModel(
        cover: parsedJson['cover'],
        comic_name: parsedJson['comic_name'],
        author_name: parsedJson['author_name'],
        id_comic: parsedJson['id_comic'],
        episode: parsedJson['episode'],
        author_id: parsedJson['author_id'],
        status: parsedJson['status'],
        type: parsedJson['type'],
        description: parsedJson['description']);
  }
}
