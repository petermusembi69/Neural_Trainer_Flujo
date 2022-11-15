import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:nueral_trainer/models/on_borarding_model.dart';
import 'package:nueral_trainer/utils/_index.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final _pageController = PageController();
  final _currentIndex = ValueNotifier<int>(0);

  void _pageListener() {
    _currentIndex.value = _pageController.page!.toInt();
  }

  @override
  void initState() {
    _pageController.addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    _pageController
      ..removeListener(_pageListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: $styles.colors.black,
      body: PageView.builder(
        itemCount: onBoradingScreens.length,
        controller: _pageController,
        itemBuilder: (context, int index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              ...onBoradingScreens[index].isFirstScreen
                  ? landingPage(index, size)
                  : onboardingScreens(index, size),
            ],
          );
        },
      ),
    );
  }

  List<Widget> landingPage(int index, Size size) {
    return <Widget>[
      TweenAnimationBuilder(
        tween: Tween<double>(begin: 1, end: 0),
        duration: $styles.times.fast,
        builder: (context, double value, _) {
          return Transform.rotate(
            angle: math.pi * 3 * value,
            child: Image.asset(
              onBoradingScreens[index].backGroundImage,
              fit: BoxFit.cover,
            ),
          );
        },
      ),
      Expanded(
        child: Column(
          children: [
            Gap(.42 * size.height),
            TweenAnimationBuilder(
              tween: Tween<double>(begin: 1, end: 0),
              duration: $styles.times.xslow,
              builder: (context, double value, _) {
                return Opacity(
                  opacity: 1 - value,
                  child: Image.asset(
                    onBoradingScreens[index].centerImage!,
                    fit: BoxFit.contain,
                    height: .0535 * size.height,
                    width: 171,
                  ),
                );
              },
            ),
            Gap(.2 * size.height),
            TweenAnimationBuilder(
                tween: Tween<double>(begin: 1, end: 0),
                duration: $styles.times.slow,
                builder: (context, double value, _) {
                  return Transform.translate(
                    offset: Offset(
                      0,
                      800 * value,
                    ),
                    child: Opacity(
                      opacity: 1 - value,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: $styles.insets.md),
                        child: Text(
                          onBoradingScreens[index].subtitle,
                          textAlign: TextAlign.center,
                          style: $styles.text.subtitle
                              .copyWith(color: $styles.colors.white),
                        ),
                      ),
                    ),
                  );
                }),
            const Gap(12),
            TweenAnimationBuilder(
                tween: Tween<double>(begin: 1, end: 0),
                duration: $styles.times.slow,
                builder: (context, double value, _) {
                  return Transform.translate(
                    offset: Offset(
                      0,
                      1800 * value,
                    ),
                    child: Opacity(
                      opacity: 1 - value,
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: $styles.insets.md),
                        child: Text(
                          onBoradingScreens[index].title,
                          textAlign: TextAlign.center,
                          style: $styles.text.h1.copyWith(
                            color: $styles.colors.accent1,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
            Gap(.053 * size.height),
            TweenAnimationBuilder(
                tween: Tween<double>(begin: 1, end: 0),
                duration: $styles.times.slow,
                builder: (context, double value, _) {
                  return Transform.translate(
                    offset: Offset(
                      0,
                      800 * value,
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: $styles.insets.xxs),
                      child: Wrap(
                        children: onBoradingScreens.map(
                          (e) {
                            return ValueListenableBuilder<int>(
                              valueListenable: _currentIndex,
                              builder: (context, currentIndex, _) {
                                final isActive = e.title ==
                                    onBoradingScreens[currentIndex].title;

                                return Padding(
                                  padding:
                                      EdgeInsets.only(right: $styles.insets.sm),
                                  child: Container(
                                    height: $styles.insets.xs,
                                    width: $styles.insets.xs,
                                    decoration: BoxDecoration(
                                      color: isActive
                                          ? Colors.transparent
                                          : $styles.colors.greyMedium,
                                      borderRadius: BorderRadius.circular(
                                          $styles.insets.xxs),
                                      border: isActive
                                          ? Border.all(
                                              color: $styles.colors.accent1)
                                          : null,
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ).toList(),
                      ),
                    ),
                  );
                }),
            Gap(.053 * size.height),
            TweenAnimationBuilder(
                tween: Tween<double>(begin: 1, end: 0),
                duration: $styles.times.xslow,
                builder: (context, double value, _) {
                  return Transform.translate(
                    offset: Offset(
                      0,
                      800 * value,
                    ),
                    child: ValueListenableBuilder<int>(
                      valueListenable: _currentIndex,
                      builder: (context, currentIndex, _) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: $styles.insets.md),
                          child: MaterialButton(
                            onPressed: () {
                              if (_pageController.hasClients &&
                                  currentIndex < 3) {
                                _pageController.nextPage(
                                  duration: $styles.times.med,
                                  curve: Curves.easeIn,
                                );
                              }
                            },
                            color: $styles.colors.accent1,
                            minWidth: double.infinity,
                            height: 54,
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular($styles.corners.lg),
                            ),
                            child: Text(
                              'iniciar sesión'.toUpperCase(),
                              style: $styles.text.btn,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
            Gap(.0267 * size.height),
          ],
        ),
      ),
    ];
  }

  List<Widget> onboardingScreens(int index, Size size) {
    return <Widget>[
      Image.asset(
        onBoradingScreens[index].backGroundImage,
        fit: BoxFit.cover,
      ),
      Expanded(
        child: Container(
          color: onBoradingScreens[index].backGroundColor,
          child: Column(
            children: [
              Gap(.102 * size.height),
              Text(
                '#MOVEYOURMIND',
                textAlign: TextAlign.center,
                style: $styles.text.h2.copyWith(
                  color: $styles.colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Gap(.067 * size.height),
              TweenAnimationBuilder(
                  tween: Tween<double>(begin: 1, end: 0),
                  duration: $styles.times.slow,
                  builder: (context, double value, _) {
                    return Transform.translate(
                      offset: Offset(
                        value * (index % 2 == 0 ? -800 : 800),
                        value * (index % 2 == 0 ? -800 : 800),
                      ),
                      child: Opacity(
                        opacity: 1 - value,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: $styles.insets.md),
                          child: Image.asset(
                            onBoradingScreens[index].backGroundImage,
                            fit: BoxFit.contain,
                            height: .337 * size.height,
                          ),
                        ),
                      ),
                    );
                  }),
              Gap(.027 * size.height),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: $styles.insets.md),
                child: TweenAnimationBuilder(
                    tween: Tween<double>(begin: 1, end: 0),
                    duration: $styles.times.fast,
                    builder: (context, double value, _) {
                      return Transform.translate(
                        offset: Offset(
                          value * -300,
                          0,
                        ),
                        child: Opacity(
                          opacity: 1 - value,
                          child: Text(
                            onBoradingScreens[index].title,
                            textAlign: TextAlign.center,
                            style: $styles.text.h1.copyWith(
                              color: $styles.colors.accent1,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Gap(.026 * size.height),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: $styles.insets.md),
                child: TweenAnimationBuilder(
                  tween: Tween<double>(begin: 1, end: 0),
                  duration: $styles.times.med,
                  builder: (context, double value, _) {
                    return Transform.translate(
                      offset: Offset(
                        value * -300,
                        0,
                      ),
                      child: Opacity(
                        opacity: 1 - value,
                        child: Text(
                          onBoradingScreens[index].subtitle,
                          textAlign: TextAlign.center,
                          style: $styles.text.subtitle
                              .copyWith(color: $styles.colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: $styles.insets.xxs),
                child: Wrap(
                  children: onBoradingScreens.map(
                    (e) {
                      return ValueListenableBuilder<int>(
                        valueListenable: _currentIndex,
                        builder: (context, currentIndex, _) {
                          final isActive =
                              e.title == onBoradingScreens[currentIndex].title;

                          return Padding(
                            padding: EdgeInsets.only(right: $styles.insets.xs),
                            child: Container(
                              height: $styles.insets.xs,
                              width: $styles.insets.xs,
                              decoration: BoxDecoration(
                                color: isActive
                                    ? Colors.transparent
                                    : $styles.colors.greyMedium,
                                borderRadius:
                                    BorderRadius.circular($styles.insets.xxs),
                                border: isActive
                                    ? Border.all(color: $styles.colors.accent1)
                                    : null,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ).toList(),
                ),
              ),
              Gap(.05 * size.height),
              ValueListenableBuilder<int>(
                valueListenable: _currentIndex,
                builder: (context, currentIndex, _) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: $styles.insets.md),
                    child: MaterialButton(
                      onPressed: () {
                        if (_pageController.hasClients && currentIndex < 3) {
                          _pageController.nextPage(
                            duration: $styles.times.med,
                            curve: Curves.easeIn,
                          );
                        }
                      },
                      color: $styles.colors.accent1,
                      minWidth: double.infinity,
                      height: 54,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular($styles.corners.lg),
                      ),
                      child: Text(
                        'iniciar sesión'.toUpperCase(),
                        style: $styles.text.btn,
                      ),
                    ),
                  );
                },
              ),
              Gap(.0267 * size.height),
            ],
          ),
        ),
      ),
    ];
  }
}
