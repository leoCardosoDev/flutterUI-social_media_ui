import 'package:flutter/material.dart';
import 'package:socialmediaapp/data/data.dart';
import 'package:socialmediaapp/models/user_model.dart';

class FollowingUsers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   Color _primary = Theme.of(context).primaryColor;
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
     children: <Widget>[
      Padding(
       padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
       child: Text(
        'Seguindo',
        style: TextStyle(
         fontSize: 18,
         fontWeight: FontWeight.w600,
         letterSpacing: 2.0,
        ),
       ),
      ),
      Container(
       height: 80,
       child: ListView.builder(
        padding: EdgeInsets.only(left: 10),
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (context, index) {
         User user = users[index];
         return GestureDetector(
          onTap: (){},
          child: Container(
           margin: EdgeInsets.all(10),
           height: 60,
           width: 60,
           decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
             BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
             ),
            ],
            border: Border.all(width: 2, color: _primary),
           ),
           child: ClipOval(
            child: Image(
             height: 60,
             width: 60,
             image: AssetImage(user.profileImageUrl),
             fit: BoxFit.cover,
            ),
           ),
          ),
         );
        },
       ),
      ),
     ],
    );
  }
}
