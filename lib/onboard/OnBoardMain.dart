import 'package:adel2/onboard/OnBoard.dart';
import 'package:flutter/material.dart';
import 'package:adel2/LogIn/LogIn.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  void _navigationTonextpage() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _navigationTonextpage,
        child: SizedBox.expand(
          child: Image.asset(
            "assets/image/Splash.png",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late List<OnBoardingModel> onBoardingModellist;
  final PageController C1 = PageController();

  void _navigeteToLoginPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const LogInPage()));
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  void dispose() {
    C1.dispose();
    super.dispose();
  }

  void loadData() {
    onBoardingModellist = [
      OnBoardingModel(
          image: "assets/image/Sketches.png",
          title: "Start journey \nWith Nike ",
          description: "Smart, Gorgeous & Fashionable Collection"),
      OnBoardingModel(
          image: "assets/image/sketch3.png",
          title: "Follow Latest \nStyle Shoes ",
          description:
          "There Are Many Beautiful And \nAttractive Plants To Your Room"),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: PageView.builder(
                controller: C1,
                itemCount: onBoardingModellist.length,
                itemBuilder: (context, index) {
                  return Stack(
                    children: [
                      if(index==1)
                        Positioned(
                          top: 260,
                          right: 60,
                          child: Image.asset(
                            'assets/image/NIKE.png',
                            fit: BoxFit.fill,
                          ),
                        ),

                      Positioned.fill(
                        child: Image.asset(
                          'assets/image/SketchBck.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: -10,
                        left: 190,
                        child: Image.asset(
                          'assets/image/Ellipse 906.png',
                          width: 300,
                          height: 300,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        top: 180,
                        left: 47,
                        child: Image.asset(
                          'assets/image/Ellipse 905.png',
                          width: 16,
                          height: 16,
                          fit: BoxFit.fill,
                        ),
                      ),
                      if(index==0)
                        Positioned(
                          top: 460,
                          right: 60,
                          child: Image.asset(
                            'assets/image/Ellipse 903.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      if(index==1)
                        Positioned(
                          top: 510,
                          right: 60,
                          child: Image.asset(
                            'assets/image/Ellipse 903.png',
                            fit: BoxFit.fill,
                          ),
                        ),

                      Positioned(
                        top: 510,
                        left: 20,
                        child: Image.asset(
                          'assets/image/Ellipse 903.png',
                          fit: BoxFit.fill,
                        ),
                      ),
                      Positioned(
                        top: 214.52,
                        right: 10,
                        child: Image.asset(
                          onBoardingModellist[index].image,
                          width: 440,
                          height: 250,
                          fit: BoxFit.contain,
                        ),
                      ),
                      if (index == 1)
                        Positioned(
                          top: 350,
                          left: 160,
                          child: Image.asset(
                            'assets/image/Ellipse 907.png',
                            width: 200,
                            height: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                      Container(
                        margin: const EdgeInsets.all(30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 90),
                              child: Text(
                                onBoardingModellist[index].title,
                                style: const TextStyle(
                                    fontSize: 40,
                                    color: Colors.black,
                                    fontFamily: 'AIRBNB',
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              onBoardingModellist[index].description,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.grey,
                                  fontFamily: 'AIRBNB',
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: SizedBox(
                    height: 10,
                    width: 20,
                    child: SmoothPageIndicator(
                      controller: C1,
                      count: onBoardingModellist.length,
                      effect: const WormEffect(
                        activeDotColor: Colors.white,
                        dotColor: Colors.cyan,
                        dotHeight: 11,
                        dotWidth: 12,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 20, 10, 30),
                  child: SizedBox(
                    height: 60,
                    width: 170,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan),
                        onPressed: _navigeteToLoginPage,
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
