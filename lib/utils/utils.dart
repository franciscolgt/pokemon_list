import 'package:flutter/material.dart';

class Utils {
  PreferredSizeWidget getAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      title: Container(
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
                ))),
            Text(
              'Pokemon List',
              style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.025),
            )
          ],
        ),
      ),
    );
  }
}
