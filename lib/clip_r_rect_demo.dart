/**
 *
 * Eddie, enguagns2@gmail.com
 *
 */

import 'config.dart';
import 'package:flutter/material.dart';

/// Created On 2019/12/3
/// Description: ClipRRect
///
class ClipRRectDemo extends StatefulWidget {
  @override
  _ClipRRectDemoState createState() => _ClipRRectDemoState();
}

class _ClipRRectDemoState extends State<ClipRRectDemo> {
  /// ClipRRect
  _buildClipRRect(double radius) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(bottom: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(radius)),
        child: Image.asset(
          Config.assets_avatar_1,
          fit: BoxFit.fill,
          width: 120.0,
          height: 120.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('ClipRRect'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          SizedBox(height: 16.0),
          _buildClipRRect(0.0),
          _buildClipRRect(16.0),
          _buildClipRRect(32.0),
          _buildClipRRect(60.0), // 120 / 2
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
