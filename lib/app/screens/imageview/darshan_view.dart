import 'dart:io';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:junagadh_temple/app/utils/sizer.dart';
import 'package:junagadh_temple/app/views/bg_container.dart';
import 'package:junagadh_temple/app/views/network_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class DarshanView extends StatefulWidget {
  final String? url;

  const DarshanView({Key? key, this.url}) : super(key: key);

  @override
  _DarshanViewState createState() => _DarshanViewState();
}

class _DarshanViewState extends State<DarshanView> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text('Daily Darshan', style: kAuthTitleStyle),
        actions: [
          (isLoading == true)
              ? Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                      child: SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(
                      color: kWhite,
                    ),
                  )),
                )
              : InkWell(
                  onTap: () async {
                    setState(() {
                      isLoading = true;
                    });

                    final url = '${widget.url}';

                    final dir = await getTemporaryDirectory();

                    final uri = Uri.parse(
                        (dir.path) + '/' + Uri.parse(url).pathSegments.last);

                    final res = await getNetworkImageData(widget.url ?? '',
                        useCache: true);

                    final file = File(uri.path);

                    file.writeAsBytes(res!).then((value) {
                      Share.shareFiles([uri.path]);
                    });

                    setState(() {
                      isLoading = false;
                    });
                  },
                  child: Container(
                    width: 13.w,
                    padding: EdgeInsets.only(right: 10.w),
                    child: const Icon(
                      Icons.share,
                      color: Colors.white,
                    ),
                  ),
                )
        ],
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
