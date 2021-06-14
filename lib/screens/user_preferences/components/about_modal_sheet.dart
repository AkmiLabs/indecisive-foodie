import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:url_launcher/url_launcher.dart';

void aboutModalSheet(BuildContext context) {
  showModalBottomSheet(
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20), topLeft: Radius.circular(20)),
      ),
      context: context,
      builder: (context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  alignment: Alignment.center,
                  height: 4,
                  width: 25,
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 30, 0, 8),
              alignment: Alignment.center,
              child: Text(
                'Indecisive Foodie',
                style: TextStyle(
                    fontSize: 35,
                    color: Colors.black,
                    fontFamily: "Barriecito-Regular"),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
              alignment: Alignment.center,
              child: Text(
                'Version 1.0.3',
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
              child: SelectableLinkify(
                onOpen: (link) async {
                  if (await canLaunch(link.url)) {
                    await launch(link.url);
                  } else {
                    throw 'Could not launch $link';
                  }
                },
                text: "www.indecisivefoodie.app",
                style: Theme.of(context).textTheme.bodyText1,
                options: LinkifyOptions(humanize: false),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 16),
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor: Colors.black,
                radius: 40,
              ),
            ),
            Center(
              child: Text(
                "Copyright © 2020 Indecisive Foodie. All rights reserved.\nDeveloped at Akmi Labs",
                style: Theme.of(context).textTheme.bodyText2,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //       builder: (_) => TermsAndPrivacy(
                        //             headerText: "Privacy Policy",
                        //             htmlPath: 'assets/html/privacy.html',
                        //           )),
                        // );
                      }),
                  OutlinedButton(
                    child: Text(
                      "Terms & Conditions",
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (_) => TermsAndPrivacy(
                      //             headerText: "Terms & Conditions",
                      //             htmlPath: 'assets/html/terms.html',
                      //           )),
                      // );
                    },
                  ),
                ],
              ),
            ),
          ],
        );
      });
}
