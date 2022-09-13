import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moviez_streaming/search.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget headingText() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Moviez",
            style: TextStyle(
                color: Color(0XFF0D0846),
                fontSize: 28,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 5,),
          const Text(
            "Watch much easier",
            style: const TextStyle(color: Color(0XFF929292), fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget icSearch() {
    return GestureDetector(
      onTap: (() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Search()),
        );
      }),
      child: SvgPicture.asset("assets/ic_search.svg"),
    );
  }

  Widget headerComponent() {
    return SizedBox(
      height: 74,
      child: Row(
        children: [headingText(), const Spacer(), icSearch()],
      ),
    );
  }

  Widget itemListMovie(
      String name, String image, String category, double rating) {
    return Container(
      width: 300,
      margin: const EdgeInsets.only(right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              image,
              width: 300,
              height: 207,
              fit: BoxFit.fill,
            ),
          ),
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 17,
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 20,
                        color: Color(0XFF0D0846),
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    category,
                    style: const TextStyle(fontSize: 16, color: Color(0XFF929292)),
                  ),
                ],
              ),
              const Spacer(),
              RatingBar.builder(
                itemSize: 17,
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: const Color(0XFFFFAB2E),
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget listMovie() {
    return Container(
      height: 279,
      width: double.infinity,
      margin: const EdgeInsets.only(top: 10),
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        children: [
          itemListMovie("John Wick 4", "assets/image3.png", "Action, Crime", 5),
          itemListMovie("Bohemian", "assets/cover.png", "Documentary", 4)
        ],
      ),
    );
  }

  Widget textFromDisney() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: const Text(
        "From Disney",
        style: const TextStyle(
            color: Color(0XFF0D0846),
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget itemDisney(String name, String image, String category, double rating) {
    return Container(
      width: double.infinity,
      height: 159,
      margin: const EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              image,
              width: 100,
              height: 127,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                    color: Color(0XFF0D0846),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                category,
                style: const TextStyle(fontSize: 16, color: Color(0XFF929292)),
              ),
              const SizedBox(
                height: 20,
              ),
              RatingBar.builder(
                itemSize: 17,
                initialRating: rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: const Color(0XFFFFAB2E),
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              )
            ],
          )
        ],
      ),
    );
  }

  Widget listFromDisney() {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          itemDisney("Mulan Session", "assets/cover_2.png", "History, War", 3),
          itemDisney("Beauty & Beast", "assets/cover_3.png", "Sci-Fiction", 5)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFDFDFE),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            headerComponent(),
            listMovie(),
            textFromDisney(),
            listFromDisney()
          ],
        ),
      )),
    );
  }
}
