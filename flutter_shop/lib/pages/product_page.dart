import 'package:flutter/material.dart';
import '../pages/product_detail_page.dart';
import '../model/product.dart';
import '../services/product.dart';

class ProductPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return ProductPageState();
  }
}

class ProductPageState extends State<ProductPage> {
  ScrollController _controller = ScrollController();
  ProductListModal _products = ProductListModal([]);
  int _currentPage = -1;

  void getNextPage() async {
    var data = await getProductResult(_currentPage++);
    var products = ProductListModal.fromJson(data);
    setState(() {
      _products.data.addAll(products.data);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNextPage();
    _controller.addListener(() {
      if (_controller.position.pixels == _controller.position.maxScrollExtent) {
        print('滑动到了最底部');
        getNextPage();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: _products.data.length == 0
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              controller: _controller,
              itemCount: _products.data.length,
              itemBuilder: (context, index) {
                ProductItemModal product = _products.data[index];
                return FlatButton(
                    key: ValueKey(product.imageUrl+index.toString()),
                    color: Color(0xffffff),
                    padding:
                        EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
                    shape: BorderDirectional(
                        bottom: BorderSide(
                            color: Color.fromRGBO(0xdc, 0xdc, 0xdc, 1),
                            width: 1.0)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  ProductDetailPage(product)));
                    },
                    child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: 110.0,
                            width: 120.0,
                            child: Image.asset(
                              product.imageUrl,
                              fit: BoxFit.contain,
                            ),
                          ),
                          SizedBox(
                            width: 5.0,
                          ),
                          Expanded(
                              flex: 1,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    product.desc,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Text(
                                        product.type,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Color.fromRGBO(182, 9, 9, 1.0),
                                        ),
                                      ),
                                      Offstage(
                                        offstage: product.point == null,
                                        child: Container(
                                          margin: EdgeInsets.only(left: 5.0),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 3.0, vertical: 1.0),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1.0,
                                                  color: Color.fromRGBO(
                                                      132, 95, 63, 1.0))),
                                          child: Text(
                                            product.point ?? "",
                                            style: TextStyle(
                                                fontSize: 13.0,
                                                color: Color.fromRGBO(
                                                    132, 95, 63, 1.0)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    product.name,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      color: Color(0xFF999999),
                                    ),
                                  )
                                ],
                              )),
                        ],
                      ),
                    ));
              }),
    );
  }
}
