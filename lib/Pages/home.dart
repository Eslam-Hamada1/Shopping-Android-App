import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> products = [
    {
      "title": "Shoes",
      "price": 200,
      "image": "https://picsum.photos/600?random=1"
    },
    {
      "title": "T-shirt",
      "price": 300,
      "image": "https://picsum.photos/600?random=2"
    },
    {
      "title": "Pants",
      "price": 450,
      "image": "https://picsum.photos/600?random=6"
    },
    {
      "title": "Watch",
      "price": 600,
      "image": "https://picsum.photos/600?random=4"
    },
    {
      "title": "Backpack",
      "price": 250,
      "image": "https://picsum.photos/600?random=5"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Our Products"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.25,
                    child: PageView.builder(
                      itemCount: products.length,
                      controller: PageController(viewportFraction: 0.9),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.fromLTRB(0, 0, MediaQuery.of(context).size.width * 0.05, 0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.network(
                              products[index]["image"],
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  
                  SizedBox(height: MediaQuery.of(context).size.height*0.03),

                  GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: MediaQuery.of(context).size.width * 0.03,
                      mainAxisSpacing: MediaQuery.of(context).size.width * 0.03,
                      childAspectRatio: 0.7,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return Card(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  product["image"],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                            Text(product["title"], style: TextStyle(fontWeight: FontWeight.bold)),
                            Text("\$${product["price"]}"),
                            ElevatedButton(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("${product["title"]} added to cart"),
                                    duration: Duration(seconds: 1),
                                  ),
                                );
                              },
                              child: Icon(Icons.shopping_cart, size: MediaQuery.of(context).size.width * 0.06),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Text("Hot Offers", style: TextStyle(fontSize: MediaQuery.of(context).size.width*0.035, fontWeight: FontWeight.bold)),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  ListView.builder(
                    shrinkWrap: true, 
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                              child: Image.network("https://picsum.photos/400?random=$index", width: 100, height: 100, fit: BoxFit.cover),
                            ),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Special Offer ${index + 1}: Get amazing discounts on selected products! Limited time only.", style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.03)),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
      );
  }
}