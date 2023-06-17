import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:travel/app/app.locator.dart';
import 'package:travel/app/app.router.dart';
import 'package:travel/ui/view/home/home.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();

  List<CategoryButton> _categoryList = [];
  List<CategoryButton> get categoryList => _categoryList;

  List<Place> _placesList = [];
  List<Place> get placesList => _placesList;

  List<Package> _packageList = [];
  List<Package> get packageList => _packageList;

  void initialize() {
    _categoryList.add(CategoryButton(
        categoryName: "Beach",
        imagePath: "images/beach_icon.png",
        isSelected: true));
    _categoryList.add(CategoryButton(
        categoryName: "Mountain",
        imagePath: "images/mountain_icon.png",
        isSelected: false));
    _categoryList.add(CategoryButton(
        categoryName: "Beach",
        imagePath: "images/beach_icon.png",
        isSelected: false));

    _placesList.add(Place(
        placeName: 'Kuta Beach',
        imagePath: "images/bg1.png",
        desc:
            "One of the most happening beaches in Goa, Baga Beach is where you will find water sports, fine dining restaurants, bars, and clubs. Situated in North Goa, Baga Beach is bordered by Calangute and Anjuna Beaches.",
        location: "Bali, Indonesia",
        rating: 4.2,
        isLiked: true,
        price: "20,000"));

    _placesList.add(Place(
        placeName: 'Baga Beach',
        imagePath: "images/bg2.png",
        desc:
            "One of the most happening beaches in Goa, Baga Beach is where you will find water sports, fine dining restaurants, bars, and clubs. Situated in North Goa, Baga Beach is bordered by Calangute and Anjuna Beaches.",
        location: "Goa, India",
        rating: 4.8,
        isLiked: false,
        price: "15,000"));

    _placesList.add(Place(
        placeName: 'Coastal Beach',
        imagePath: "images/bg4.jpg",
        desc:
            "One of the most happening beaches in Goa, Baga Beach is where you will find water sports, fine dining restaurants, bars, and clubs. Situated in North Goa, Baga Beach is bordered by Calangute and Anjuna Beaches.",
        location: "Costa Rica, Brazil",
        rating: 4.7,
        isLiked: false,
        price: "25,000"));

    _packageList.add(Package(
        packageName: "Kuta Resort",
        price: "20,000",
        imagePath: 'images/bg3.png',
        desc:
            "A resort is a place used for vacation, relaxation or as a day...",
        rating: 4.8,
        isLiked: false));

    _packageList.add(Package(
        packageName: "Baga Beach Resort",
        price: "15,000",
        imagePath: 'images/bg2.png',
        desc:
            "A resort is a place used for vacation, relaxation or as a day...",
        rating: 4.8,
        isLiked: false));
    notifyListeners();
  }

  void updateIsSelected(int index) {
    _categoryList[index].isSelected = !_categoryList[index].isSelected;
    notifyListeners();
  }

  void updateIsLiked(int index) {
    _placesList[index].isLiked = !_placesList[index].isLiked;
    notifyListeners();
  }

  void navigateToPackage(Place placeDetails) {
    _navigationService.navigateTo(Routes.packageViewRoute,
        arguments: PackageViewArguments(
          placeDetails: placeDetails,
        ));
  }
}
