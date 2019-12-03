## ClipOval 圆形裁剪

![](https://user-gold-cdn.xitu.io/2019/12/3/16ecc3de9573ded7?w=1242&h=2688&f=png&s=290663)

~~~
ClipOval(
    child: SizedBox(
        width: 120.0,
        height: 120.0,
        child: Image.asset(
            Config.assets_avatar_1,
        ),
    ),
);
~~~

## CircleAvatar 圆形头像

![](https://user-gold-cdn.xitu.io/2019/12/3/16ecc3e8300e8649?w=1242&h=2688&f=png&s=291703)
~~~
CircleAvatar(
    radius: 60.0,
    backgroundImage: AssetImage(
        Config.assets_avatar_1,
    ),
);
~~~

## Container Decoration 装饰形状

![](https://user-gold-cdn.xitu.io/2019/12/3/16ecc3f01e4dd651?w=1242&h=2688&f=png&s=937487)

### 通过BoxShape.circle实现圆形图片

~~~
Container(
    width: 120.0,
    height: 120.0,
    decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
            image: AssetImage(
                Config.assets_avatar_1,
            ),
        ),
    )
)；
~~~

### 通过BorderRadius实现圆形图片

~~~
Container(
    width: 120.0,
    height: 120.0,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(60.0)),
            image: DecorationImage(
                image: AssetImage(
                    Config.assets_avatar_1,
                ),
            ),
    ),
)
~~~

## ClipPath 路径剪裁

![](https://user-gold-cdn.xitu.io/2019/12/3/16ecc3ff3a74423b?w=1242&h=2688&f=png&s=103131)
~~~
ClipPath(
    clipper: TriangleClipper(ClipperPosition.LeftTop),
    child: Container(
        width: 16.0,
        height: 16.0,
        decoration: BoxDecoration(
            color: Colors.blue,
        ),
    ),
);

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
~~~

## ClipRect 矩形剪裁

![](https://user-gold-cdn.xitu.io/2019/12/3/16ecc406240af6e4?w=1242&h=2688&f=png&s=1102462)
~~~
Container(
    alignment: Alignment.topCenter,
    color: Colors.transparent,
    child: Container(
        color: Colors.green,
        child: ClipRect(
            clipper: _RectClipper(20.0),
            child: Image.asset(
                Config.assets_avatar_1,
                width: 160.0,
                height: 160.0,
                fit: BoxFit.fill,
            ),
        ),
    ),
);

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
~~~
## ClipRRect 圆角矩形剪裁

![](https://user-gold-cdn.xitu.io/2019/12/3/16ecc40c56b60a21?w=1242&h=2688&f=png&s=976164)
~~~
ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(16.0)),
    child: Image.asset(
        Config.assets_avatar_1,
        fit: BoxFit.fill,
        width: 120.0,
        height: 120.0,
    ),
);
~~~
## Star Rating(CustomPaint) 评分控件

### 评分控件 UI图
![](https://user-gold-cdn.xitu.io/2019/12/3/16ecc411150193df?w=1242&h=2688&f=png&s=136086)

### 实现方案
1. 使用CustomPaint结合ClipPath画出单个五角星；
2. 使用Stack渲染两层画面
    - 背景层，一排灰色五角星
    - 前景层，一排亮色五角星，并使用ClipRect截取一定Width

~~~
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
~~~

## 代码地址
https://github.com/smiling1990/FlutterClipper