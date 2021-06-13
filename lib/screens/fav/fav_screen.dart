import 'package:flutter/material.dart';
import 'package:indecisivefoodie/components/small_header.dart';
import 'package:line_icons/line_icons.dart';

class FavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SmallHeader(
                heading1: "Fav",
                heading2: "Resturants",
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 20,
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/food.png',
                    ),
                    title: Text("Burger Shop"),
                    trailing: IconButton(
                      icon: Icon(
                        LineIcons.heartAlt,
                        color: Colors.red,
                      ),
                      onPressed: () {},
                    ),
                    subtitle: Text("3.2 Km" + " . " + "Wolli Creek"),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 4),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.white70, width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 20,
                  child: ListTile(
                    leading: Image.asset(
                      'assets/images/ramen.png',
                    ),
                    title: Text("Burger Shop"),
                    trailing: IconButton(
                      icon: Icon(
                        LineIcons.heartAlt,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        final snackBar = SnackBar(
                          elevation: 20,
                          backgroundColor: Colors.black,
                          content: Text('Store Removed Successfully'),
                          action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {},
                          ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                    ),
                    subtitle: Text("3.2 Km"),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
