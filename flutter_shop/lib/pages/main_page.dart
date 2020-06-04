import 'package:flutter/material.dart';
import '../pages/product_detail_page.dart';
import '../services/product.dart';
import '../model/product.dart';
import 'banner_widget.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  ProductListModal _productList = ProductListModal([]);

  void getProductList() async {
    var data = await getProductResult();
    var products = ProductListModal.fromJson(data);
    setState(() {
      _productList = products;
    });
  }

  @override
  void initState() {
    super.initState();
    getProductList();
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    //Item宽度
    double itemWidth = (deviceWidth - 20.0) / 2;
    double imageWidth = deviceWidth * 110.0 / 360;

    var bgColor = Color.fromRGBO(0xdc, 0xdc, 0xdc, 1);
    Color titleColor = Color.fromRGBO(0xdb, 0x5d, 0x41, 1);
    Color subtitleColor = Color.fromRGBO(0x99, 0x99, 0x99, 1);
    List<Widget> listWidget = _productList.data.map((item) {
      return Container(
        width: itemWidth,
        margin: EdgeInsets.all(5.0),
        child: FlatButton(
            color: bgColor,
            padding: EdgeInsets.all(5.0),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProductDetailPage(item)));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15.0, color: titleColor),
                ),
                Text(
                  item.desc,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 15.0, color: subtitleColor),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 5.0),
                  child: Image.asset(
                    item.imageUrl,
                    width: imageWidth,
                    height: imageWidth,
                  ),
                )
              ],
            )),
      );
    }).toList();
    return Scaffold(
      body: ListView(
        children: <Widget>[
          BannerWidget(),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "最新产品",
              style: TextStyle(
                  fontSize: 16.0, color: Color.fromRGBO(51, 51, 51, 1)),
            ),
          ),
          Wrap(
            direction: Axis.horizontal,
            children: listWidget,
          )
        ],
      ),
    );
  }
}
