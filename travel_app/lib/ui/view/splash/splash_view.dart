import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'splash_viewmodel.dart';

class SplashView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Center(child: Text('Developed by: Mohamed Haris')),
      ),
      viewModelBuilder: () => SplashViewModel(),
      onViewModelReady: (model) => model.initialize(),
    );
  }
}
