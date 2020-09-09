import 'package:flutter/material.dart';
import 'package:xshoes/components/label.dart';
import 'package:xshoes/model/categories.dart';
import 'package:xshoes/model/product.dart';
import 'package:xshoes/model/shoes.dart';
import 'package:xshoes/service/network_service.dart';
import 'package:xshoes/utils.dart';

import '../constant.dart';
import 'detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController _scontrol = ScrollController();
  Product product;
  double off = 0;

  List<Shoe> shoes;
  List<Shoe> newShoes;
  bool isLoading = true;
  getSetCategories() async {
    try {
      Categories cat = await NetworkService().getCategories();
      List<String> categories = ["All"] + cat.categories;
      setState(() {
        category = categories;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  getSetProduct() async {
    try {
      Product products = await NetworkService().getProduct();
      setState(() {
        product = products;
        shoes = product.shoes;
        newShoes = getNewItem(products.shoes);
        isLoading = false;
      });
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  List<Shoe> getListShoe() {
    if (selectedCategory == 0) {
      return shoes;
    } else {
      List<Shoe> list = [];
      String filter = category[selectedCategory];
      shoes.forEach((element) {
        if (element.catname == filter) {
          list.add(element);
        }
      });
      return list;
    }
  }

  @override
  void initState() {
    getSetCategories();
    getSetProduct();
    _scontrol.addListener(() {
      setState(() {
        off = _scontrol.offset;
      });
    });
    super.initState();
  }

  int selectedCategory = 0;
  List<String> category = [
    "All",
    "Men",
    "Women",
    "Kids",
    "Parent",
    "Grand parent"
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return  (!isLoading)
          ? (product.result == 0)
              ? Container(
                  child: Center(
                  child: Text('Sorry an error encountered'),
                ))
              : SafeArea(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(8, 12, 8, 5),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Xshoes',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24),
                                ),
                              ],
                            ),
                            Container(
                              height: 80,
                              padding: EdgeInsets.all(12),
                              child: Container(
                                padding: EdgeInsets.fromLTRB(8, 3, 8, 3),
                                decoration: BoxDecoration(
                                    color: primaryGrey,
                                    borderRadius: BorderRadius.circular(15)),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    fillColor: Colors.grey[300],
                                    icon: Icon(Icons.search),
                                    border: InputBorder.none,
                                    hintText: 'Search',
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: 50,
                              child: ListView.builder(
                                itemCount: category.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (ctx, index) => InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedCategory = index;
                                    });
                                  },
                                  child: AnimatedContainer(
                                    curve: Curves.bounceIn,
                                    duration: Duration(milliseconds: 250),
                                    margin: EdgeInsets.only(left: 20),
                                    padding: EdgeInsets.fromLTRB(0, 5, 10, 5),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          category[index],
                                          style: TextStyle(
                                              fontWeight:
                                                  (index == selectedCategory)
                                                      ? FontWeight.bold
                                                      : FontWeight.normal,
                                              fontSize: 18),
                                        ),
                                        !(index == selectedCategory)
                                            ? Container()
                                            : Align(
                                                alignment:
                                                    Alignment.centerLeft,
                                                child: SizedBox(
                                                    height: 5,
                                                    width: 40,
                                                    child: Container(
                                                      color: primaryPink,
                                                    )),
                                              )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: size.width * 0.9,
                              height: 250,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  controller: _scontrol,
                                  itemCount: getListShoe().length,
                                  itemBuilder: (ctx, index) {
                                    Shoe item = getListShoe()[index];
                                    String url =
                                        getImageUrl(item.varian[0].imageUrl);
                                    return Container(
                                      margin:
                                          EdgeInsets.only(left: 5, right: 30),
                                      child: InkWell(
                                        onTap: ()=>goToDetail(item,item.seriesname),
                                                                                child: Container(
                                          padding: EdgeInsets.all(15),
                                          height: 200,
                                          width: 180,
                                          decoration: BoxDecoration(
                                              color: (index.isEven)
                                                  ? primaryCardBlue
                                                  : primaryCardPink,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Stack(children: [
                                            Positioned(
                                              top: 90,
                                              right: -8,
                                              child: Hero(
                                                tag: item.seriesname,
                                                child: Transform.rotate(
                                                      angle: -0.4,
                                                      child: Image(
                                                        width: 140,
                                                        image:
                                                            NetworkImage(url),
                                                        fit: BoxFit.contain,
                                                      )),
                                              ),
                                            ),
                                            Container(
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        item.brand,
                                                        style: TextStyle(
                                                            color: background,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Text(
                                                          item.seriesname,
                                                          style: TextStyle(
                                                              color: background,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: 16),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Text(
                                                        "\$" +
                                                            item.varian[0]
                                                                .price,
                                                        style: TextStyle(
                                                            color: background,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            fontSize: 16),
                                                      ),
                                                    ],
                                                  ),
                                                ])),
                                            Align(
                                                alignment: Alignment.topRight,
                                                child: Icon(
                                                  Icons.favorite_border,
                                                  color: background,
                                                )),
                                            Align(
                                                alignment:
                                                    Alignment.bottomRight,
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: background,
                                                )),
                                          ]),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'New Brand ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  Row(
                                    children: [
                                      Text('see all'),
                                      Icon(Icons.arrow_right)
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 230,
                              padding: EdgeInsets.all(20),
                              child: ListView.builder(
                                  itemCount: newShoes.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (ctx, index) => Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 10, 10, 0),
                                        child: InkWell(
                                          onTap: ()=>goToDetail(newShoes[index],newShoes[index].seriesname+"new"),
                                                                                  child: Material(
                                            elevation: 15,
                                            type: MaterialType.transparency,
                                            child: Container(
                                              width: 160,
                                              height: 150,
                                              child: Stack(children: [
                                                Align(
                                                    alignment: Alignment.center,
                                                    child: Hero(
                                                      tag: newShoes[index].seriesname+"new",
                                                                                                          child: Image.network(
                                                        getImageUrl(newShoes[index]
                                                                .varian[0]
                                                                .imageUrl ??
                                                            ''),
                                                        width: 110,
                                                        fit: BoxFit.contain,
                                                      ),
                                                    )),
                                                Container(
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          height: 130,
                                                          child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topLeft,
                                                                    child: Label(
                                                                        text:
                                                                            'New',
                                                                        height:
                                                                            25,
                                                                        width: 65,
                                                                        padding: EdgeInsets
                                                                            .fromLTRB(
                                                                                5,
                                                                                0,
                                                                                5,
                                                                                0))),
                                                                Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topRight,
                                                                    child:
                                                                        IconButton(
                                                                      icon: Icon(Icons
                                                                          .favorite_border),
                                                                      onPressed:
                                                                          () {},
                                                                    ))
                                                              ]),
                                                        ),
                                                        Container(
                                                            height: 50,
                                                            child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    child: Column(
                                                                      children: [
                                                                        Padding(
                                                                          padding:
                                                                              const EdgeInsets.only(left: 5),
                                                                          child:
                                                                              Row(
                                                                            children: [
                                                                              Text(
                                                                                getSimpleName(newShoes[index].brandConcatSeriesName),
                                                                                style: TextStyle(fontSize: 10),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          '\$${newShoes[index].varian[0].price}',
                                                                          style: TextStyle(
                                                                              fontSize:
                                                                                  13),
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .bottomRight,
                                                                    child:
                                                                        Container(
                                                                      height: 40,
                                                                      width: 50,
                                                                      child: IconButton(
                                                                          icon: Icon(
                                                                            Icons
                                                                                .shopping_cart,
                                                                            color:
                                                                                background,
                                                                          ),
                                                                          onPressed: () {}),
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.only(
                                                                              topLeft: Radius.circular(
                                                                                  20),
                                                                              bottomRight: Radius.circular(
                                                                                  20)),
                                                                          color:
                                                                              primaryCardBlue),
                                                                    ),
                                                                  )
                                                                ]))
                                                      ]),
                                                )
                                              ]),
                                              decoration: BoxDecoration(
                                                  color: primaryGrey,
                                                  borderRadius:
                                                      BorderRadius.circular(20)),
                                            ),
                                          ),
                                        ),
                                      )),
                            )
                          ],
                        ),
                      )))
          : Container(
              child: Center(
              child: SizedBox(
                  height: 50, width: 50, child: CircularProgressIndicator()),
            ));
  }
  goToDetail(Shoe shoes,tag)=>Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>Detail(shoes,tag)));
  
}
