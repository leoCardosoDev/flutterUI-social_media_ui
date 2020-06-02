import 'package:flutter/material.dart';
import 'package:socialmediaapp/models/user_model.dart';
import 'package:socialmediaapp/widget/custom_drawer.dart';
import 'package:socialmediaapp/widget/posts_carousel.dart';
import 'package:socialmediaapp/widget/profile_clipper.dart';

class ProfileScreen extends StatefulWidget {
  final User user;

  ProfileScreen({this.user});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  PageController _postsController;
  PageController _favoritesPageController;

  @override
  void initState() {
    super.initState();
    _postsController = PageController(initialPage: 0, viewportFraction: 0.8);
    _favoritesPageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: <Widget>[
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    image: AssetImage(
                      widget.user.backgroundImageUrl,
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    iconSize: 30,
                    color: Theme.of(context).primaryColor,
                    onPressed: () => _scaffoldKey.currentState.openDrawer(),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image(
                        height: 120,
                        width: 120,
                        fit: BoxFit.cover,
                        image: AssetImage(widget.user.profileImageUrl),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.user.name,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text(
                      'Seguindo',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      widget.user.following.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'Seguidores',
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.black54,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      widget.user.followers.toString(),
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            PostsCarousel(
              pageController: _postsController,
              title: 'Meus Posts',
              posts: widget.user.posts,
            ),
            PostsCarousel(
              pageController: _favoritesPageController,
              title: 'Meus Favoritos',
              posts: widget.user.favorites,
            ),
           SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
