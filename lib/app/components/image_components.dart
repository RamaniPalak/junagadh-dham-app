import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';


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
class RPSCustomPainter extends CustomPainter {
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