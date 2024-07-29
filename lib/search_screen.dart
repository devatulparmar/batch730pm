import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> _originalItems = [
    "Vadodara",
    "Surat",
    "Ahmedabad",
    "Rajkot",
    "Mumbai",
  ];
  final TextEditingController _controller = TextEditingController();
  List _filteredItem = [];

  void _filterData(String name) {
    _filteredItem.clear();
    _filteredItem = _originalItems
        .where((String element) =>
            element.toLowerCase().startsWith(name.toLowerCase()))
        .toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _filteredItem.addAll(_originalItems);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: _controller,
              textInputAction: TextInputAction.next,
              onChanged: (value) {
                _filterData(value);
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                hintText: "Search here.. .",
                suffixIcon: IconButton(
                  onPressed: () {
                    _controller.clear();
                    _filteredItem.clear();
                    _filteredItem.addAll(_originalItems);
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.clear,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ListView.builder(
              itemCount: _filteredItem.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      _filteredItem[index].toString(),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
