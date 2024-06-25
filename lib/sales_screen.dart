import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({Key? key}) : super(key: key);

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen> {
  List<SalesItem> salesItemList = [
    SalesItem(
        imageURL:
            "https://2.img-dpreview.com/files/p/E~C1000x0S4000x4000T1200x1200~articles/3925134721/0266554465.jpeg",
        countryName: "IN",
        todayOrder: 0,
        previousOrder: 20,
        todaySales: 25,
        previousSales: 12),
    SalesItem(
      imageURL: "",
      countryName: "DE",
      todayOrder: 15,
      todaySales: 230,
      previousOrder: 1,
      previousSales: 20,
    ),
    SalesItem(
      imageURL:
          "https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg",
      countryName: "FR",
      todayOrder: 5623,
      todaySales: 4,
      previousOrder: 3,
      previousSales: 1,
    ),
    SalesItem(
      imageURL:
          "https://nikonrumors.com/wp-content/uploads/2014/03/Nikon-1-V3-sample-photo.jpg",
      countryName: "AU",
      todayOrder: 41,
      todaySales: 1,
      previousOrder: 44,
      previousSales: 51,
    ),
    SalesItem(
      imageURL: "",
      countryName: "UK",
      todayOrder: 023,
      todaySales: 4,
      previousOrder: 3,
      previousSales: 1,
    ),
    SalesItem(
      imageURL: "",
      countryName: "SE",
      todayOrder: 41,
      todaySales: 1,
      previousOrder: 44,
      previousSales: 51,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sales'),
        centerTitle: true,
        leading: const BackButton(),
        actions: const [
          Icon(Icons.date_range),
          SizedBox(
            width: 5,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(''),
                          Text('Today'),
                          Text('Previous'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(''),
                          Text('22/06/2024'),
                          Text('22/06/2024'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text('Lang'),
                          Text('Order'),
                          Text('Sales'),
                          Text('Order'),
                          Text('Sales'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1)),
                child: ListView.separated(
                  itemCount: salesItemList.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  separatorBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 2,
                      width: 500,
                      color: Colors.black,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: CachedNetworkImage(
                                    imageUrl: salesItemList[index]
                                        .imageURL
                                        .toString(),
                                    progressIndicatorBuilder:
                                        (_, __, downloadProgress) =>
                                            CircularProgressIndicator(
                                      value: downloadProgress.progress,
                                    ),
                                    errorWidget: (BuildContext context,
                                        String s, dynamic d) {
                                      return Container(
                                        color: Colors.blue,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(salesItemList[index]
                                    .countryName
                                    .toString()),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    salesItemList[index].todayOrder.toString(),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                const SizedBox(width: 22),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    '${salesItemList[index].todaySales}k',
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_downward),
                          SizedBox(width: 55),
                          Expanded(
                            flex: 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  salesItemList[index].previousOrder.toString(),
                                ),
                                SizedBox(width: 35),
                                Text('${salesItemList[index].previousSales}k'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Monthly Target'),
                              Text('2.53M'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.yellow,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Yearly Target'),
                              Text('31.53M'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 2,
                    width: 500,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Monthly Projection'),
                              Text('2.53M'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.yellow,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Yearly Projection'),
                              Text('31.53M'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 2,
                    width: 500,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('MTD Sales'),
                              Text('2.53M'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.yellow,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('YTD Sales'),
                              Text('31.53M'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    height: 2,
                    width: 500,
                    color: Colors.black,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.blue,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('MTD Orders'),
                              Text('2.53M'),
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          color: Colors.yellow,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('YTD Orders'),
                              Text('31.53M'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SalesItem {
  String imageURL;
  String countryName;
  int todayOrder;
  int todaySales;
  int previousOrder;
  int? previousSales;

  SalesItem({
    Key? key,
    required this.imageURL,
    required this.countryName,
    required this.todayOrder,
    required this.todaySales,
    required this.previousOrder,
    this.previousSales,
  }) : super();
}
