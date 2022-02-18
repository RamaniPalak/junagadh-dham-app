import 'package:dio/dio.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:junagadh/app/utils/constants.dart';
import 'package:junagadh/app/utils/sizer.dart';
import 'package:junagadh/app/views/bg_container.dart';
import 'package:junagadh/app/views/network_image.dart';
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

  bool isLoading = false;

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
         (isLoading == true) ? Padding(
           padding: const EdgeInsets.all(10),
           child: Center(child: SizedBox(
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

               final url = '${widget.imgIndex?[widget.index]}';
              //
              // final dir = await getTemporaryDirectory();
              //
              // final uri = Uri.parse(
              //     (dir.path) + '/' + Uri.parse(url).pathSegments.last);
              //
              // final list = dir.listSync();
              //
              // final isThere = list.where((element) => element.path == uri.path);
              //
              // print('isThere ${isThere}');
              //
              // if (isThere.isEmpty) {
              //   await Dio().downloadUri(Uri.parse(url), uri.path);
              //   Share.shareFiles([uri.path]);
              // } else {
              //   Share.shareFiles([uri.path]);
              // }

              final dir = await getTemporaryDirectory();

              final uri = Uri.parse(
                  (dir.path) + '/' + Uri.parse(url).pathSegments.last);

              final res = await getNetworkImageData(widget.imgIndex?[widget.index] ?? '',
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
