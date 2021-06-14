import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:indecisivefoodie/components/back_nav.dart';
import 'package:indecisivefoodie/screens/about_app/components/terms_and_privacy.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BackNav(),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 65, 0, 8),
                  alignment: Alignment.center,
                  child: Text(
                    'Indecisive Foodie',
                    style: Theme.of(context).textTheme.headline6,
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
                          child: Text("Privacy Policy"),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => TermsAndPrivacy(
                                        headerText: "Privacy Policy",
                                        htmlPath: 'assets/html/privacy.html',
                                      )),
                            );
                          }),
                      OutlinedButton(
                        child: Text("Terms & Conditions"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => TermsAndPrivacy(
                                      headerText: "Terms & Conditions",
                                      htmlPath: 'assets/html/terms.html',
                                    )),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Card(
                  margin: EdgeInsets.fromLTRB(8, 10, 8, 16),
                  child: ExpansionTile(
                    title: Text("Disclaimer"),
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(16, 0, 16, 16),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                              'The content of this app is accurate, however, may contain information from third parties. We are not able to review all the content provided in the study material hence we do not warrant, endorse, gurantee, or assume responsibility for the accuracy or reliability of any information offered. If you find any errors or inappropriate content, please report it to us and we will correct it as soon as possible.',
                              style: Theme.of(context).textTheme.bodyText2,
                              textAlign: TextAlign.justify),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
