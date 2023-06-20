import 'package:flutter/material.dart';
import 'package:hephzibah/common/commons.dart';
import 'package:hephzibah/ui/splash_screen/step1.dart';
import 'package:onboarding/onboarding.dart';

class OnBoardingOne extends StatefulWidget {
  const OnBoardingOne({Key? key}) : super(key: key);

  @override
  State<OnBoardingOne> createState() => _OnBoardingOneState();
}

class _OnBoardingOneState extends State<OnBoardingOne> {
  late Material materialButton;
  late int index;
  final onboardingPagesList = [
    PageModel(
      widget: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Skip',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Welcome',
              style: headerText,
            ),
            Text(
              'to Digital Clinic',
              style: headerText.copyWith(color: darkColor),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Far far away, behind the word mountains,',
              style: normalText,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'far from the countries Vokalia and Consonantia, there live the',
              style: normalText,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'blind texts.',
              style: normalText,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 350,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/onboard1.png'),
                        fit: BoxFit.fill)),
              ),
            ),
            //Image.asset('assets/onboard1.png',fit: BoxFit.fill,height: 300,),
          ],
        ),
      ),
    ),
    PageModel(
      widget: Container(
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Skip',
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Ask',
              style: headerText,
            ),
            Text(
              'a Doctor Online',
              style: headerText.copyWith(color: darkColor),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Far far away, behind the word mountains,',
              style: normalText,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'far from the countries Vokalia and Consonantia, there live the',
              style: normalText,
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              'blind texts.',
              style: normalText,
            ),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                height: 350,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/onboard2.png'),
                        fit: BoxFit.fill)),
              ),
            ),
            //Image.asset('assets/onboard1.png',fit: BoxFit.fill,height: 300,),
          ],
        ),
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    materialButton = _skipButton();
    index = 0;
  }

  Material _skipButton({void Function(int)? setIndex}) {
    return Material(
      color: primaryColor,
      child: InkWell(
        borderRadius: defaultSkipButtonBorderRadius,
        onTap: () {
          if (setIndex != null) {
            index = 1;
            setIndex(1);
          }
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Row(
            children: [
              Text(
                'Next',
                style: defaultSkipButtonTextStyle,
              ),
              SizedBox(
                width: 10,
              ),
              Icon(Icons.arrow_circle_right_outlined)
            ],
          ),
        ),
      ),
    );
  }

  Material get _signupButton {
    return Material(
      color: primaryColor,
      child: InkWell(
        borderRadius: defaultProceedButtonBorderRadius,
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => const StepOne())),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Text(
            'Continue',
            style: defaultProceedButtonTextStyle,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Onboarding(
        pages: onboardingPagesList,
        onPageChange: (int pageIndex) {
          index = pageIndex;
        },
        startPageIndex: 0,
        footerBuilder: (context, dragDistance, pagesLength, setIndex) {
          return DecoratedBox(
            decoration: BoxDecoration(
              color: whiteColor,
              border: Border.all(
                width: 0.0,
                color: whiteColor,
              ),
            ),
            child: ColoredBox(
              color: whiteColor,
              child: Padding(
                padding: const EdgeInsets.all(45.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomIndicator(
                      netDragPercent: dragDistance,
                      pagesLength: pagesLength,
                      indicator: Indicator(
                        indicatorDesign: IndicatorDesign.line(
                          lineDesign: LineDesign(
                            lineType: DesignType.line_uniform,
                          ),
                        ),
                      ),
                    ),
                    index == pagesLength - 1
                        ? _signupButton
                        : _skipButton(setIndex: setIndex)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
