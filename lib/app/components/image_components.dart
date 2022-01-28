import 'dart:io';
import 'dart:typed_data';

import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:junagadh_temple/app/utils/constants.dart';


// child:MaskedImage( mask: '', asset: '',)
// //CustomPaint(
// //   size: Size(100, (100*1.6103896103896105).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
// //   painter: RPSCustomPainter(),
// // ),

class MaskedImage extends StatelessWidget {
  final String asset;
  final String mask;

  MaskedImage({required this.asset, required this.mask});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return FutureBuilder<List>(
        future: _createShaderAndImage(asset, mask, constraints.maxWidth),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return const SizedBox.shrink();
          return Stack(
            children: [
              ShaderMask(
                blendMode: BlendMode.dstATop,
                shaderCallback: (rect) => snapshot.data?[0],
                child: snapshot.data?[1],
              ),
              CustomPaint(
                size: Size(constraints.maxWidth, (constraints.maxWidth*1.6503896103896105).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: RPSCustomPainter(),
              )
            ],
          );
        },
      );
    });
  }

  Future<List> _createShaderAndImage(String asset, String mask, double w) async {

    ByteData maskData = await rootBundle.load(mask);

    ui.Codec codec = await ui.instantiateImageCodec(maskData.buffer.asUint8List(), targetWidth: w.toInt(), targetHeight: (w*1.6503896103896105).toInt());
    ui.FrameInfo fi = await codec.getNextFrame();

    final _uri = Uri.parse(asset);

    var response = await Dio()
        .getUri(_uri, options: Options(responseType: ResponseType.bytes));
    final dataBytes = Uint8List.fromList(response.data);

    ImageShader shader = ImageShader(fi.image, TileMode.clamp, TileMode.clamp, Matrix4.identity().storage);
    Image image = Image.memory(dataBytes, fit: BoxFit.cover, width: w, height: (w*1.6503896103896105));

    return [shader, image];
  }
}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.5000162,size.height*0.9997863);
    path_0.cubicTo(size.width*0.4965175,size.height*0.9997863,size.width*0.4930182,size.height*0.9990968,size.width*0.4900805,size.height*0.9976774);
    path_0.cubicTo(size.width*0.4895851,size.height*0.9974516,size.width*0.4332039,size.height*0.9715444,size.width*0.3431182,size.height*0.9759234);
    path_0.cubicTo(size.width*0.2046396,size.height*0.9826815,size.width*0.1211896,size.height*0.9548548,size.width*0.1142247,size.height*0.8996210);
    path_0.cubicTo(size.width*0.1119468,size.height*0.8815363,size.width*0.1014825,size.height*0.8794677,size.width*0.08065260,size.height*0.8753387);
    path_0.cubicTo(size.width*0.04067734,size.height*0.8673911,size.width*0.004794929,size.height*0.8548347,size.width*0.004794929,size.height*0.7891694);
    path_0.lineTo(size.width*0.004794929,size.height*0.2105746);
    path_0.cubicTo(size.width*0.004794929,size.height*0.1449097,size.width*0.04067734,size.height*0.1323524,size.width*0.08065260,size.height*0.1244258);
    path_0.cubicTo(size.width*0.1014825,size.height*0.1202956,size.width*0.1119136,size.height*0.1182097,size.width*0.1142247,size.height*0.1001456);
    path_0.cubicTo(size.width*0.1212227,size.height*0.04493105,size.width*0.2047058,size.height*0.01712548,size.width*0.3431182,size.height*0.02384218);
    path_0.cubicTo(size.width*0.4331045,size.height*0.02822262,size.width*0.4895851,size.height*0.002315383,size.width*0.4901136,size.height*0.002065069);
    path_0.cubicTo(size.width*0.4959890,size.height*-0.0006883589,size.width*0.5040435,size.height*-0.0006883589,size.width*0.5098864,size.height*0.002065069);
    path_0.cubicTo(size.width*0.5107448,size.height*0.002461395,size.width*0.5670935,size.height*0.02822262,size.width*0.6568831,size.height*0.02384218);
    path_0.cubicTo(size.width*0.7953571,size.height*0.01708375,size.width*0.8788117,size.height*0.04491008,size.width*0.8857727,size.height*0.1001456);
    path_0.cubicTo(size.width*0.8880844,size.height*0.1182306,size.width*0.8985195,size.height*0.1202956,size.width*0.9193442,size.height*0.1244258);
    path_0.cubicTo(size.width*0.9593247,size.height*0.1323730,size.width*0.9952078,size.height*0.1449302,size.width*0.9952078,size.height*0.2105746);
    path_0.lineTo(size.width*0.9952078,size.height*0.7891694);
    path_0.cubicTo(size.width*0.9952078,size.height*0.8548347,size.width*0.9593247,size.height*0.8673911,size.width*0.9193442,size.height*0.8753387);
    path_0.cubicTo(size.width*0.8985195,size.height*0.8794677,size.width*0.8880844,size.height*0.8815565,size.width*0.8857727,size.height*0.8996411);
    path_0.cubicTo(size.width*0.8788117,size.height*0.9548548,size.width*0.7954286,size.height*0.9827016,size.width*0.6568831,size.height*0.9759234);
    path_0.cubicTo(size.width*0.5659714,size.height*0.9715000,size.width*0.5104481,size.height*0.9974274,size.width*0.5099195,size.height*0.9976774);
    path_0.cubicTo(size.width*0.5069818,size.height*0.9990766,size.width*0.5034825,size.height*0.9997863,size.width*0.4999838,size.height*0.9997863);
    path_0.lineTo(size.width*0.5000162,size.height*0.9997863);
    path_0.close();
    path_0.moveTo(size.width*0.3639149,size.height*0.9545645);
    path_0.cubicTo(size.width*0.4324110,size.height*0.9545645,size.width*0.4803091,size.height*0.9694556,size.width*0.5000162,size.height*0.9769234);
    path_0.cubicTo(size.width*0.5218695,size.height*0.9686411,size.width*0.5784162,size.height*0.9512056,size.width*0.6594545,size.height*0.9551452);
    path_0.cubicTo(size.width*0.7285779,size.height*0.9585040,size.width*0.8456364,size.height*0.9555444,size.width*0.8529286,size.height*0.8979919);
    path_0.cubicTo(size.width*0.8570260,size.height*0.8658911,size.width*0.8861039,size.height*0.8601129,size.width*0.9095130,size.height*0.8554597);
    path_0.cubicTo(size.width*0.9366429,size.height*0.8500806,size.width*0.9622597,size.height*0.8449879,size.width*0.9622597,size.height*0.7892097);
    path_0.lineTo(size.width*0.9622597,size.height*0.2106165);
    path_0.cubicTo(size.width*0.9622597,size.height*0.1548387,size.width*0.9366429,size.height*0.1497488,size.width*0.9095130,size.height*0.1443673);
    path_0.cubicTo(size.width*0.8861364,size.height*0.1397157,size.width*0.8570260,size.height*0.1339375,size.width*0.8529286,size.height*0.1018351);
    path_0.cubicTo(size.width*0.8456364,size.height*0.04426331,size.width*0.7285779,size.height*0.04132218,size.width*0.6594545,size.height*0.04468065);
    path_0.cubicTo(size.width*0.5785481,size.height*0.04860202,size.width*0.5219026,size.height*0.03118468,size.width*0.5000162,size.height*0.02290351);
    path_0.cubicTo(size.width*0.4781636,size.height*0.03118468,size.width*0.4215182,size.height*0.04866492,size.width*0.3406097,size.height*0.04468065);
    path_0.cubicTo(size.width*0.2714857,size.height*0.04132218,size.width*0.1544312,size.height*0.04426331,size.width*0.1471357,size.height*0.1018351);
    path_0.cubicTo(size.width*0.1430753,size.height*0.1339375,size.width*0.1139604,size.height*0.1397157,size.width*0.09055584,size.height*0.1443673);
    path_0.cubicTo(size.width*0.06342149,size.height*0.1497488,size.width*0.03780526,size.height*0.1548387,size.width*0.03780526,size.height*0.2106165);
    path_0.lineTo(size.width*0.03780526,size.height*0.7892097);
    path_0.cubicTo(size.width*0.03780526,size.height*0.8449879,size.width*0.06342149,size.height*0.8500806,size.width*0.09055584,size.height*0.8554597);
    path_0.cubicTo(size.width*0.1139604,size.height*0.8601129,size.width*0.1430753,size.height*0.8658911,size.width*0.1471357,size.height*0.8979919);
    path_0.cubicTo(size.width*0.1543981,size.height*0.9555444,size.width*0.2714857,size.height*0.9585040,size.width*0.3406097,size.height*0.9551452);
    path_0.cubicTo(size.width*0.3486312,size.height*0.9547500,size.width*0.3564214,size.height*0.9545847,size.width*0.3639481,size.height*0.9545847);
    path_0.lineTo(size.width*0.3639149,size.height*0.9545645);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xff9C0D06).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}


class CustomShapedImage extends StatelessWidget {
  const CustomShapedImage({Key? key, required this.width, required this.url}) : super(key: key);

  final double width;
  final String url;

  Future<ImageShader> _createShaderAndImage(double w) async {

    final img = await drawShapeImage(Size(width, width * 1.6503896103896105));

    ImageShader shader = ImageShader(img, TileMode.clamp, TileMode.clamp, Matrix4.identity().storage);

    return shader;
  }

  @override
  Widget build(BuildContext context) {

    final height = width * 1.6503896103896105;



    return FutureBuilder<ImageShader>(
      future: _createShaderAndImage(width),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();
        return SizedBox(

          width: width,
          height: height,
          child: Stack(
            fit: StackFit.expand,
            children: [

              SizedBox(
                width: width,
                height: height,
                child: ExtendedImage.network(url,
                  loadStateChanged: (ExtendedImageState state) {
                    switch (state.extendedImageLoadState) {
                      case LoadState.loading:
                      // TODO: Handle this case.
                        if(Platform.isAndroid){
                          return Center(child: SizedBox(height: 30,width: 30,child: CircularProgressIndicator(strokeWidth: 3,color: kSecondary,)),);
                        }else{
                          return const Center(child: SizedBox(height: 30,width: 30,child: CupertinoActivityIndicator(animating: true,)),);
                        }
                      case LoadState.completed:
                      // TODO: Handle this case.

                        return ShaderMask(
                            blendMode: BlendMode.dstATop,
                            shaderCallback: (rect) => snapshot.data!,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 1,right: 1,bottom: 1,top: 1),
                              child: ExtendedRawImage(
                                fit: BoxFit.fitHeight,
                                image: state.extendedImageInfo?.image,
                                width: width,
                                height: height,
                              ),
                            )
                        );
                        break;
                      case LoadState.failed:
                      // TODO: Handle this case.
                        return const Center(child: Text('No Image Found',textAlign: TextAlign.center,),);
                    }
                  },
                  fit: BoxFit.fitHeight,
                  cache: true,
                  beforePaintImage: (canvas, rect, image, paint) {
                    if (!rect.isEmpty) {
                      canvas.save();
                      // canvas.clipPath(clipShape(rect, canvas,Size(width, height)));

                    }
                    return false;
                  },
                ),
              ),
              CustomPaint(
                size: Size(width, (height).toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
                painter: RPSCustomPainter(),
              )
            ],
          ),
        );
      },
    );


  }

  Path clipShape(
      Rect rect,
      Canvas canvas,
      Size size
      ) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.4884569,size.height*0.9976774);
    path_0.cubicTo(size.width*0.4914144,size.height*0.9990968,size.width*0.4949366,size.height*0.9997863,size.width*0.4984582,size.height*0.9997863);
    path_0.lineTo(size.width*0.4984248,size.height*0.9997863);
    path_0.cubicTo(size.width*0.5019471,size.height*0.9997863,size.width*0.5054693,size.height*0.9990766,size.width*0.5084261,size.height*0.9976774);
    path_0.cubicTo(size.width*0.5089575,size.height*0.9974274,size.width*0.5648444,size.height*0.9715000,size.width*0.6563464,size.height*0.9759234);
    path_0.cubicTo(size.width*0.7957974,size.height*0.9827016,size.width*0.8797255,size.height*0.9548548,size.width*0.8867386,size.height*0.8996411);
    path_0.cubicTo(size.width*0.8890654,size.height*0.8815565,size.width*0.8995621,size.height*0.8794677,size.width*0.9205294,size.height*0.8753387);
    path_0.cubicTo(size.width*0.9607647,size.height*0.8673911,size.width*0.9968824,size.height*0.8548347,size.width*0.9968824,size.height*0.7891694);
    path_0.lineTo(size.width*0.9968824,size.height*0.2105746);
    path_0.cubicTo(size.width*0.9968824,size.height*0.1449302,size.width*0.9607647,size.height*0.1323730,size.width*0.9205294,size.height*0.1244258);
    path_0.lineTo(size.width*0.9205163,size.height*0.1244234);
    path_0.cubicTo(size.width*0.8995621,size.height*0.1202948,size.width*0.8890654,size.height*0.1182270,size.width*0.8867386,size.height*0.1001456);
    path_0.cubicTo(size.width*0.8797255,size.height*0.04491008,size.width*0.7957320,size.height*0.01708375,size.width*0.6563464,size.height*0.02384218);
    path_0.cubicTo(size.width*0.5659739,size.height*0.02822262,size.width*0.5092569,size.height*0.002461395,size.width*0.5083928,size.height*0.002065069);
    path_0.cubicTo(size.width*0.5025118,size.height*-0.0006883548,size.width*0.4944046,size.height*-0.0006883548,size.width*0.4884902,size.height*0.002065069);
    path_0.cubicTo(size.width*0.4879588,size.height*0.002315383,size.width*0.4311092,size.height*0.02822262,size.width*0.3405346,size.height*0.02384218);
    path_0.cubicTo(size.width*0.2012176,size.height*0.01712548,size.width*0.1171889,size.height*0.04493105,size.width*0.1101444,size.height*0.1001456);
    path_0.cubicTo(size.width*0.1078190,size.height*0.1182097,size.width*0.09731961,size.height*0.1202956,size.width*0.07635359,size.height*0.1244258);
    path_0.cubicTo(size.width*0.03611693,size.height*0.1323524,0,size.height*0.1449097,0,size.height*0.2105746);
    path_0.lineTo(0,size.height*0.7891694);
    path_0.cubicTo(0,size.height*0.8548347,size.width*0.03611693,size.height*0.8673911,size.width*0.07635359,size.height*0.8753387);
    path_0.lineTo(size.width*0.07638889,size.height*0.8753468);
    path_0.cubicTo(size.width*0.09733137,size.height*0.8794718,size.width*0.1078536,size.height*0.8815444,size.width*0.1101444,size.height*0.8996210);
    path_0.cubicTo(size.width*0.1171556,size.height*0.9548548,size.width*0.2011510,size.height*0.9826815,size.width*0.3405346,size.height*0.9759234);
    path_0.cubicTo(size.width*0.4312085,size.height*0.9715444,size.width*0.4879588,size.height*0.9974516,size.width*0.4884569,size.height*0.9976774);
    path_0.close();
    path_0.moveTo(size.width*0.5006431,size.height*0.02371210);
    path_0.cubicTo(size.width*0.4998804,size.height*0.02343415,size.width*0.4991523,size.height*0.02316431,size.width*0.4984582,size.height*0.02290351);
    path_0.cubicTo(size.width*0.4977529,size.height*0.02316907,size.width*0.4970118,size.height*0.02344411,size.width*0.4962346,size.height*0.02372762);
    path_0.cubicTo(size.width*0.4977039,size.height*0.02371782,size.width*0.4991739,size.height*0.02371262,size.width*0.5006431,size.height*0.02371210);
    path_0.close();
    path_0.moveTo(size.width*0.1558105,size.height*0.07697661);
    path_0.cubicTo(size.width*0.1634320,size.height*0.07102218,size.width*0.1720255,size.height*0.06557903,size.width*0.1814471,size.height*0.06073145);
    path_0.cubicTo(size.width*0.1711458,size.height*0.06505565,size.width*0.1623719,size.height*0.07040121,size.width*0.1558105,size.height*0.07697661);
    path_0.close();

    Path path_1 = Path();
    path_1.addPath(path_0, Offset(rect.left,rect.top));
    path_1.close();

    return path_1;
  }


   Future<ui.Image> drawShapeImage(
      Size size
      ) async{

    final recorder = ui.PictureRecorder();

    final canvas = Canvas(recorder);

    Path path_0 = Path();
    path_0.moveTo(size.width*0.4884569,size.height*0.9976774);
    path_0.cubicTo(size.width*0.4914144,size.height*0.9990968,size.width*0.4949366,size.height*0.9997863,size.width*0.4984582,size.height*0.9997863);
    path_0.lineTo(size.width*0.4984248,size.height*0.9997863);
    path_0.cubicTo(size.width*0.5019471,size.height*0.9997863,size.width*0.5054693,size.height*0.9990766,size.width*0.5084261,size.height*0.9976774);
    path_0.cubicTo(size.width*0.5089575,size.height*0.9974274,size.width*0.5648444,size.height*0.9715000,size.width*0.6563464,size.height*0.9759234);
    path_0.cubicTo(size.width*0.7957974,size.height*0.9827016,size.width*0.8797255,size.height*0.9548548,size.width*0.8867386,size.height*0.8996411);
    path_0.cubicTo(size.width*0.8890654,size.height*0.8815565,size.width*0.8995621,size.height*0.8794677,size.width*0.9205294,size.height*0.8753387);
    path_0.cubicTo(size.width*0.9607647,size.height*0.8673911,size.width*0.9968824,size.height*0.8548347,size.width*0.9968824,size.height*0.7891694);
    path_0.lineTo(size.width*0.9968824,size.height*0.2105746);
    path_0.cubicTo(size.width*0.9968824,size.height*0.1449302,size.width*0.9607647,size.height*0.1323730,size.width*0.9205294,size.height*0.1244258);
    path_0.lineTo(size.width*0.9205163,size.height*0.1244234);
    path_0.cubicTo(size.width*0.8995621,size.height*0.1202948,size.width*0.8890654,size.height*0.1182270,size.width*0.8867386,size.height*0.1001456);
    path_0.cubicTo(size.width*0.8797255,size.height*0.04491008,size.width*0.7957320,size.height*0.01708375,size.width*0.6563464,size.height*0.02384218);
    path_0.cubicTo(size.width*0.5659739,size.height*0.02822262,size.width*0.5092569,size.height*0.002461395,size.width*0.5083928,size.height*0.002065069);
    path_0.cubicTo(size.width*0.5025118,size.height*-0.0006883548,size.width*0.4944046,size.height*-0.0006883548,size.width*0.4884902,size.height*0.002065069);
    path_0.cubicTo(size.width*0.4879588,size.height*0.002315383,size.width*0.4311092,size.height*0.02822262,size.width*0.3405346,size.height*0.02384218);
    path_0.cubicTo(size.width*0.2012176,size.height*0.01712548,size.width*0.1171889,size.height*0.04493105,size.width*0.1101444,size.height*0.1001456);
    path_0.cubicTo(size.width*0.1078190,size.height*0.1182097,size.width*0.09731961,size.height*0.1202956,size.width*0.07635359,size.height*0.1244258);
    path_0.cubicTo(size.width*0.03611693,size.height*0.1323524,0,size.height*0.1449097,0,size.height*0.2105746);
    path_0.lineTo(0,size.height*0.7891694);
    path_0.cubicTo(0,size.height*0.8548347,size.width*0.03611693,size.height*0.8673911,size.width*0.07635359,size.height*0.8753387);
    path_0.lineTo(size.width*0.07638889,size.height*0.8753468);
    path_0.cubicTo(size.width*0.09733137,size.height*0.8794718,size.width*0.1078536,size.height*0.8815444,size.width*0.1101444,size.height*0.8996210);
    path_0.cubicTo(size.width*0.1171556,size.height*0.9548548,size.width*0.2011510,size.height*0.9826815,size.width*0.3405346,size.height*0.9759234);
    path_0.cubicTo(size.width*0.4312085,size.height*0.9715444,size.width*0.4879588,size.height*0.9974516,size.width*0.4884569,size.height*0.9976774);
    path_0.close();
    path_0.moveTo(size.width*0.5006431,size.height*0.02371210);
    path_0.cubicTo(size.width*0.4998804,size.height*0.02343415,size.width*0.4991523,size.height*0.02316431,size.width*0.4984582,size.height*0.02290351);
    path_0.cubicTo(size.width*0.4977529,size.height*0.02316907,size.width*0.4970118,size.height*0.02344411,size.width*0.4962346,size.height*0.02372762);
    path_0.cubicTo(size.width*0.4977039,size.height*0.02371782,size.width*0.4991739,size.height*0.02371262,size.width*0.5006431,size.height*0.02371210);
    path_0.close();
    path_0.moveTo(size.width*0.1558105,size.height*0.07697661);
    path_0.cubicTo(size.width*0.1634320,size.height*0.07102218,size.width*0.1720255,size.height*0.06557903,size.width*0.1814471,size.height*0.06073145);
    path_0.cubicTo(size.width*0.1711458,size.height*0.06505565,size.width*0.1623719,size.height*0.07040121,size.width*0.1558105,size.height*0.07697661);
    path_0.close();

    canvas.drawPath(path_0, Paint());

    final pic = recorder.endRecording();
    final img = await pic.toImage(size.width.toInt(), size.height.toInt());
    return img;
  }

}

//Copy this CustomPainter code to the Bottom of the File
class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Path path_0 = Path();
    path_0.moveTo(size.width*0.4983913,size.height*0.9986643);
    path_0.cubicTo(size.width*0.4948701,size.height*0.9986643,size.width*0.4913484,size.height*0.9979783,size.width*0.4883918,size.height*0.9965596);
    path_0.cubicTo(size.width*0.4878935,size.height*0.9963321,size.width*0.4311511,size.height*0.9704549,size.width*0.3404891,size.height*0.9748303);
    path_0.cubicTo(size.width*0.2011239,size.height*0.9815812,size.width*0.1171397,size.height*0.9537834,size.width*0.1101299,size.height*0.8986101);
    path_0.cubicTo(size.width*0.1078375,size.height*0.8805451,size.width*0.09730652,size.height*0.8784838,size.width*0.07634348,size.height*0.8743574);
    path_0.cubicTo(size.width*0.03611207,size.height*0.8664188,0,size.height*0.8538773,0,size.height*0.7882852);
    path_0.lineTo(0,size.height*0.2103386);
    path_0.cubicTo(0,size.height*0.1447473,size.width*0.03611207,size.height*0.1322040,size.width*0.07634348,size.height*0.1242863);
    path_0.cubicTo(size.width*0.09730652,size.height*0.1201606,size.width*0.1078043,size.height*0.1180773,size.width*0.1101299,size.height*0.1000332);
    path_0.cubicTo(size.width*0.1171728,size.height*0.04488051,size.width*0.2011908,size.height*0.01710628,size.width*0.3404891,size.height*0.02381545);
    path_0.cubicTo(size.width*0.4310511,size.height*0.02819101,size.width*0.4878935,size.height*0.002312787,size.width*0.4884250,size.height*0.002062755);
    path_0.cubicTo(size.width*0.4943386,size.height*-0.0006875848,size.width*0.5024446,size.height*-0.0006875848,size.width*0.5083250,size.height*0.002062755);
    path_0.cubicTo(size.width*0.5091886,size.height*0.002458639,size.width*0.5658967,size.height*0.02819101,size.width*0.6562609,size.height*0.02381545);
    path_0.cubicTo(size.width*0.7956250,size.height*0.01706462,size.width*0.8796087,size.height*0.04485957,size.width*0.8866196,size.height*0.1000332);
    path_0.cubicTo(size.width*0.8889457,size.height*0.1180978,size.width*0.8994457,size.height*0.1201606,size.width*0.9204076,size.height*0.1242863);
    path_0.cubicTo(size.width*0.9606359,size.height*0.1322249,size.width*0.9967500,size.height*0.1447679,size.width*0.9967500,size.height*0.2103386);
    path_0.lineTo(size.width*0.9967500,size.height*0.7882852);
    path_0.cubicTo(size.width*0.9967500,size.height*0.8538773,size.width*0.9606359,size.height*0.8664188,size.width*0.9204076,size.height*0.8743574);
    path_0.cubicTo(size.width*0.8994457,size.height*0.8784838,size.width*0.8889457,size.height*0.8805668,size.width*0.8866196,size.height*0.8986318);
    path_0.cubicTo(size.width*0.8796087,size.height*0.9537834,size.width*0.7956902,size.height*0.9815993,size.width*0.6562609,size.height*0.9748303);
    path_0.cubicTo(size.width*0.5647663,size.height*0.9704116,size.width*0.5088897,size.height*0.9963105,size.width*0.5083582,size.height*0.9965596);
    path_0.cubicTo(size.width*0.5054011,size.height*0.9979567,size.width*0.5018799,size.height*0.9986643,size.width*0.4983582,size.height*0.9986643);
    path_0.lineTo(size.width*0.4983913,size.height*0.9986643);
    path_0.close();
    path_0.moveTo(size.width*0.3614185,size.height*0.9534946);
    path_0.cubicTo(size.width*0.4303538,size.height*0.9534946,size.width*0.4785582,size.height*0.9683682,size.width*0.4983913,size.height*0.9758303);
    path_0.cubicTo(size.width*0.5203842,size.height*0.9675560,size.width*0.5772935,size.height*0.9501372,size.width*0.6588533,size.height*0.9540758);
    path_0.cubicTo(size.width*0.7284185,size.height*0.9574296,size.width*0.8462228,size.height*0.9544729,size.width*0.8535652,size.height*0.8969856);
    path_0.cubicTo(size.width*0.8576848,size.height*0.8649206,size.width*0.8869511,size.height*0.8591480,size.width*0.9105054,size.height*0.8545018);
    path_0.cubicTo(size.width*0.9378152,size.height*0.8491264,size.width*0.9635924,size.height*0.8440433,size.width*0.9635924,size.height*0.7883285);
    path_0.lineTo(size.width*0.9635924,size.height*0.2103801);
    path_0.cubicTo(size.width*0.9635924,size.height*0.1546650,size.width*0.9378152,size.height*0.1495809,size.width*0.9105054,size.height*0.1442054);
    path_0.cubicTo(size.width*0.8869837,size.height*0.1395588,size.width*0.8576848,size.height*0.1337874,size.width*0.8535652,size.height*0.1017209);
    path_0.cubicTo(size.width*0.8462228,size.height*0.04421372,size.width*0.7284185,size.height*0.04127581,size.width*0.6588533,size.height*0.04463069);
    path_0.cubicTo(size.width*0.5774239,size.height*0.04854765,size.width*0.5204174,size.height*0.03114971,size.width*0.4983913,size.height*0.02287783);
    path_0.cubicTo(size.width*0.4763989,size.height*0.03114971,size.width*0.4193902,size.height*0.04861011,size.width*0.3379641,size.height*0.04463069);
    path_0.cubicTo(size.width*0.2683978,size.height*0.04127581,size.width*0.1505940,size.height*0.04421372,size.width*0.1432522,size.height*0.1017209);
    path_0.cubicTo(size.width*0.1391658,size.height*0.1337874,size.width*0.1098641,size.height*0.1395588,size.width*0.08630978,size.height*0.1442054);
    path_0.cubicTo(size.width*0.05900163,size.height*0.1495809,size.width*0.03322168,size.height*0.1546650,size.width*0.03322168,size.height*0.2103801);
    path_0.lineTo(size.width*0.03322168,size.height*0.7883285);
    path_0.cubicTo(size.width*0.03322168,size.height*0.8440433,size.width*0.05900163,size.height*0.8491264,size.width*0.08630978,size.height*0.8545018);
    path_0.cubicTo(size.width*0.1098641,size.height*0.8591480,size.width*0.1391658,size.height*0.8649206,size.width*0.1432522,size.height*0.8969856);
    path_0.cubicTo(size.width*0.1505609,size.height*0.9544729,size.width*0.2683978,size.height*0.9574296,size.width*0.3379641,size.height*0.9540758);
    path_0.cubicTo(size.width*0.3460370,size.height*0.9536823,size.width*0.3538772,size.height*0.9535126,size.width*0.3614516,size.height*0.9535126);
    path_0.lineTo(size.width*0.3614185,size.height*0.9534946);
    path_0.close();

    Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
    paint_0_fill.color = Color(0xff9C0D06).withOpacity(1.0);
    canvas.drawPath(path_0,paint_0_fill);

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}