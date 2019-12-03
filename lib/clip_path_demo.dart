/**
 *
 * Eddie, enguagns2@gmail.com
 *
 */

import 'dart:math';
import 'package:flutter/material.dart';

/// Created On 2019/12/3
/// Description: ClipPath
///
class ClipPathDemo extends StatefulWidget {
  @override
  _ClipPathDemoState createState() => _ClipPathDemoState();
}

class _ClipPathDemoState extends State<ClipPathDemo> {
  /// ClipPath Star
  _buildStarCliper() {
    return Container(
      padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child: ClipPath(
        clipper: StarCliper(60.0),
        child: Container(
          width: 120.0,
          height: 120.0,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  /// ClipPath Triangle TopLeft
  _buildTriangleCliperTopLeft() {
    return Container(
      padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ClipPath(
            clipper: TriangleClipper(ClipperPosition.LeftTop),
            child: Container(
              width: 16.0,
              height: 16.0,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 120.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ClipPath Triangle TopRight
  _buildTriangleCliperTopRight() {
    return Container(
      padding: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              height: 120.0,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8.0),
                  bottomLeft: Radius.circular(8.0),
                  bottomRight: Radius.circular(8.0),
                ),
              ),
            ),
          ),
          ClipPath(
            clipper: TriangleClipper(ClipperPosition.RightTop),
            child: Container(
              width: 16.0,
              height: 16.0,
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ClipPath'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          _buildStarCliper(),
          _buildTriangleCliperTopLeft(),
          _buildTriangleCliperTopRight(),
          SizedBox(height: 24.0),
        ],
      ),
    );
  }
}

enum ClipperPosition {
  LeftTop,
  RightTop,
}

class TriangleClipper extends CustomClipper<Path> {
  final ClipperPosition position;

  TriangleClipper(this.position);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, 0.0);
    if (position == ClipperPosition.LeftTop) {
      path.lineTo(size.width, 0.0);
      path.lineTo(size.width, size.height);
    } else if (position == ClipperPosition.RightTop) {
      path.lineTo(size.width, 0.0);
      path.lineTo(0.0, size.height);
    }
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return false;
  }
}

class StarCliper extends CustomClipper<Path> {
  final double radius;

  StarCliper(this.radius);

  double degree2Radian(int degree) {
    return (pi * degree / 180);
  }

  @override
  Path getClip(Size size) {
    double radius = this.radius;
    Path path = new Path();
    double radian = degree2Radian(36);
    double radiusIn = (radius * sin(radian / 2) / cos(radian));
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
    path.close();
    return path;
  }

  @override
  bool shouldReclip(StarCliper oldClipper) {
    return false;
  }
}
