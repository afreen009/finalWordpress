import 'package:flutter/material.dart';
import 'package:wordpress_flutter/tabs/first.dart';
class HomeTab extends StatefulWidget{
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 4,
      vsync: this,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 4,
        child: Center(
          child: Column(
            children: [
              Container(
                color: Colors.amber[300],
                child: TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.green,
                  // controller: _tabController,
                  tabs: <Widget>[
                    Tab(
                      child: Text(
                        'Festival',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.15),
                                offset: Offset(0, 5),
                                blurRadius: 10.0,
                              )
                            ]),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Insurance',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.15),
                                offset: Offset(0, 5),
                                blurRadius: 10.0,
                              )
                            ]),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Books',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.15),
                                offset: Offset(0, 5),
                                blurRadius: 10.0,
                              )
                            ]),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Engine junkies',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.15),
                                offset: Offset(0, 5),
                                blurRadius: 10.0,
                              )
                            ]),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  // color: Colors.white,
                  child: TabBarView(
                    children: [
                      First(),
                      First(),
                      First(),
                      First()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

