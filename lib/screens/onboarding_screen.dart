import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  late PageController _pageController;
  int _pageindex =0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: demo_deta.length,
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _pageindex = index;
                  });
                },
                itemBuilder: (context, index) => OnBoardingWidget(
                  image: demo_deta[index].image,
                  title: demo_deta[index].title,
                  description: demo_deta[index].description,
                ),
              ),
            ),

            Row(
              children: [
                ...List.generate(
                  demo_deta.length,
                  (index) => Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: DotIndicator(
                      isActive: index == _pageindex,
                      ),
                  )),
                const Spacer(),
                SizedBox(
                  height: 60,
                  width: 60,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      backgroundColor: Colors.pink),
                    onPressed: (){
                      _pageController.nextPage(
                        duration: const Duration(
                          microseconds: 300,
                          ),
                          curve: Curves.ease,
                          );
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 30,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    required this.isActive,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: isActive ? 16 : 4,
      width: 4, 
      decoration: BoxDecoration(
        color: isActive ? Colors.red : Colors.red.withOpacity(0.4),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }
}

class OnBoard {
  final String image, title, description;

  OnBoard({
    required this.image,
    required this.title,
    required this.description,
  });
}

final List<OnBoard> demo_deta =[
  OnBoard(image: "asset/images/page1.jpg",
          title: "Find the item you've\nbeen looking for.",
          description: "Here you'll see rich varities of goods, carefully classified for seamless browsing exerience."),
  OnBoard(image: "asset/images/page2.jpg",
          title: "Find the item you've\nbeen.",
          description: "Here you'll see rich varities of goods."),
  OnBoard(image: "asset/images/page3.jpg",
          title: "looking for.",
          description: "carefully classified for seamless browsing exerience."),
  OnBoard(image: "asset/images/page4.jpg",
          title: "looking for.",
          description: "browsing exerience."),
  OnBoard(image: "asset/images/page5.jpg",
          title: "looking for.",
          description: "carefully classified ."),
];

class OnBoardingWidget extends StatelessWidget {
  const OnBoardingWidget({
    super.key, required this.image, required this.title, required this.description,
  });

  final String image, title, description;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(image, height: 200,),
        const Spacer(),
        Text(title,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          textStyle: Theme.of(context).textTheme.displayLarge,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
        ),
        ),
        const SizedBox(height: 30,),
        Text(description,
        textAlign: TextAlign.center,
        style: GoogleFonts.lato(
          textStyle: Theme.of(context).textTheme.displayLarge,
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
        ),
        ),
        const Spacer(),
      ],
    );
  }
}