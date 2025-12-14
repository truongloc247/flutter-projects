import 'package:flutter/material.dart';
import 'package:product_list/api.dart';
import 'package:product_list/model/product.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  late API api;
  late Future<List<Product>?> futureProducts;

  @override
  void initState() {
    api = API();
    futureProducts = api.getAllProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [renderNavbar(), bodyMain()]),
      backgroundColor: Colors.white,
    );
  }

  Widget bodyMain() {
    return FutureBuilder(
      future: futureProducts,
      builder: (context, snap) {
        if (snap.connectionState == ConnectionState.done) {
          if (snap.hasError) {
            return Center(child: Text('Error: ${snap.error}'));
          }
          if (snap.data == null) {
            return Center(child: Text('Lấy dữ liệu thất bại'));
          }
          return Expanded(
            child: Container(
              color: Colors.grey[100],
              padding: EdgeInsets.all(8),
              child: renderProductList(snap.data!),
            ),
          );
        }
        return Expanded(
          child: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget renderProduct(Product p) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 5,
        children: [
          Center(child: Image.network(p.image, width: 100, height: 150)),
          Container(
            padding: EdgeInsets.all(5),
            child: Column(
              spacing: 3,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  p.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "${p.price} \$",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Row(
                  spacing: 5,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.yellow[50],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.yellow),
                          Text(p.rating.rate.toString()),
                        ],
                      ),
                    ),
                    Text(
                      p.rating.count.toString(),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Text(p.category, style: TextStyle(color: Colors.blue[900])),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget renderProductList(List<Product> pList) {
    // List<Widget> productWidgets = pList
    //     .map((item) => renderProduct(item))
    //     .toList();
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 250,
        childAspectRatio: 0.55,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      itemCount: pList.length,
      itemBuilder: (context, index) => renderProduct(pList[index]),
    );
  }

  Widget renderNavbar() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
            Text(
              "MY TIKTOK SHOP",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications_none_outlined),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.view_column_rounded)),
            IconButton(
              onPressed: () {
                setState(() {
                  api = API();
                  futureProducts = api.getAllProduct();
                });
              },
              icon: Icon(Icons.shopping_bag_outlined),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.repeat)),
          ],
        ),
      ],
    );
  }
}
