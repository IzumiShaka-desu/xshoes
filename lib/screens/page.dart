import 'package:flutter/material.dart';
import 'package:xshoes/constant.dart';
import 'package:xshoes/screens/home.dart';
import 'package:xshoes/screens/logre.dart';
import 'package:xshoes/screens/profile.dart';
import 'package:xshoes/service/sharepref_service.dart';

class PageContainer extends StatefulWidget {
  PageContainer({this.page});
  int page;
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<PageContainer> {
  bool isLogin;
  Map loginDetails;
  List<Widget> pages;
  getLoginStatus() async {
    bool statLogin = await SFService().isLogin();
    Map loginDetail = await SFService().getLoginDetails();
    setState(() {
      isLogin = statLogin;
      loginDetails = loginDetail;
    });
  }

  int currentPage = 0;
  @override
  initState() {
    getLoginStatus();
    if (widget.page != null) currentPage = widget.page;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    pages = [Home(), Profile(isLogin: isLogin, loginDetail: loginDetails)];
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: background,
      body: PageStorage(bucket: PageStorageBucket(), child: pages[currentPage]),
      bottomNavigationBar: BottomAppBar(
        elevation: 15,
        child: Container(
          color: primaryGrey,
          padding: EdgeInsets.fromLTRB(
              20, 5, (currentPage != 1) ? size.width * 0.2 : 20, 5),
          height: 50,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            IconButton(
              icon: Icon(
                Icons.home,
                color: (currentPage == 0) ? secodaryGreyActive : secondaryGrey,
                size: 30,
              ),
              onPressed: () {
                if (currentPage != 0)
                  setState(() {
                    currentPage = 0;
                  });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.favorite,
                color: (currentPage == 2) ? secodaryGreyActive : secondaryGrey,
                size: 30,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.person,
                color: (currentPage == 1) ? secodaryGreyActive : secondaryGrey,
                size: 30,
              ),
              onPressed: () {
                if (currentPage != 1)
                  setState(() {
                    currentPage = 1;
                  });
              },
            ),
          ]),
        ),
      ),
      floatingActionButton: AnimatedOpacity(
        duration: Duration(milliseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn,
        opacity: (currentPage == 0) ? 1 : 0,
        child: FloatingActionButton(
          backgroundColor: primaryPink,
          child: Icon(Icons.shopping_cart, color: background),
          onPressed: () {},
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
    );
  }
}
