import 'package:flutter/material.dart';

import 'package:ui_final/PostItem.dart';



class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);


  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
           leading:
           Icon(Icons.workspaces_filled,color: Colors.deepOrange,),
          // Container(
          //   width: 15,
          //   padding: EdgeInsets.symmetric(horizontal: 10),
          //   height: 15,
          //   child: Image.asset(
          //     "assets/user.png",
          //     // width: 5,
          //     //  height: 5,
          //   ),
          // ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search_outlined,
                  color: Colors.blueGrey[200],
                )),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Image.asset(
                  'assets/s.png',
                  color: Colors.blueGrey[200],
                  width: 20,
                  height: 20,
                ),
              ),
            )
          ],
        ),
        body: Column(

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                borderRadius: BorderRadius.circular(13),
                elevation: 1,
                color: Colors.white,
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(

                      // color: Colors.white,
                      // borderRadius: BorderRadius.circular(15),
                      ),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TabBar(
                      onTap: (i) => print(i),
                      controller: _tabController,
                      indicator: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(10)),
                      unselectedLabelColor: Colors.grey,
                      isScrollable: true,
                      tabs: [
                        Tab(
                          text: 'My Feed',
                        ),
                        Tab(text: 'Trending'),
                        Tab(text: 'Partners'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: TabBarView(controller: _tabController, children: [
                Container(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.vertical,
                    itemCount: 2,
                    itemBuilder: (_, int index) {
                      return PostItem(
                        img: 'assets/i.jpg',
                        dp: "assets/candle.jpg",
                        name: 'Haroon Bhatti',
                        text: 'Vitra Furnitures',
                        icon: Icon(Icons.more_vert),
                      );
                    },
                  ),
                ),
                Container(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.vertical,
                    itemCount: 2,
                    itemBuilder: (_, int index) {
                      return PostItem(
                        img: 'assets/i.jpg',
                        dp: "assets/candle.jpg",
                        name: 'Haroon Bhatti',
                        text: 'Vitra Furnitures',
                        icon: Icon(Icons.more_vert),
                      );
                    },
                  ),
                ),
                Container(
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.vertical,
                    itemCount: 2,
                    itemBuilder: (_, int index) {
                      return PostItem(
                        img: 'assets/i.jpg',
                        dp: "assets/candle.jpg",
                        name: 'Haroon Bhatti',
                        text: 'Vitra Furnitures',
                        icon: Icon(Icons.more_vert),
                      );
                    },
                  ),
                ),
              ]),
            )
          ],
        ),
        // body: TabBarView(
        //   controller: _tabController,
        //
        //   children: [
        //     FirstTab(),
        //   ],
        // ),

        bottomNavigationBar: Theme(
            data: ThemeData(),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.blueGrey,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_outlined,
                    ),
                    label: 'Feed'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore_outlined),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.perm_identity_outlined,
                    ),
                    label: 'People'),
              ],
              currentIndex: _selectedIndex,
              onTap: (int i) {
                setState(() {
                  _selectedIndex = i;
                });
              },
            )));
  }
}
