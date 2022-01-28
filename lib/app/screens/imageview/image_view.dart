import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:junagadh_temple/app/utils/sizer.dart';
import 'package:junagadh_temple/app/views/bg_container.dart';
import 'package:junagadh_temple/app/views/network_image.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class ImageViewScreen extends StatefulWidget {
  final List<String>? imgIndex;
  int index;

  ImageViewScreen({Key? key, this.imgIndex, required this.index})
      : super(key: key);

  @override
  _ImageViewScreenState createState() => _ImageViewScreenState();
}

class _ImageViewScreenState extends State<ImageViewScreen> {
  PageController? _pageController;

  void _pageChanged(int index) {
    setState(() {
      widget.index = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _pageController = PageController(initialPage: widget.index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        centerTitle: true,
        title: Text('Gallery', style: kAuthTitleStyle),
        actions: [
          InkWell(
            onTap: () async {
              final url = '${widget.imgIndex?[widget.index]}';

              final dir = await getTemporaryDirectory();

              final uri = Uri.parse(
                  (dir.path) + '/' + Uri.parse(url).pathSegments.last);

              final list = dir.listSync();

              final isThere = list.where((element) => element.path == uri.path);

              print('isThere ${isThere}');

              if (isThere.isEmpty) {
                await Dio().downloadUri(Uri.parse(url), uri.path);
                Share.shareFiles([uri.path]);
              } else {
                Share.shareFiles([uri.path]);
              }
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
            child: PageView.builder(
          onPageChanged: _pageChanged,
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          itemCount: widget.imgIndex?.length,
          itemBuilder: (BuildContext context, int index) {
            // AA vastu image ni url ma vapr vani
            return InteractiveViewer(
              minScale: 1,
              maxScale: 4,
              child: CustomNetWorkImage(
                url: '${widget.imgIndex?[index]}',
                fit: BoxFit.fitWidth,
              ),
            );
          },
        )),
      ),
    );
  }
}
