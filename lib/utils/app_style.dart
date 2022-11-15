part of neural_trainer_utils;

@immutable
class AppStyle {
  final AppColors colors = AppColors();

  late final corners = _Corners();

  late final insets = _Insets();

  late final text = _Text();

  final times = _Times();
}

@immutable
class _Times {
  final Duration fast = const Duration(milliseconds: 300);
  final Duration med = const Duration(milliseconds: 600);
  final Duration slow = const Duration(milliseconds: 900);
  final Duration xslow = const Duration(milliseconds: 1200);
}

@immutable
class _Corners {
  late final double sm = 2;
  late final double md = 8;
  late final double lg = 27;
}

@immutable
class _Insets {
  late final double xxs = 4;
  late final double xs = 8;
  late final double sm = 16;
  late final double md = 24;
  late final double lg = 32;
  late final double xl = 48;
  late final double xxl = 56;
  late final double offset = 80;
}
