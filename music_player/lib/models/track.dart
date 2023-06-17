// ignore_for_file: public_member_api_docs, sort_constructors_first
class Track {
  final String id;
  final String trackName;
  final List<String>? artist;
  final String previewUrl;
  final String coverArt;
  final String? spotifyExternal;

  Track({
    required this.id,
    required this.trackName,
    required this.artist,
    required this.previewUrl,
    required this.coverArt,
    this.spotifyExternal,
  });
}
