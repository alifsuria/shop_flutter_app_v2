import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variables.dart';
import 'package:shop_app_flutter/widgets/product_card.dart';
import 'package:shop_app_flutter/widgets/product_details_page.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ['All', 'Adidas', 'Nike', 'Bata'];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();

    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final size = MediaQuery.sizeOf(context);
    const inputFieldBorder = OutlineInputBorder(
        borderSide: BorderSide(color: Color.fromRGBO(225, 225, 225, 1)),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(50)));
    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 5.0, 10.0),
                child: Text(
                  'Shoes\nCollection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 10.0, 0.0, 10.0),
                      child: TextField(
                          decoration: InputDecoration(
                              hintText: 'Search',
                              prefixIcon: Icon(
                                Icons.search,
                              ),
                              border: inputFieldBorder,
                              enabledBorder: inputFieldBorder,
                              focusedBorder: inputFieldBorder,
                              focusColor: Colors.blue))))
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (context, index) {
                  final filter = filters[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Chip(
                          side: const BorderSide(
                              color: Color.fromRGBO(245, 247, 249, 1)),
                          backgroundColor: selectedFilter == filter
                              ? Theme.of(context).colorScheme.primary
                              : const Color.fromRGBO(245, 247, 249, 1),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          labelStyle: TextStyle(
                              color: selectedFilter == filter
                                  ? const Color.fromRGBO(255, 255, 255, 1)
                                  : Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          label: Text(filter)),
                    ),
                  );
                }),
          ),
          // const Stack(
          //   children: [Text('data'), Text('awdwa')],
          // ),
          Expanded(
            child: LayoutBuilder(builder: (contex, constraints) {
              // print(constraints.minHeight);
              // print(constraints.maxWidth);
              // print(constraints.minHeight);
              // print(constraints.minWidth);

              if (constraints.maxWidth > 1080) {
                return GridView.builder(
                    itemCount: products.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 2),
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ProductDetailsPage(product: product);
                          }));
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          imageUrl: product['imageUrl'] as String,
                          backgroundColor: !index.isEven
                              ? const Color.fromRGBO(245, 247, 249, 1)
                              : const Color.fromARGB(255, 118, 192, 226),
                        ),
                      );
                    });
              } else {
                return ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ProductDetailsPage(product: product);
                          }));
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          imageUrl: product['imageUrl'] as String,
                          backgroundColor: !index.isEven
                              ? const Color.fromRGBO(245, 247, 249, 1)
                              : const Color.fromARGB(255, 118, 192, 226),
                        ),
                      );
                    });
              }
            }),
          ),
        ],
      ),
    );
  }
}
