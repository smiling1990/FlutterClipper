/**
 *
 * Eddie, enguagns2@gmail.com
 *
 */

import 'config.dart';
import 'package:flutter/material.dart';

/// Created On 2019/12/3
/// Description: ClipOval
///
class ClipOvalDemo extends StatefulWidget {
  @override
  _ClipOvalDemoState createState() => _ClipOvalDemoState();
}

class _ClipOvalDemoState extends State<ClipOvalDemo> {
  /// Avatar
  _buildAvatar() {
    return Container(
      height: 160.0,
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      color: Colors.transparent,
      child: ClipOval(
        child: SizedBox(
          width: 120.0,
          height: 120.0,
          child: Image.asset(
            Config.assets_avatar_1,
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
        title: Text('ClipOval'),
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          _buildAvatar(),
        ],
      ),
    );
  }
}
