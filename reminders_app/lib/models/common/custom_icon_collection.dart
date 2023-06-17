import 'dart:collection';

import 'package:flutter/cupertino.dart';

import 'custom_icon.dart';

class CustomIconCollection {
  final List<CustomIcon> _icons = [
    CustomIcon(icon: CupertinoIcons.bars, id: 'bars'),
    CustomIcon(icon: CupertinoIcons.alarm, id: 'alarm'),
    CustomIcon(icon: CupertinoIcons.airplane, id: 'airplane'),
    CustomIcon(icon: CupertinoIcons.calendar_today, id: 'calendar_today'),
    CustomIcon(icon: CupertinoIcons.waveform_path, id: 'waveform_patch'),
    CustomIcon(icon: CupertinoIcons.person, id: 'person'),
  ];

  UnmodifiableListView<CustomIcon> get icons => UnmodifiableListView(_icons);

  CustomIcon findIconById(id) {
    return _icons.firstWhere((customIcon) => customIcon.id == id);
  }
}
