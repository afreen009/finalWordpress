import 'package:flutter/material.dart';
import 'package:wordpress_flutter/widgets/featured_category_list.dart';
import 'package:wordpress_flutter/widgets/posts_list.dart';

import '../config.dart';
import 'listHeading.dart';

class BookWorms extends StatefulWidget {
  @override
  _BookWormsState createState() => _BookWormsState();
}

class _BookWormsState extends State<BookWorms> {
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
                    child: FeaturedCategoryList('https://bookworms99.com/'),
                  ),
                  ListHeading('Latest', 0),
                  Flexible(
                    fit: FlexFit.loose,
                    child: PostsList(baseurl:'https://bookworms99.com/'),
                  ),
                ],
              ),
            ),
          );
  }
}