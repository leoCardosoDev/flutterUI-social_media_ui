import 'package:flutter/material.dart';
import 'package:socialmediaapp/data/data.dart';
import 'package:socialmediaapp/widget/custom_drawer.dart';
import 'package:socialmediaapp/widget/following_users.dart';
import 'package:socialmediaapp/widget/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    Color _primary = Theme.of(context).primaryColor;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: _primary,
        ),
        centerTitle: true,
        title: Text(
          'FRENESI',
          style: TextStyle(
            color: _primary,
            fontWeight: FontWeight.bold,
            letterSpacing: 10,
          ),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3.0,
          labelColor: _primary,
          labelStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          unselectedLabelStyle: TextStyle(fontSize: 16),
          tabs: <Widget>[
            Tab(
              text: 'Trending',
            ),
            Tab(
              text: 'Recentes',
            ),
          ],
        ),
      ),
      drawer: CustomDrawer(),
      body: ListView(
        children: <Widget>[
          FollowingUsers(),
          PostsCarousel(
            pageController: _pageController,
            title: 'Posts',
            posts: posts,
          ),
        ],
      ),
    );
  }
}
