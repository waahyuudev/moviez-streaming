import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';

class Search extends StatelessWidget {
  Widget searchBar() {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)),
      child: Center(
        child: Row(
          children: [
            SvgPicture.asset("assets/ic_search.svg"),
            const SizedBox(
              width: 20,
            ),
            Expanded(
                child: TextFormField(
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              style: const TextStyle(fontSize: 16, color: Color(0XFF0D0846)),
              decoration: InputDecoration.collapsed(
                  hintText: 'Search here',
                  hintStyle:
                      const TextStyle(fontSize: 16, color: Color(0XFF0D0846))),
            )),
          ],
        ),
      ),
    );
  }

  Widget searchResult() {
    return Container(
      margin: const EdgeInsets.only(top: 30, bottom: 10),
      child: Row(
        children: [
          const Text("Search Result ",
              style: TextStyle(
                  color: Color(0XFF0D0846),
                  fontSize: 20,
                  fontWeight: FontWeight.bold)),
          const Text("(3)",
              style: TextStyle(color: Color(0XFF0D0846), fontSize: 18)),
        ],
      ),
    );
  }

  Widget itemResult(String name, String image, String category, double rating) {
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

  Widget listResult() {
    return Expanded(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          itemResult("The Dark II", "assets/cover_4.png", "Horror", 4),
          itemResult("The Dark Knight", "assets/cover_5.png", "Heroes", 5),
          itemResult("The Dark Tower", "assets/cover_6.png", "Action", 4),
        ],
      ),
    );
  }

  Widget buttonSuggestMovie() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(32)),
          color: Color(0XFF0D0846),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Text(
          "Suggest Movie",
          style: TextStyle(
              fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              searchBar(),
              searchResult(),
              listResult(),
              buttonSuggestMovie(),
            ],
          ),
        ),
      ),
    );
  }
}
