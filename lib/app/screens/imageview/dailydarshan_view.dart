import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:junagadh_temple/app/views/bg_container.dart';
import 'package:junagadh_temple/app/views/network_image.dart';

class DailyDarshanView extends StatefulWidget {
  final String? url;

  const DailyDarshanView({Key? key, this.url}) : super(key: key);

  @override
  _DailyDarshanViewState createState() => _DailyDarshanViewState();
}

class _DailyDarshanViewState extends State<DailyDarshanView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text('Daily Darshan', style: kAuthTitleStyle),
      ),
      body: BgContainer(
        child: SafeArea(
            child: InteractiveViewer(
                minScale: 1,
                maxScale: 4,
                child: CustomNetWorkImage(
                  url: '${widget.url}',
                ),
            ),
        ),
      ),
    );
  }
}
