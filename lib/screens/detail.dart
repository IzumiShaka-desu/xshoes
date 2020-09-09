import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:xshoes/components/custom_appbar.dart';
import 'package:xshoes/constant.dart';
import 'package:xshoes/model/shoes.dart';
import 'package:xshoes/utils.dart';

class Detail extends StatefulWidget {
  Detail(this.shoes,this.tag);
  final Shoe shoes;
  final String tag;
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  PageController _controller = PageController();
  double position = 0;
  @override
  void initState() {
    _controller.addListener(() {
      setState(() {
        position = _controller.page;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          child: Row(
        children: [
          Center(
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                    margin: EdgeInsets.only(left: 15, top: 20),
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: greyButton,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(child: Icon(Icons.navigate_before))),
              ),
            ),
          ),
        ],
      )),
      backgroundColor: background,
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.fromLTRB(7, 10, 7, 5),
        child: SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 5),
            Container(
              height: 250,
              child: PageView.builder(
                  controller: _controller,
                  itemCount: widget.shoes.varian.length,
                  itemBuilder: (ctx, index) => Container(
                        color: primaryGrey,
                        padding: EdgeInsets.all(5),
                        child: Stack(children: [
                          Align(
                              alignment: Alignment.bottomCenter,
                              child: Hero(
                                tag: widget.tag,
                                child: Image.network(getImageUrl(
                                    widget.shoes.varian[index].imageUrl)),
                              )),
                          Container(
                              padding: EdgeInsets.all(10),
                              child: Column(children: [
                                Row(
                                  children: [
                                    Text(widget.shoes.brand,
                                        style: TextStyle(
                                            color: secodaryGreyActive,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                        widget.shoes.catname +
                                            " " +
                                            widget.shoes.varian[index].varian,
                                        style: TextStyle(
                                            color: secodaryGreyActive,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18))
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                        "\$" + widget.shoes.varian[index].price,
                                        style: TextStyle(
                                            color: secodaryGreyActive,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18))
                                  ],
                                )
                              ]))
                        ]),
                      )),
            ),
            Container(
              height: 30,
              child: DotsIndicator(
                dotsCount: widget.shoes.varian.length,
                position: position,
                decorator: DotsDecorator(
                  activeColor: primaryCardPink,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                ),
              ),
            ),
            Container(
                child: Column(
              children: [
                Row(children: [
                  Text('Stock',
                      style: TextStyle(
                          color: secodaryGreyActive,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))
                ]),
                Row(
                  children: [
                    Expanded(
                      child: Text(widget.shoes.stock.toString(),
                          style: TextStyle(
                              color: secodaryGreyActive,
                              fontWeight: FontWeight.normal,
                              fontSize: 16)),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Row(children: [
                  Text('Avaible Size',
                      style: TextStyle(
                          color: secodaryGreyActive,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))
                ]),
                Container(
                  height: 30,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.shoes.size.length,
                      itemBuilder: (ctx, index) => Container(
                            margin: EdgeInsets.only(left: 5, right: 10),
                            width: 50,
                            child: Center(
                              child: Text(widget.shoes.size[index],
                                  style: TextStyle(
                                      color: secodaryGreyActive,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 16)),
                            ),
                            decoration: BoxDecoration(
                                color: primaryGrey,
                                borderRadius: BorderRadius.circular(15)),
                          )),
                ),
                SizedBox(height: 10),
                Row(children: [
                  Text('Description',
                      style: TextStyle(
                          color: secodaryGreyActive,
                          fontWeight: FontWeight.bold,
                          fontSize: 20))
                ]),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Text(widget.shoes.detail,
                          style: TextStyle(
                              color: secodaryGreyActive,
                              fontWeight: FontWeight.normal,
                              fontSize: 16)),
                    ),
                  ],
                )
              ],
            )),
            SizedBox(height: 20)
          ]),
        ),
      )),
      bottomNavigationBar: BottomAppBar(
          elevation: 15,
          child: Container(
              padding: EdgeInsets.only(left: 15, right: 15),
              height: 70,
              child: Row(children: [
                Material(
                    type: MaterialType.transparency,
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                            color: primaryGrey,
                            borderRadius: BorderRadius.circular(10)),
                        height: 50,
                        width: 50,
                        child: Center(
                          child: Icon(Icons.favorite),
                        ),
                      ),
                    )),
                SizedBox(width: 20),
                Expanded(
                  child: Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    height: 50,
                    child: FlatButton(
                      color: primaryPink,
                      onPressed: () {},
                      child: Center(
                        child: Text('Buy Now',
                            style: TextStyle(
                                fontSize: 18,
                                color: background,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),
                )
              ]))),
    );
  }
}
