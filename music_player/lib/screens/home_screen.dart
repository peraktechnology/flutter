import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/track_provider.dart';
import '../widgets/glass_morphism.dart';
import '../extensions/format_string.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.topCenter,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/background.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Consumer<TracksProvider>(
          builder: (context, val, child) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AudioPlayerSection(
                size: size,
                val: val,
              ),
              Expanded(
                child: GlassBox(
                  radius: 32,
                  width: size.width,
                  child: ListView.builder(
                    itemBuilder: (context, index) => Column(
                      children: [
                        ListTile(
                          title: Text(
                            val.tracks[index].trackName,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.white,
                            ),
                          ),
                          subtitle: Text(
                            val.tracks[index].artist!.join(', '),
                            style: const TextStyle(
                              color: Colors.white54,
                            ),
                          ),
                          leading: CircleAvatar(
                            child: Image.network(val.tracks[index].coverArt),
                          ),
                          trailing: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: IconButton(
                              onPressed: () async {
                                val.playing(index);
                              },
                              icon: const Icon(
                                Icons.play_arrow,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.white54,
                          indent: 12,
                          endIndent: 12,
                        ),
                      ],
                    ),
                    itemCount: val.size,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AudioPlayerSection extends StatefulWidget {
  const AudioPlayerSection({
    Key? key,
    required this.size,
    required this.val,
  }) : super(key: key);

  final Size size;
  final TracksProvider val;

  @override
  State<AudioPlayerSection> createState() => _AudioPlayerSectionState();
}

class _AudioPlayerSectionState extends State<AudioPlayerSection> {
  AudioPlayer player = AudioPlayer();
  Duration? duration = const Duration(seconds: 0);

  int index = 0;
  bool isPlaying = false;
  double value = 0;

  void initPlayer() async {
    value = 0;
    index = widget.val.nowPlaying;
    await player.setSourceUrl(widget.val.tracks[index].previewUrl);
    duration = await player.getDuration();
  }

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    initPlayer();
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant AudioPlayerSection oldWidget) {
    initPlayer();
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 4.0,
        left: 4.0,
        top: MediaQuery.of(context).padding.top,
      ),
      height: widget.size.height * .45,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: widget.size.height * .2,
            width: widget.size.width * .6,
            child: Image.network(
              widget.val.tracks[index].coverArt,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.val.tracks[index].trackName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          Text(
            widget.val.tracks[index].artist!.join(', '),
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  value.toTime(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                Expanded(
                  child: Slider.adaptive(
                    value: value,
                    min: 0,
                    max: duration!.inSeconds.toDouble(),
                    onChanged: (newVal) {
                      setState(() {
                        value = newVal.toDouble();
                      });
                    },
                    activeColor: Colors.white54,
                    onChangeEnd: (newValue) async {
                      setState(() {
                        value = newValue;
                      });
                      // Pause to select time
                      player.pause();

                      // Move cursor to selected
                      await player.seek(Duration(seconds: newValue.toInt()));

                      await player.resume();
                    },
                  ),
                ),
                Text(
                  duration!.toTime(),
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GlassBox(
                radius: 100,
                width: 40,
                height: 40,
                child: IconButton(
                  onPressed: () async {
                    /// play = true
                    if (isPlaying) {
                      setState(() {
                        isPlaying = false;
                      });
                      await player.pause();
                    } else {
                      /// Play music
                      await player.resume();
                      setState(() {
                        isPlaying = true;
                      });

                      /// Change position
                      player.onPositionChanged.listen((pos) {
                        setState(() {
                          value = pos.inSeconds.toDouble();
                        });
                      });
                    }
                  },
                  icon: Icon(
                    isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
