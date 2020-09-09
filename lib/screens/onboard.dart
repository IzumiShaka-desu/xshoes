import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:xshoes/constant.dart';
import 'package:xshoes/screens/page.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<String> images = [
    "images/ctp.png",
    "images/co.png",
    "images/pay.png",
    "images/pod.png"
  ];
  double current=0;
  PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {
      setState(() {
        current = _pageController.page;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SafeArea(
      child: Stack(
        children: [
          Container(
            color: background,
              child: PageView.builder(
                  controller: _pageController,
                  itemCount: images.length,
                  itemBuilder: (ctx, index) =>
                      Image.asset(images[index], fit: BoxFit.contain))),
          Positioned(
              top: 5,
              right: 5,
              child: Container(
                  child: FlatButton(
                      onPressed: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => PageContainer())),
                      color: background,
                      child:
                          Text('skip', style: TextStyle(color: secodaryGreyActive))))),
          Positioned(
              bottom: 10,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal:20),
                width: size.width,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  DotsIndicator(
                    dotsCount: images.length,
                    position: current,
                    decorator: DotsDecorator(
                      size: const Size.square(9.0),
                      activeSize: const Size(18.0, 9.0),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                  AnimatedContainer(
                    duration:Duration(milliseconds: 200),
                    curve: Curves.bounceInOut,
              width:  (current == images.length - 1)
                      ? 150:80,
              child: FlatButton(
                color: primaryCardBlue,
                  onPressed: () {
                    (current < images.length-1)
                      ? setState((){
                        current=current+1;
                       _pageController.jumpToPage(current.toInt());}):Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => PageContainer()));},
                  child: Text( (current == images.length - 1)
                      ? 'Get Started':'Next',style: TextStyle(color:background),)))
                ]),
              )),
          
        ],
      ),
    );
  }
}
