import 'package:flutter/material.dart';

class Utils{

  PreferredSizeWidget getAppBar(BuildContext context){
    return AppBar(
      //backgroundColor: appBarColor,
      elevation: 0,
      title: Container(
        //color: appBarColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.08,
              width: MediaQuery.of(context).size.width * 0.08,
              margin: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/appIcon/pokeball.png'),
                )
              )
            ),
            Text(
              'Pokemon List',
              style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.025),
            )
          ],
        ),
      ),
    );
  }
}