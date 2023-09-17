import 'package:flutter/material.dart';

class ListViewHorizontal extends StatefulWidget {
  const ListViewHorizontal({super.key});

  @override
  State<ListViewHorizontal> createState() => _ListViewHorizontalState();
}

class _ListViewHorizontalState extends State<ListViewHorizontal> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const TextField(
              decoration: InputDecoration(suffix: Icon(Icons.search)),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Image.network(
                    'https://electrolux.vtexassets.com/assets/vtex.file-manager-graphql/images/33768dcd-94dd-4142-8f84-a7d613d14389___6fdb9538a4ae8ee224f3177a06ee4117.png',
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.network(
                      'https://electrolux.vtexassets.com/assets/vtex.file-manager-graphql/images/33768dcd-94dd-4142-8f84-a7d613d14389___6fdb9538a4ae8ee224f3177a06ee4117.png'),
                  const SizedBox(
                    width: 10,
                  ),
                  Image.network(
                      'https://electrolux.vtexassets.com/assets/vtex.file-manager-graphql/images/33768dcd-94dd-4142-8f84-a7d613d14389___6fdb9538a4ae8ee224f3177a06ee4117.png'),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: Card(
                          elevation: 8,
                          child: Row(
                            children: [
                              Icon(Icons.local_shipping),
                              SizedBox(
                                width: 15,
                              ),
                              Text('Agende sua \n entrega')
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                        width: 150,
                        child: Card(
                          elevation: 8,
                          child: Row(
                            children: [
                              Icon(Icons.credit_card),
                              SizedBox(
                                width: 15,
                              ),
                              Text('Suas compras \n em 10x'),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Expanded(child: Text('data'))
          ],
        ),
      ),
    );
  }
}
