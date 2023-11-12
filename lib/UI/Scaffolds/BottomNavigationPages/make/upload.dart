// import 'dart:io';
//
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
//
// class Upload extends StatefulWidget {
//   const Upload({Key? key}) : super(key: key);
//
//   @override
//   State<Upload> createState() => _UploadState();
// }
//
// class _UploadState extends State<Upload> {
//
//   String ?fileName;
//   String ?data;
//
//   void _openFile(PlatformFile file) {
//     OpenFile.open(file.path);
//   }
//
//   Future<void> _read(String ?pathFile) async {
//     setState(() {
//       fileName = pathFile;
//     });
//     String text;
//     try {
//       // final Directory directory = await getApplicationDocumentsDirectory();
//       final File file = File(pathFile!);
//       text = await file.readAsString();
//       setState(() {
//         data = text;
//       });
//     }
//     catch (e) {
//       print("Couldn't read file");
//       setState(() {
//         data = "Couldn't read file\n${e.toString()}";
//       });
//     }
//   }
//
//   void _pickFile() async {
//     final result = await FilePicker.platform.pickFiles(allowMultiple: false);
//     if (result == null) return;
//     final file = result.files.first;
//     _read(file.path);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text("Please make sure for your file to be in .txt format and use the following writing format:"),
//               Image.asset("Assets/Images/logo.png"),
//               TextButton(
//                 onPressed: () => _pickFile(),
//                 child: Text("Fuck me nigga"),
//               ),
//               Text("path = $fileName"),
//               Text("data = $data"),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
