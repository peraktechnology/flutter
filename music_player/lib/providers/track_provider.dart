import 'package:flutter/material.dart';

import '../data/track_data.dart';
import '../models/track.dart';

class TracksProvider with ChangeNotifier {
  final List<Track> _tracks = DummyTracks.tracks;

  List<Track> get tracks => [..._tracks];

  int get size => _tracks.length;

  int? _nowPlayng = 0;

  int get nowPlaying {
    return _nowPlayng!;
  }

  void playing(int index) {
    _nowPlayng = index;
    notifyListeners();
  }
}
