import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:travel/ui/view/widgets/location_widget.dart';
import 'package:travel/ui/view/widgets/rating_widget.dart';

import 'home_viewmodel.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Container(
                        height: 32,
                        width: 32,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Hello, Vineetha',
                        style: GoogleFonts.inter(
                          textStyle:
                              TextStyle(color: Colors.black, fontSize: 17),
                        ),
                      ),
                      Spacer(),
                      Image.asset('images/notification_icon.png'),
                    ],
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Text(
                    'Where do you \nwant to explore today?',
                    maxLines: 2,
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      filled: true,
                      fillColor: Colors.black.withOpacity(0.03),
                      hintStyle: GoogleFonts.inter(
                        textStyle:
                            TextStyle(color: Colors.black.withOpacity(0.2)),
                      ),
                      border: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 1.0),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 1.0),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Colors.transparent, width: 1.0),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ),
                _subTitle('Choose Category'),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 80,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: model.categoryList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(
                        child: _categoryButton(model, index),
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  height: 270,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: model.placesList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Center(child: _placeDisplay(model, index));
                    },
                  ),
                ),
                _subTitle('Popular Package'),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: model.packageList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return _packageView(model, index);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (model) => model.initialize(),
    );
  }

  Widget _categoryButton(HomeViewModel model, int index) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            width: 1.0,
            color: model.categoryList[index].isSelected
                ? Colors.green
                : Colors.grey,
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        onPressed: () {
          model.updateIsSelected(index);
        },
        child: Row(
          children: [
            SizedBox(
                height: 60,
                child: Image.asset(
                  model.categoryList[index].imagePath,
                  fit: BoxFit.cover,
                )),
            SizedBox(
              width: 5,
            ),
            Text(
              model.categoryList[index].categoryName,
              style: GoogleFonts.urbanist(
                textStyle: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget _subTitle(String subTitle) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            subTitle,
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ),
          Text(
            'See all',
            style: GoogleFonts.inter(
              textStyle: TextStyle(
                  color: Colors.black.withOpacity(0.25),
                  fontWeight: FontWeight.w500,
                  fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _placeDisplay(HomeViewModel model, int index) {
    return GestureDetector(
      onTap: () {
        model.navigateToPackage(model.placesList[index]);
      },
      child: Container(
        height: 230,
        width: 175,
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(model.placesList[index].imagePath),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0.2, 1],
              colors: [
                Colors.transparent,
                Colors.black.withOpacity(.5),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    model.updateIsLiked(index);
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Icon(
                      model.placesList[index].isLiked
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: model.placesList[index].isLiked
                          ? Colors.red
                          : Colors.black,
                      size: 16,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Text(
                model.placesList[index].placeName,
                style: GoogleFonts.urbanist(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5),
                child:
                    LocationWidget(location: model.placesList[index].location),
              ),
              RatingWidget(
                  rating: model.placesList[index].rating,
                  ratingTextColor: Colors.white),
            ],
          ),
        ),
      ),
    );
  }

  Widget _packageView(HomeViewModel model, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 86,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                  image: AssetImage(model.packageList[index].imagePath),
                  fit: BoxFit.cover),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        model.packageList[index].packageName,
                        style: GoogleFonts.urbanist(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 16),
                        ),
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
                Text(
                  '₹${model.packageList[index].price}',
                  style: GoogleFonts.urbanist(
                    textStyle: TextStyle(
                        color: Colors.orange,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    child: RatingWidget(
                        rating: model.packageList[index].rating,
                        ratingTextColor: Colors.black)),
                Text(
                  'A resort is a place for vacation, relaxation or as a day..',
                  style: GoogleFonts.urbanist(
                    textStyle: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
