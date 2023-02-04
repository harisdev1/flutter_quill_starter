import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class TextEditorScreen extends StatefulWidget {
  const TextEditorScreen({Key? key}) : super(key: key);

  @override
  State<TextEditorScreen> createState() => _TextEditorScreenState();
}

class _TextEditorScreenState extends State<TextEditorScreen> {
  QuillController quillController = QuillController.basic();

  Future<String?> uploadImageCallBack(File? file) async {
    if (file == null) return null;
    return file.path.toString();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            QuillToolbar.basic(
              controller: quillController,
              showVideoButton: false,
              onImagePickCallback: uploadImageCallBack,
            ),
            Expanded(
              child: QuillEditor.basic(
                controller: quillController,
                readOnly: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
