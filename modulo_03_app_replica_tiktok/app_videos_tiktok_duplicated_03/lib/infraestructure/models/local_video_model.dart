class VideoPost {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  VideoPost({
    required this.name,
    required this.videoUrl,
    required this.likes,
    required this.views,
  });


  VideoPost toVideoEntity() =>
      VideoPost(name: name, videoUrl: videoUrl, likes: likes, views: views)
}
