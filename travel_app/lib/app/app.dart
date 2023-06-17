import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:travel/ui/view/home/home_view.dart';
import 'package:travel/ui/view/package/package_view.dart';
import 'package:travel/ui/view/splash/splash_view.dart';

@StackedApp(routes: [
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: HomeView, name: 'homeViewRoute'),
  MaterialRoute(page: PackageView, name: 'packageViewRoute'),
], dependencies: [
  LazySingleton(classType: DialogService),
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: NavigationService),
])
class App {}
