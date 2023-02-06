import 'package:flutter/material.dart';

/// @DanhP custom from [UnderlineTabIndicator]
class HaloTabIndicator extends Decoration {
  const HaloTabIndicator({
    this.borderSide = const BorderSide(width: 3.0, color: Colors.blue),
    this.indicatorWidth = 30,
  });

  final BorderSide borderSide;
  final double indicatorWidth;

  @override
  Decoration? lerpFrom(Decoration? a, double t) {
    if (a is HaloTabIndicator) {
      return HaloTabIndicator(
        borderSide: BorderSide.lerp(a.borderSide, borderSide, t),
        indicatorWidth: a.indicatorWidth,
      );
    }
    return super.lerpFrom(a, t);
  }

  @override
  Decoration? lerpTo(Decoration? b, double t) {
    if (b is HaloTabIndicator) {
      return HaloTabIndicator(
        borderSide: BorderSide.lerp(borderSide, b.borderSide, t),
        indicatorWidth: b.indicatorWidth,
      );
    }
    return super.lerpTo(b, t);
  }

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _UnderlinePainter(this, onChanged);
  }

  Rect _indicatorRectFor(Rect rect, TextDirection textDirection) {
    final Rect indicator = EdgeInsets.zero.resolve(textDirection).deflateRect(rect);
    return Rect.fromLTWH(
      (indicator.left + indicator.right) / 2 - indicatorWidth / 2,
      indicator.bottom - borderSide.width,
      indicatorWidth,
      borderSide.width,
    );
  }

  @override
  Path getClipPath(Rect rect, TextDirection textDirection) {
    return Path()..addRect(_indicatorRectFor(rect, textDirection));
  }
}

class _UnderlinePainter extends BoxPainter {
  _UnderlinePainter(this.decoration, VoidCallback? onChanged)
      : super(onChanged);

  final HaloTabIndicator decoration;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);
    final Rect rect = offset & configuration.size!;
    final TextDirection textDirection = configuration.textDirection!;
    final Rect indicator = decoration
        ._indicatorRectFor(rect, textDirection)
        .deflate(decoration.borderSide.width / 4.0);
    double radius = decoration.borderSide.width / 2;
    final Paint paint = decoration.borderSide.toPaint()..strokeCap = StrokeCap.round;
    canvas.drawRRect(
        RRect.fromLTRBAndCorners(indicator.left, indicator.top - radius / 2, indicator.right,
            indicator.bottom - radius / 2,
            topLeft: Radius.circular(radius), topRight: Radius.circular(radius)),
        paint);
  }
}
