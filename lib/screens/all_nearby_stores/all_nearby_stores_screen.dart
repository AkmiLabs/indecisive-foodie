import 'package:flutter/material.dart';
import 'package:indecisivefoodie/components/back_nav.dart';
import 'package:indecisivefoodie/components/small_header.dart';
import 'package:indecisivefoodie/models/resturants.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';
import '../../main.dart';

class AllNearbyStoresScreen extends StatelessWidget {
  final List<Resturants> nearbyResturants;
  AllNearbyStoresScreen({Key key, this.nearbyResturants}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    print(Provider.of<Data>(context).backgroundColor);
    return Scaffold(
      backgroundColor: Provider.of<Data>(context).backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackNav(),
                SmallHeader(
                  heading1: "",
                  heading2: "Stores Nearby",
                ),
                SizedBox(height: 30),
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: nearbyResturants.length,
                  itemBuilder: (context, i) {
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 4),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white70, width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        elevation: 20,
                        child: ListTile(
                          leading: Image.network(
                            nearbyResturants[i].icon,
                          ),
                          title: Text(nearbyResturants[i].name),
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
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            },
                          ),
                          subtitle: Text(nearbyResturants[i].vicinity),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
