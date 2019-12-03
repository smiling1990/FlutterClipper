/**
 *
 * Eddie, enguagns2@gmail.com
 *
 */

import 'config.dart';
import 'package:flutter/material.dart';

/// Created On 2019/12/3
/// Description: ClipRect
///
class ClipRectDemo extends StatefulWidget {
  @override
  _ClipRectDemoState createState() => _ClipRectDemoState();
}

class _ClipRectDemoState extends State<ClipRectDemo> {
  /// ClipRect
  _buildClipRect(double removeSize, Color bg) {
    return Container(
      alignment: Alignment.topCenter,
      color: Colors.transparent,
      child: Container(
        color: bg,
        child: ClipRect(
          clipper: _RectClipper(removeSize),
          child: Image.asset(
            Config.assets_avatar_1,
            width: 160.0,
            height: 160.0,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ClipRect'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(height: 16.0),
          _buildClipRect(0.0, Colors.blue),
          _buildClipRect(10.0, Colors.red),
          _buildClipRect(20.0, Colors.green),
          _buildClipRect(40.0, Colors.pink),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

class _RectClipper extends CustomClipper<Rect> {
  /// Remove side of size
  final double removeSize;

  _RectClipper(this.removeSize);

  @override
  Rect getClip(Size size) {
    return new Rect.fromLTRB(
      removeSize,
      removeSize,
      size.width - removeSize,
      size.height - removeSize,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return false;
  }
}
