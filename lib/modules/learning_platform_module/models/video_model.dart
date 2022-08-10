class VideoModel {
  final String? thumnail;
  final String? videoUrl;
  final String? title;
  final String? trainer;
  final String? duration;
  final int? numberOfPitching;
  final bool? isSave;
  final String? aboutCourse;
  final List<VideoModel>? relatedVideo;

  VideoModel(
      {this.thumnail,
      this.videoUrl,
      this.title,
      this.trainer,
      this.duration,
      this.numberOfPitching,
      this.isSave = false,
      this.aboutCourse,
      this.relatedVideo});
}
