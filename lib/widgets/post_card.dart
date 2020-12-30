import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:html/parser.dart';

// import '../model/post_entity.dart';
import '../pages/post_details.dart';
import '../widgets/helpers.dart';

class PostCard extends StatelessWidget {
  final post;
  bool isFeaturedList;
  String imageUrl;
  PostCard(this.post,this.imageUrl, {this.isFeaturedList = false});
  
  @override
  Widget build(BuildContext context) {
    var media = post['excerpt']["rendered"];
    List image = [];
    print('here $post');
    image.add(imageUrl);
    print('list $image');
    Size size = MediaQuery.of(context).size;
    double width = isFeaturedList ? size.width * 0.8 : size.width;
    return GestureDetector(
      onTap: () {
        if (isFeaturedList) Navigator.push(context, MaterialPageRoute(builder: (context) => PostDetails(post)));
      },
      child: Padding(
        padding: EdgeInsets.all(isFeaturedList ? 10.0 : 5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(isFeaturedList ? 14.0 : 0.0),
          child: Material(
            elevation: 14.0,
            borderRadius: BorderRadius.circular(10.0),
            shadowColor: Theme.of(context).primaryColor.withOpacity(.5),
            child: SizedBox(
              height: 200.0,
              width: width,
              child: Stack(
                children: <Widget>[
                  imageUrl.runtimeType == String ?
                  Hero(
                    tag: imageUrl,
                    child: CachedImage(
                      imageUrl,
                      width: width,
                      height: size.height,
                    ),
                  ): Text('no Image'),
                  Positioned(
                    right: 0,
                    child: CategoryPill(post: post),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [Colors.black, Colors.transparent])),
                      width: width,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15.0, bottom: 5.0, left: 5.0, right: 5.0),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                parse((media).toString()).documentElement.text,
                                textAlign: TextAlign.left,
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18.0),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: Hero(tag: '', child: Author(post: post)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryPill extends StatelessWidget {
  const CategoryPill({
    Key key,
    @required this.post,
  }) : super(key: key);

  final  post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5.0),
      child: Opacity(
        opacity: 0.8,
        child: MaterialButton(
          height: 26.0,
          onPressed: () {},
          color: Theme.of(context).primaryColor,
          child: Text('Festival',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
              )),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        ),
      ),
    );
  }
}

class Author extends StatelessWidget {
  const Author({
    Key key,
    @required this.post,
  }) : super(key: key);

  final  post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            // child: Image.network(
            //   post.extra.author[0].avatar,
            //   height: 26.0,
            // ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              post['slug'],
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
                shadows: <Shadow>[
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 5.0,
                    color: Colors.black,
                  ),
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 8.0,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
