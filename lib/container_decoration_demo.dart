/**
 *
 * Eddie, enguagns2@gmail.com
 *
 */

import 'config.dart';
import 'package:flutter/material.dart';

/// Created On 2019/12/3
/// Description: Container BoxShape
///
class ContainerDecorationDemo extends StatefulWidget {
  @override
  _ContainerDecorationDemoState createState() => _ContainerDecorationDemoState();
}

class _ContainerDecorationDemoState extends State<ContainerDecorationDemo> {
  /// Container BoxShape Circle
  _buildContainerBoxShape() {
    final double radius = 60.0;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0.0),
      child: Container(
        width: radius * 2,
        height: radius * 2,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
              Config.assets_avatar_1,
            ),
          ),
        ),
      ),
    );
  }

  /// Container Border Radius
  _buildContainerBorderRadius(double size, double radius) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(24.0, 16.0, 24.0, 0.0),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          image: DecorationImage(
            image: AssetImage(
              Config.assets_avatar_1,
            ),
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
        title: Text('Container Decoration'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          _buildContainerBoxShape(),
          _buildContainerBorderRadius(120.0, 20.0),
          _buildContainerBorderRadius(120.0, 40.0),
          _buildContainerBorderRadius(120.0, 60.0),
          SizedBox(height: 16.0),
        ],
      ),
    );
  }
}
