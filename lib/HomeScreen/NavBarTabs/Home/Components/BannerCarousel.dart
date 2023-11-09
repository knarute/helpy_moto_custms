import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BannerCarousel extends StatelessWidget {
  const BannerCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        disableGesture: false,
        options: CarouselOptions(
            height: 125,
            viewportFraction: 1,
            enlargeFactor: 0.5,
            enlargeCenterPage: true,
            onPageChanged: (position, reason) {},
            enableInfiniteScroll: true,
            autoPlay: true),
        items: const [
          CustomBanner(),
          CustomBanner(),
          CustomBanner(),
          CustomBanner()
        ]);
  }
}

class CustomBanner extends StatelessWidget {
  const CustomBanner({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        children: [
          Image(
            image: const AssetImage(
              'assets/banner_items/subscription_banner.png',
            ),
            width: size.width,
            height: 125,
            fit: BoxFit.cover,
          ),
          Positioned(
              top: 10,
              left: 15,
              child: Text(
                "GET BEST CAR SERVICE",
                style: GoogleFonts.getFont("Nunito",
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              )),
          Positioned(
            left: 15,
            top: 40,
            child: Text(
              "Subscribe now for\nexclusive benefits.",
              style: GoogleFonts.getFont("Nunito",
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Positioned(
            left: 15,
            bottom: 10,
            child: SizedBox(
              height: 25,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 141, 85, 0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                onPressed: () {},
                child: const Text(
                  "Subscribe",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
