part of neural_trainer_utils;

@immutable
class _Text {
  final font = TextStyle(fontFamily: GoogleFonts.rubik().fontFamily);

  late final TextStyle h1 = copy(
    font,
    sizePx: 40,
    fontStyle: FontStyle.italic,
    heightPx: 34,
    weight: FontWeight.w700,
    spacingPc: 0.280403,
  );

  late final TextStyle h2 = copy(
    font,
    sizePx: 20,
    fontStyle: FontStyle.italic,
    heightPx: 24,
    weight: FontWeight.w700,
  );

  late final TextStyle subtitle = copy(
    font,
    sizePx: 16,
    heightPx: 22,
    spacingPc: 0.2,
    weight: FontWeight.w400,
  );

  late final TextStyle btn = copy(
    font,
    sizePx: 16,
    heightPx: 20,
    spacingPc: -0.24,
    weight: FontWeight.normal,
  );

  TextStyle copy(TextStyle style,
      {required double sizePx,
      double? heightPx,
      FontStyle? fontStyle,
      double? spacingPc,
      FontWeight? weight}) {
    return style.copyWith(
        fontSize: sizePx,
        height: heightPx != null ? (heightPx / sizePx) : style.height,
        fontStyle: fontStyle != null ? FontStyle.normal : fontStyle,
        letterSpacing:
            spacingPc != null ? sizePx * spacingPc * 0.01 : style.letterSpacing,
        fontWeight: weight);
  }
}
