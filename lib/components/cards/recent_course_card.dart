import 'package:designcode/model/course.dart';
import 'package:flutter/material.dart';

import '../../constants.dart';

// ignore: must_be_immutable
class RecentCourseCard extends StatefulWidget {
  RecentCourseCard({this.course});

  Course course;

  @override
  _RecentCourseCardState createState() => _RecentCourseCardState();
}

class _RecentCourseCardState extends State<RecentCourseCard> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Container(
            width: 240,
            height: 240,
            decoration: BoxDecoration(gradient: widget.course.background, borderRadius: BorderRadius.circular(41.0), boxShadow: [
              BoxShadow(color: widget.course.background.colors[0].withOpacity(0.3), offset: Offset(0, 20), blurRadius: 30.0),
              BoxShadow(color: widget.course.background.colors[1].withOpacity(0.3), offset: Offset(0, 20), blurRadius: 30.0)
            ]),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 32.0,
                    left: 32.0,
                    right: 32.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: widget.course.courseSubtitle,
                        child: Text(
                          widget.course.courseSubtitle,
                          style: kCardSubtitleStyle,
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Hero(
                        tag: widget.course.courseTitle,
                        child: Text(
                          widget.course.courseTitle,
                          style: kCardTitleStyle,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Hero(
                    child: Image.asset(
                      'asset/illustrations/${widget.course.illustration}',
                      fit: BoxFit.cover,
                    ),
                    tag: widget.course.illustration,
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 42.0),
          child: Container(
            child: Hero(
              child: Image.asset('asset/logos/${widget.course.logo}'),
              tag: widget.course.logo,
            ),
            width: 60.0,
            height: 60.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18.0),
              boxShadow: [BoxShadow(color: kShadowColor, offset: Offset(0, 4), blurRadius: 16.0)],
            ),
            padding: EdgeInsets.all(12.0),
          ),
        ),
      ],
    );
  }
}
