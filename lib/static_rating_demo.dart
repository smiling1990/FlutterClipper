/**
 *
 * Eddie, enguagns2@gmail.com
 *
 */

import 'dart:math';
import 'package:flutter/material.dart';

/// Created On 2019/12/3
/// Description:
///
class StarRatingDemo extends StatefulWidget {
  @override
  _StarRatingDemoState createState() => _StarRatingDemoState();
}

class _StarRatingDemoState extends State<StarRatingDemo> {
  /// ClipPath Star Rating
  _buildClipPathStarRating(double rate, int count) {
    return Container(
      padding: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0.0),
      child: StaticRatingBar(
        size: 50.0,
        rate: rate,
        count: count,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Star Rating'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          // _buildClipPathStarRating(1.0, 1),
          _buildClipPathStarRating(0.5, 5),
          _buildClipPathStarRating(2.0, 5),
          _buildClipPathStarRating(3.0, 5),
          _buildClipPathStarRating(4.0, 5),
          _buildClipPathStarRating(5.0, 5),
          _buildClipPathStarRating(5.5, 6),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class StaticRatingBar extends StatelessWidget {
  /// Number of stars
  final int count;

  /// Init rate
  final double rate;

  /// Size of the starts
  final double size;

  final Color colorLight;

  final Color colorDark;

  StaticRatingBar({
    this.rate = 5,
    this.colorLight = const Color(0xFF1E88E5),
    this.colorDark = const Color(0xFFEEEEEE),
    this.count = 5,
    this.size = 60,
  });

  Widget buildDarkStar() {
    return SizedBox(
      width: size * count,
      height: size,
      child: CustomPaint(
        painter: _PainterStars(
          count: count,
          color: colorDark,
          strokeWidth: 0.0,
          size: this.size / 2,
          style: PaintingStyle.fill,
        ),
      ),
    );
  }

  Widget buildLightStar() {
    return ClipRect(
      clipper: _RatingBarClipper(rate * size),
      child: SizedBox(
        height: size,
        width: size * count,
        child: CustomPaint(
          painter: _PainterStars(
            count: count,
            strokeWidth: 0.0,
            color: colorLight,
            size: this.size / 2,
            style: PaintingStyle.fill,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        buildDarkStar(),
        buildLightStar(),
      ],
    );
  }
}

class _RatingBarClipper extends CustomClipper<Rect> {
  final double width;

  _RatingBarClipper(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0.0, 0.0, width, size.height);
  }

  @override
  bool shouldReclip(_RatingBarClipper oldClipper) {
    return false;
  }
}

class _PainterStars extends CustomPainter {
  final double size;
  final int count;
  final Color color;
  final PaintingStyle style;
  final double strokeWidth;

  _PainterStars({
    this.size,
    this.count,
    this.color,
    this.strokeWidth,
    this.style,
  });

  double degree2Radian(int degree) {
    return (pi * degree / 180);
  }

  Path createStarPath(double radius, Path path) {
    double radian = degree2Radian(36);
    double radiusIn = (radius * sin(radian / 2) / cos(radian)) * 1.1;
    path.moveTo((radius * cos(radian / 2)), 0.0);
    path.lineTo(
      (radius * cos(radian / 2) + radiusIn * sin(radian)),
      (radius - radius * sin(radian / 2)),
    );
    path.lineTo(
      (radius * cos(radian / 2) * 2),
      (radius - radius * sin(radian / 2)),
    );
    path.lineTo(
      (radius * cos(radian / 2) + radiusIn * cos(radian / 2)),
      (radius + radiusIn * sin(radian / 2)),
    );
    path.lineTo(
      (radius * cos(radian / 2) + radius * sin(radian)),
      (radius + radius * cos(radian)),
    );
    path.lineTo((radius * cos(radian / 2)), (radius + radiusIn));
    path.lineTo(
      (radius * cos(radian / 2) - radius * sin(radian)),
      (radius + radius * cos(radian)),
    );
    path.lineTo(
      (radius * cos(radian / 2) - radiusIn * cos(radian / 2)),
      (radius + radiusIn * sin(radian / 2)),
    );
    path.lineTo(0.0, (radius - radius * sin(radian / 2)));
    path.lineTo(
      (radius * cos(radian / 2) - radiusIn * sin(radian)),
      (radius - radius * sin(radian / 2)),
    );
    path.lineTo((radius * cos(radian / 2)), 0.0);
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.strokeWidth = strokeWidth;
    paint.color = color;
    paint.style = style;
    Path path = Path();
    double offset = strokeWidth > 0 ? strokeWidth + 2 : 0.0;

    path = createStarPath(this.size - offset, path);
    for (int i = 0; i < count - 1; i++) {
      path = path.shift(Offset(this.size * 2, 0.0));
      path = createStarPath(this.size - offset, path);
    }

    if (offset > 0) {
      path = path.shift(Offset(offset, offset));
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_PainterStars oldDelegate) {
    return oldDelegate.size != this.size;
  }
}
