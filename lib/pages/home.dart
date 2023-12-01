import 'package:flutter/material.dart';

class Product {
  final String name;
  final String description;
  final double price;
  String imageUrl;

  Product(
      {required this.name,
      required this.description,
      required this.price,
      required this.imageUrl});
}

final List<Product> productsList = [
  Product(
      name: 'Cerveja 600ml',
      description: 'Heineken for Product 1',
      price: 29.99,
      imageUrl:
          'https://cdn.shoppub.io/cdn-cgi/image/w=1000,h=1000,q=80,f=auto/beirario/media/uploads/produtos/foto/b5973e4c825fefile.png'),
  Product(
      name: 'Cerveja 600ml',
      description: 'Heineken for Product 2',
      price: 49.99,
      imageUrl:
          'https://cdn.shoppub.io/cdn-cgi/image/w=1000,h=1000,q=80,f=auto/beirario/media/uploads/produtos/foto/b5973e4c825fefile.png'),
  // Add more products as needed
];

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Olá, Victor'),
      ),
      body: ListView.builder(
        itemCount: productsList.length,
        itemBuilder: (BuildContext context, int index) {
          ImageProvider imageProvider =
              AssetImage('assets/placeholder-300x202.png');
          if (productsList[index].imageUrl != null) {
            imageProvider = NetworkImage(productsList[index].imageUrl!);
          }
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: imageProvider,
            ),
            title: Text(productsList[index].name),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productsList[index].description),
                Text('R\$ ${productsList[index].price.toStringAsFixed(2)}'),
              ],
            ),
            onTap: () {
              // Handle tapping on a product
              // For example, navigate to a detailed page for the product
            },
          );
        },
      ),
    );
  }
}
