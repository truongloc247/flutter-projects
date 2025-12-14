import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: myBody());
  }

  Widget myBody() {
    return Column(children: [block1(), block2(), block3(), block4()]);
  }

  Widget block1() {
    var imgSrc =
        'https://cdn.pixabay.com/photo/2020/05/10/00/53/hue-city-5151869_1280.jpg';
    return Image.network(imgSrc);
  }

  Widget block2() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hue Citadel',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Hue city - Ancient capital of Viet Nam',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.star, color: Colors.red),
              Text('41'),
            ],
          ),
        ],
      ),
    );
  }

  Widget block3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(Icons.call, color: Colors.blue),
            Text('CALL', style: TextStyle(color: Colors.blue)),
          ],
        ),
        Column(
          children: [
            Icon(Icons.route, color: Colors.blue),
            Text('ROUTE', style: TextStyle(color: Colors.blue)),
          ],
        ),
        Column(
          children: [
            Icon(Icons.share, color: Colors.blue),
            Text('SHARE', style: TextStyle(color: Colors.blue)),
          ],
        ),
      ],
    );
  }

  Widget block4() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Text(
        'Hue Citadel, located in the heart of Hue city in central Vietnam, is one of the most significant and well-preserved historical landmarks in the country. As the former imperial capital of the Nguyen Dynasty—the last ruling dynasty of Vietnam—Hue Citadel stands as a powerful symbol of Vietnam’s cultural heritage, political history, and architectural grandeur. Designated as a UNESCO World Heritage Site in 1993, the Citadel not only attracts historians and researchers but also serves as a major tourist destination for visitors from around the world.',
      ),
    );
  }
}
