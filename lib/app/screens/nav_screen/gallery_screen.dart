import 'package:flutter/material.dart';
import 'package:junagadh_temple/app/providers/home_provider.dart';
import 'package:junagadh_temple/app/screens/imageview/image_view.dart';
import 'package:junagadh_temple/app/screens/notification/notification_screen.dart';
import 'package:junagadh_temple/app/screens/timing/timing_screen.dart';
import 'package:junagadh_temple/app/utils/constants.dart';
import 'package:junagadh_temple/app/utils/enums.dart';
import 'package:junagadh_temple/app/utils/no_data_found_view.dart';
import 'package:junagadh_temple/app/utils/sizer.dart';
import 'package:junagadh_temple/app/views/bg_container.dart';
import 'package:junagadh_temple/app/views/common_images.dart';
import 'package:junagadh_temple/app/views/loading_small.dart';
import 'package:junagadh_temple/app/views/network_image.dart';
import 'package:provider/provider.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      context.read<HomeProviderImpl>().getGallery();
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
        title: Text(
          'Gallery',
          style: kAuthTitleStyle,
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 4.w),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TimingScreen()));
              },
              child: Container(
                width: 5.w,
                height: 5.h,
                child: clockIconImage,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => NotificationScreen()));
              },
              child: Container(
                width: 5.w,
                height: 5.h,
                child: notificationImage,
              ),
            ),
          ),
        ],
      ),
      body: BgContainer(
        child: gallery(),
      ),
    );
  }

  Widget gallery() {
    final gallery = context.watch<HomeProviderImpl>();

    if (gallery.resGallery?.state == Status.LOADING) {
      return Center(child: LoadingSmall(color: kSecondary));
    }

    final hasError = gallery.resGallery?.state == Status.ERROR ||
        gallery.resGallery?.state == Status.UNAUTHORISED;

    if (hasError) {
      return Center(
          child: Container(
        child: NoDataFoundView(
            retryCall: () {
              context.read<HomeProviderImpl>().getGallery();
            },
            title: 'No Data Found'),
      ));
    }

    final data = gallery.resGallery?.data?.data;

    return Container(
      child: Padding(
        padding: EdgeInsets.all(5.w),
        child: GridView.builder(
          itemCount: data?.imageurl?.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 1.15,
              mainAxisSpacing: 4.w,
              crossAxisSpacing: 4.w),
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ImageViewScreen(
                    imgIndex: data?.imageurl,
                    index: index,
                  ),
                ));
              },
              child: CustomNetWorkImage(
                url: '${data?.imageurl?[index]}',
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
