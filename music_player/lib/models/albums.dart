class SpotifyAlbum {
  final String id;
  final String uri;
  final String name;
  final List<String>? artistsId;
  final String? coverArt;
  final int? year;

  SpotifyAlbum({
    required this.id,
    required this.uri,
    required this.name,
    this.artistsId,
    this.coverArt,
    this.year,
  });
}

class SpotifyArtist {
  final String id;

  SpotifyArtist({
    required this.id,
  });
}
