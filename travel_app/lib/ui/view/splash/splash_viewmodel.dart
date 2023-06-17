import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:travel/app/app.locator.dart';
import 'package:travel/app/app.router.dart';

class SplashViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  void initialize() {
    Future.delayed(Duration(seconds: 5), () async {
      _navigationService.clearStackAndShow(Routes.homeViewRoute);
    });
  }
}
