/**
 * Eddie, enguagns2@gmail.com
 * Created On 2019/12/4
 * Description:
 *    Circle Avatar
 */

import 'clip_oval_demo.dart';
import 'clip_rect_demo.dart';
import 'clip_path_demo.dart';
import 'clip_r_rect_demo.dart';
import 'circle_avatar_demo.dart';
import 'static_rating_demo.dart';
import 'package:flutter/material.dart';
import 'container_decoration_demo.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter 剪裁',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Common Button
  _buildCommonBtn(String text, Widget widget) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.0),
      child: RaisedButton(
        color: Color(0xFFEDECED),
        padding: EdgeInsets.all(16.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
        ),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (c) => widget));
        },
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16.0,
            color: Color(0xFF1D1C1D),
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
        title: Text(
          'Flutter 剪裁',
          style: TextStyle(
            color: Color(0xFF1D1C1D),
          ),
        ),
        backgroundColor: Color(0xFFEDECED),
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            // ClipOval
            _buildCommonBtn('ClipOval 圆形裁剪', ClipOvalDemo()),
            // CircleAvatar
            _buildCommonBtn('CircleAvatar 圆形头像', CircleAvatarDemo()),
            // Container Decoration
            _buildCommonBtn(
              'Container Decoration 装饰形状',
              ContainerDecorationDemo(),
            ),
            // ClipPath
            _buildCommonBtn('ClipPath 路径剪裁', ClipPathDemo()),
            // ClipRect
            _buildCommonBtn('ClipRect 矩形剪裁', ClipRectDemo()),
            // ClipRRect
            _buildCommonBtn('ClipRRect 圆角矩形剪裁', ClipRRectDemo()),
            // Static Rating
            _buildCommonBtn('Star Rating(CustomPaint) 评分控件', StarRatingDemo()),
          ],
        ),
      ),
    );
  }
}
