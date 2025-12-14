import 'package:flutter/material.dart';
import 'package:practice_02/place.dart';

class MyHome extends StatelessWidget {
  const MyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody(), backgroundColor: Colors.white);
  }

  Widget myBody() {
    return Column(
      children: [
        searchInformation(),
        filter(),
        Container(
          padding: EdgeInsets.only(left: 15, top: 5, bottom: 5),
          alignment: Alignment.centerLeft,
          child: Text("${getPlaces().length} chỗ nghỉ"),
        ),
        Expanded(child: searchResult()),
      ],
    );
  }

  Widget searchInformation() {
    return Container(
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
          ),
          Text(
            "Xung quanh vị trí hiện tại",
            style: TextStyle(color: Colors.white),
          ),
          Text("23 thg 10 - 24 thg 10", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget filter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OutlinedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.import_export),
          label: Text("Sắp xếp"),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            side: BorderSide.none,
          ),
        ),
        OutlinedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.tune),
          label: Text("Lọc"),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            side: BorderSide.none,
          ),
        ),
        OutlinedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.map_outlined),
          label: Text("Bản đồ"),
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            side: BorderSide.none,
          ),
        ),
      ],
    );
  }

  List<Place> getPlaces() {
    return [
      Place(
        placeName: "aNhill Boutique",
        includeBreakfast: true,
        serviceLevel: 5,
        feedbackScore: 9.5,
        numberOfFeedback: 95,
        location: "Huế",
        distance: 0.6,
        providingService: "1 suite riêng tư",
        serviceDescription: "1 giường",
        price: 109,
        priceDescription: "Đã bao gồm thuế và phí",
        imgUrl:
            "https://cdn.pixabay.com/photo/2022/10/09/18/29/villa-del-balbianello-7509904_1280.jpg",
      ),
      Place(
        placeName: "An Nam Hue Boutique",
        includeBreakfast: true,
        feedbackScore: 9.2,
        numberOfFeedback: 34,
        location: "Cư Chinh",
        distance: 0.9,
        providingService: "1 phòng khách sạn",
        serviceDescription: "1 giường",
        price: 20,
        priceDescription: "Đã bao gồm thuế và phí",
        imgUrl:
            "https://cdn.pixabay.com/photo/2020/04/28/04/03/villa-5102551_1280.jpg",
      ),
      Place(
        placeName: "Huế Jade Hill Villa",
        includeBreakfast: false,
        feedbackScore: 8,
        numberOfFeedback: 1,
        location: "Cư Chinh",
        distance: 1.3,
        providingService: "1 biệt thự nguyên căn - 1000 m2",
        serviceDescription:
            "4 giường - 3 phòng ngủ - 1 phòng khách - 3 phòng tắm",
        price: 285,
        priceDescription: "Đã bao gồm thuế và phí",
        imgUrl:
            "https://cdn.pixabay.com/photo/2016/08/25/21/38/home-1620736_1280.jpg",
      ),
      Place(
        placeName: "Êm Villa",
        includeBreakfast: true,
        feedbackScore: 9,
        numberOfFeedback: 100,
        location: "Huế",
        distance: 1.2,
        providingService: "1 biệt thự nguyên căn",
        serviceDescription:
            "1 phòng khách - 3 phòng ngủ - 3 phòng tắm - 1 phòng karaoke",
        price: 100,
        priceDescription: "Đã bao gồm thuế và phí",
        imgUrl:
            "https://cdn.pixabay.com/photo/2017/04/10/22/28/residence-2219972_1280.jpg",
      ),
    ];
  }

  Widget place(Place place) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Column(
                children: [
                  if (place.includeBreakfast)
                    Container(
                      color: Colors.green,
                      width: 150,
                      alignment: Alignment.center,
                      child: Text(
                        "Bao bữa sáng",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  Image.network(
                    place.imgUrl,
                    width: 150,
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          place.placeName,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        if (place.serviceLevel != null)
                          Row(
                            children: [
                              for (int i = 1; i <= place.serviceLevel!; i++)
                                Icon(
                                  Icons.star_rate_rounded,
                                  color: Colors.amber,
                                ),
                            ],
                          ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.heart_broken_outlined),
                    ),
                  ],
                ),
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        color: Colors.blue,
                        width: 30,
                        height: 30,
                        alignment: Alignment.center,
                        child: Text(
                          place.feedbackScore.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text("${place.numberOfFeedback} Đánh giá"),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.pin_drop_outlined),
                    Text("${place.location} - Cách bạn ${place.distance}km"),
                  ],
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: RichText(
                    textAlign: TextAlign.right,
                    text: TextSpan(
                      text: "${place.providingService}: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: place.serviceDescription,
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "US\$${place.price}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.centerRight,
                  child: Text(place.priceDescription),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget searchResult() {
    List<Place> data = getPlaces();
    List<Widget> places = [];
    for (int i = 0; i < data.length; i++) {
      places.add(place(data[i]));
    }
    return ListView(children: places);
  }
}
