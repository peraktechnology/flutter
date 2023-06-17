import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stacked/stacked.dart';
import 'package:travel/ui/view/home/home.dart';
import 'package:travel/ui/view/widgets/location_widget.dart';
import 'package:travel/ui/view/widgets/rating_widget.dart';

import 'package_viewmodel.dart';

class PackageView extends StatelessWidget {
  final Place placeDetails;
  const PackageView(this.placeDetails);
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PackageViewModel>.reactive(
      builder: (context, model, child) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(placeDetails.imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: placeDetails.isLiked
                      ? Icon(
                          Icons.favorite,
                          color: Colors.red,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                )
              ],
            ),
            body: Stack(
              fit: StackFit.expand,
              children: [
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [0.2, 1],
                      colors: const [
                        Colors.transparent,
                        Colors.black,
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            placeDetails.placeName,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 25,
                              ),
                            ),
                          ),
                          LocationWidget(location: placeDetails.location),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          placeDetails.desc,
                          style: GoogleFonts.urbanist(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: RatingWidget(
                          rating: placeDetails.rating,
                          ratingTextColor: Colors.white,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '₹${placeDetails.price}',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              padding: const EdgeInsets.all(20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                            ),
                            onPressed: () {},
                            child: Text(
                              "Book Now",
                              style: GoogleFonts.urbanist(
                                textStyle: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
      viewModelBuilder: () => PackageViewModel(),
      onViewModelReady: (model) => model.initialize(),
    );
  }
}
