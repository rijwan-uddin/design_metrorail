// import 'package:flutter/material.dart';
// import 'package:design_metrorail/mrtcard.dart';
//
// class PassCard extends StatelessWidget {
//   final String name;
//   final String dob;
//   final String nid;
//   final String phone;
//
//   PassCard(this.name, this.dob, this.nid, this.phone);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Metro Rail PassCard'),
//       ),
//       body: Center(
//         child: SizedBox(
//           width: 350, // Adjust the width as needed
//           height: 200, // Adjust the height as needed
//           child: Card(
//             elevation: 15, // Elevation added here
//             color: Colors.black, // Color set to black
//             // Define the shape of the card
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//             clipBehavior: Clip.antiAliasWithSaveLayer,
//
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.all(15),
//                   child: Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: <Widget>[
//                       Image.asset(
//                         'asset/card.png',
//                         height: 70,
//                         width: 70,
//                         fit: BoxFit.cover,
//                       ),
//                       const SizedBox(width: 20),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             const SizedBox(height: 5),
//                             const Text(
//                               "Metro Rail PassCard",
//                               style: TextStyle(
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.white,
//                               ),
//                             ),
//                             const SizedBox(height: 5),
//                             // Add a subtitle widget
//                             Text(
//                               "Valid Until: 2025",
//                               style: TextStyle(
//                                 fontSize: 14, // Adjust subtitle font size
//                                 color: Colors.grey[500],
//                               ),
//                             ),
//                             const SizedBox(height: 10),
//
//                             Text(
//                               "Name: $name\nDate of Birth: $dob\nNID Number: $nid\nPhone Number: $phone",
//                               style: const TextStyle(
//                                 fontSize: 14,
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:io'; // Import dart:io for File class
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';

class PassCard extends StatelessWidget {
  final String name;
  final String dob;
  final String nid;
  final String phone;
  final GlobalKey _globalKey = GlobalKey();

  PassCard(this.name, this.dob, this.nid, this.phone);

  Future<void> _captureAndDownload() async {
    try {
      RenderRepaintBoundary boundary =
      _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 3.0);
      ByteData? byteData =
      await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        Uint8List pngBytes = byteData.buffer.asUint8List();
        final directory = await getTemporaryDirectory();
        final filePath = '${directory.path}/metro_pass_card.png';
        final file = await File(filePath).writeAsBytes(pngBytes);
        final taskId = await FlutterDownloader.enqueue(
          url: 'file://${file.path}',
          savedDir: directory.path,
          fileName: 'metro_pass_card.png',
          showNotification: true,
          openFileFromNotification: true,
        );
        print('Downloaded with taskId: $taskId');
      } else {
        print('Error: ByteData is null');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metro Rail PassCard'),
      ),
      body: Center(
        child: RepaintBoundary(
          key: _globalKey,
          child: SizedBox(
            width: 350, // Adjust the width as needed
            height: 200, // Adjust the height as needed
            child: Card(
              elevation: 15, // Elevation added here
              color: Colors.black, // Color set to black
              // Define the shape of the card
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(
                          'asset/card.png',
                          height: 70,
                          width: 70,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const SizedBox(height: 5),
                              const Text(
                                "Metro Rail PassCard",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 5),
                              // Add a subtitle widget
                              Text(
                                "Valid Until: 2025",
                                style: TextStyle(
                                  fontSize: 14, // Adjust subtitle font size
                                  color: Colors.grey[500],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "Name: $name\nDate of Birth: $dob\nNID Number: $nid\nPhone Number: $phone",
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _captureAndDownload();
        },
        tooltip: 'Download',
        child: Icon(Icons.download),
      ),
    );
  }
}




