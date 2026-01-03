import 'package:app_videos_tiktok_duplicated_03/domain/entities/video_post.dart';

abstract class VideoPostDataSource{

  Future<List<VideoPost>> getFavoriteVideosByUser(int page);
  Future<List<VideoPost>> getTrendingByPage(int page);
}