import 'package:flutter/material.dart';
import '../model/product.dart';

class ProductDetailPage extends StatelessWidget {
  final ProductItemModal _product;

  ProductDetailPage(this._product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_product.name),
      ),
      body: Column(
        children: <Widget>[
          Image.asset(_product.imageUrl),
          Text(_product.desc)
        ],
      ),
    );
  }
}
