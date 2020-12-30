import 'package:flutter/material.dart';
import 'package:wordpress_flutter/widgets/featured_category_list.dart';
import 'package:wordpress_flutter/widgets/posts_list.dart';

import '../config.dart';
import 'listHeading.dart';

class First extends StatefulWidget {
  @override
  _FirstState createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListHeading(FEATURED_CATEGORY_TITLE, FEATURED_CATEGORY_ID),
                  Container(
                    height: 250.0,
                    child: FeaturedCategoryList(),
                  ),
                  ListHeading('Latest', 0),
                  Flexible(
                    fit: FlexFit.loose,
                    child: PostsList(),
                  ),
                ],
              ),
            ),
          );
  }
}