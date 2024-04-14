import 'package:flutter/material.dart';
import 'package:shop_app/global_variable.dart';
import 'package:shop_app/widgets/resource_card.dart';
import 'package:shop_app/pages/resource_details.dart';

class ResourceList extends StatefulWidget {
  const ResourceList({super.key});

  @override
  State<ResourceList> createState() => _ResourceListState();
}

class _ResourceListState extends State<ResourceList> {
  final List<String> filters = const [
    'All',
    'Nike',
    'Louis Vuittons',
    'Gucci',
    'Naked Wolfe'
  ];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Shoes\nCollection',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Icon(Icons.search),
                    ),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                    contentPadding: EdgeInsets.all(20.0),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (context, i) {
                final filter = filters[i];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                    child: Chip(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            40), // Adjust the radius as needed
                        side: const BorderSide(
                          color: Color.fromARGB(255, 219, 219, 219),
                        ),
                      ),
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromARGB(255, 220, 220, 220),
                      label: Text(filter),
                      labelStyle: const TextStyle(
                        fontSize: 15,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: size.width > 650
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 2,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ResourceDetailsPage(product: product);
                              },
                            ),
                          );
                        },
                        child: ResourceCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['url'] as dynamic,
                          // title: 'title',
                          // price: 120,
                          // image: '/assets/images/shoes3.jpg',
                        ),
                      );
                    },
                  )
                : ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ResourceDetailsPage(product: product);
                              },
                            ),
                          );
                        },
                        child: ResourceCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['url'] as dynamic,
                          // title: 'title',
                          // price: 120,
                          // image: '/assets/images/shoes3.jpg',
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
