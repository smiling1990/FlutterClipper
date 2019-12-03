/**
 *
 * Eddie, enguagns2@gmail.com
 *
 */

import 'config.dart';
import 'package:flutter/material.dart';

/// Created On 2019/12/3
/// Description: CircleAvatar
///
class CircleAvatarDemo extends StatefulWidget {
  @override
  _CircleAvatarDemoState createState() => _CircleAvatarDemoState();
}

class _CircleAvatarDemoState extends State<CircleAvatarDemo> {
  /// CircleAvatar
  _buildCircleAvatar() {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child: CircleAvatar(
        radius: 60.0,
        backgroundImage: AssetImage(
          Config.assets_avatar_1,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('CircleAvatar'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          _buildCircleAvatar(),
        ],
      ),
    );
  }
}
