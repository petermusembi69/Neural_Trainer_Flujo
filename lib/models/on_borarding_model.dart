import 'package:flutter/material.dart';
import 'package:nueral_trainer/utils/_index.dart';

class OnBoardingModel {
  bool isFirstScreen;
  String backGroundImage;
  String title;
  String subtitle;
  Color? backGroundColor;
  String? centerImage;

  OnBoardingModel({
    required this.isFirstScreen,
    required this.backGroundImage,
    required this.title,
    required this.subtitle,
    this.backGroundColor,
    this.centerImage,
  });
}

final onBoradingScreens = [
  OnBoardingModel(
    isFirstScreen: true,
    backGroundImage: 'assets/images/neuralwel.png',
    subtitle: "COMENZÁ A VIVIR TU",
    title: "NT EXPERIENCE",
    centerImage: "assets/images/appIcon.png",
  ),
  OnBoardingModel(
    isFirstScreen: false,
    backGroundImage: 'assets/images/conecta_con_cel.png',
    title: "CONECTA",
    subtitle:
        '''Conecta tus neuro sensores a la aplicación Neural Trainer y comienza a aumentar tu rendimiento cognitivo.''',
    backGroundColor: $styles.colors.black,
  ),
  OnBoardingModel(
    isFirstScreen: false,
    backGroundImage: 'assets/images/entrena_con_cel.png',
    title: 'ENTRENA',
    subtitle:
        '''Selecciona una actividad creada por el equipo de Neural Trainer o crea tu propio entrenamiento específico.''',
    backGroundColor: $styles.colors.black,
  ),
  OnBoardingModel(
    isFirstScreen: false,
    backGroundImage: 'assets/images/analiza_con_cel.png',
    title: "ANALIZA",
    subtitle:
        '''Monitorea el desempeño de tus atletas, registra sus resultados y compártelos en tiempo real.''',
    backGroundColor: $styles.colors.black,
  ),
];
