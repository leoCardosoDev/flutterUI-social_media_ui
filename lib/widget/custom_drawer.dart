import 'package:flutter/material.dart';
import 'package:socialmediaapp/data/data.dart';
import 'package:socialmediaapp/screens/home_screen.dart';
import 'package:socialmediaapp/screens/login_screen.dart';
import 'package:socialmediaapp/widget/drawer_options.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Image(
                height: 200,
                width: double.infinity,
                image: AssetImage(currentUser.backgroundImageUrl),
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 3, color: Theme.of(context).primaryColor),
                      ),
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(currentUser.profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 6),
                    Text(
                      currentUser.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          DrawerOptions(
            icon: Icon(Icons.dashboard),
            title: 'Home',
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => HomeScreen(),
              ),
            ),
          ),
          DrawerOptions(icon: Icon(Icons.chat), title: 'Chat', onTap: () {}),
          DrawerOptions(icon: Icon(Icons.location_on), title: 'Map', onTap: () {}),
          DrawerOptions(icon: Icon(Icons.account_circle), title: 'Meu Perfil', onTap: () {}),
          DrawerOptions(icon: Icon(Icons.settings), title: 'Configurações', onTap: () {}),
          Expanded(
            child: Align(
             alignment: FractionalOffset.bottomCenter,
              child: DrawerOptions(
                icon: Icon(Icons.directions_run),
                title: 'Sair',
                onTap: () => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LoginScreen(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
