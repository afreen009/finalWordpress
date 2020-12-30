import 'package:flutter/material.dart';
import 'package:wordpress_flutter/widgets/post_card.dart';
import 'package:wordpress_flutter/widgets/post_container.dart';

import '../config.dart';
import '../model/post_entity.dart';
import '../network/wp_api.dart';
import 'overlayed_container.dart';
import 'postscreen.dart';
import 'post_container.dart';

class FeaturedCategoryList extends StatefulWidget {
  @override
  _FeaturedCategoryListState createState() => _FeaturedCategoryListState();
}

class _FeaturedCategoryListState extends State<FeaturedCategoryList> with AutomaticKeepAliveClientMixin {
  List<PostEntity> posts = new List<PostEntity>();
  bool isLoading = true;
  var data = fetchData();
  @override
  void initState() {
    super.initState();
    WpApi.getPostsList(category: FEATURED_CATEGORY_ID).then((_posts) {
      setState(() {
        isLoading = false;
        posts.addAll(_posts);
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder<List>(
        future: fetchData(),
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Scaffold(
              body: Center(
                child: Text("Error"),
              ),
            );
          if (snapshot.hasData) {
            
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: Text(
                  "Cybdom Blog",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.black),
                ),
                // actions: <Widget>[
                //   Padding(
                //     padding: const EdgeInsets.all(9.0),
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(9),
                //       child: Image.network(
                //         "${snapshot.data[0].avatarURL}",
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   )
                // ],
              ),
              body: ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
//            physics: ClampingScrollPhysics(),
            itemBuilder: (context, index) {
              Map wpPost = snapshot.data[index];
              var media = wpPost['_embedded']["wp:featuredmedia"];
              var imageUrl = wpPost['_embedded']["wp:featuredmedia"][0]['source_url'];
              print(wpPost[index]);
              return PostCard(wpPost[index],imageUrl, isFeaturedList: true);
            },)
          );
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
//   @override
//   Widget build(BuildContext context) {
//     super.build(context);
//     return isLoading
//         ? Center(
//             child: CircularProgressIndicator(),
//           )
//         : ListView.builder(
//             itemCount: posts?.length ?? 0,
//             scrollDirection: Axis.horizontal,
//             shrinkWrap: true,
// //            physics: ClampingScrollPhysics(),
//             itemBuilder: (context, index) {
//               return PostCard(posts[index], isFeaturedList: true);
//             },
//           );
//   }

  @override
  bool get wantKeepAlive => true;
}
