
import 'package:flutter/material.dart';

class TravelScreen extends StatefulWidget {
  const TravelScreen({Key? key}) : super(key: key);

  @override
  State<TravelScreen> createState() => _TravelScreenState();
}

class _TravelScreenState extends State<TravelScreen> {
  bool isSwitch = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Screen'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        children: [
          Row(
            children: [
              Flexible(
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(35),
                    ),
                    hintText: "",
                    label: const Text(''),
                    prefixIcon: const Icon(
                      Icons.arrow_back,
                      // color: Colors.red,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.list),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Display total price'),
                      Text('Includes all fees, before taxes'),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                    child: Switch(
                      value: isSwitch,
                      activeColor: Colors.green,
                      // activeTrackColor: Colors.orange,
                      onChanged: (value) {
                        setState(() => isSwitch = value);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          ListView.separated(
            itemCount: 15,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (_, __) => const SizedBox(height: 20),
            itemBuilder: (BuildContext context, int index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            'https://imgcy.trivago.com/c_limit,d_dummy.jpeg,f_auto,h_600,q_auto,w_600//hotelier-images/3b/e7/1771e1b6c17f210ddd8a164be12bb432b2e1a8fd8538d3f24b8aa9069102.jpeg'),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Text('Guest Favorite'),
                                ),
                              ),
                              const Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Room in Manali'),
                      Text('★ 5.0 (68)'),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Stay with Me - Merakil hospitality'),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$10 total before taxes',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              );
            },
          ),
        ],
      ),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Map',
                style: TextStyle(color: Colors.white),
              ),
              Icon(
                Icons.map,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: NavigationBar(
        // labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: Colors.white,
        elevation: 100,
        shadowColor: Colors.red,
        animationDuration: const Duration(seconds: 2),
        surfaceTintColor: Colors.red,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.search),
            label: 'Explore',
            // tooltip: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_border),
            label: 'Wishlists',
          ),
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: 'Trips',
          ),
          NavigationDestination(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
