import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vtb_hackathon/scor/scor_click.dart';
import 'package:vtb_hackathon/shared/showPopup.dart';

openLink(BuildContext context, String url) async {
  analitEventClick(TypeClick.Link);
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    showPopup(context, 'couldn\'t launch url');
  }
}
