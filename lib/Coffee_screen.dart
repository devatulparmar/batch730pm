import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CoffeeScreen extends StatefulWidget {
  const CoffeeScreen({super.key});

  @override
  State<CoffeeScreen> createState() => _CoffeeScreenState();
}

class _CoffeeScreenState extends State<CoffeeScreen> {

  List _carouselSliderList = [1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.location_on),
            Text('Vadodara'),
            Icon(Icons.keyboard_arrow_down),
          ],
        ),
        centerTitle: false,
        actions: const [
          Icon(Icons.wifi),
          SizedBox(
            width: 15,
          ),
          Icon(Icons.notification_add),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 150,
            child: ListView.builder(
                itemCount: 50,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return const Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(
                              "https://as1.ftcdn.net/v2/jpg/04/38/92/04/1000_F_438920426_78YXwX701JYJuZlU354HbGkOB35QUGFR.jpg"),
                        ),
                        Text('Coffee'),
                      ],
                    ),
                  );
                }),
          ),
          CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 1),
              aspectRatio: 2.5/1,
            ),
            items: _carouselSliderList.map((dynamic i) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: const BoxDecoration(color: Colors.amber),
                child: Image.network(
                  'https://static.remove.bg/sample-gallery/graphics/bird-thumbnail.jpg',
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20,),
          SizedBox(
            height: 280,
            child: ListView.builder(
                itemCount: 50,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child:SizedBox(
                      width: 200,
                      child: Card(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                              ),
                              child: Image.network(
                                  "https://as1.ftcdn.net/v2/jpg/04/38/92/04/1000_F_438920426_78YXwX701JYJuZlU354HbGkOB35QUGFR.jpg",
                              height: 200,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Text('Coffee'),
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Text('50\$'),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
