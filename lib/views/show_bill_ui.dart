import 'dart:io';

import 'package:flutter/material.dart';

class ShowBillUI extends StatefulWidget {
  double? payTotal;
  File? imgFile;

  ShowBillUI({super.key, this.payTotal, this.imgFile});

  @override
  State<ShowBillUI> createState() => _ShowBillUIState();
}

class _ShowBillUIState extends State<ShowBillUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text('Show Bill'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                'Total: ${widget.payTotal} บาท',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Image.file(
                widget.imgFile!,
                height: 200,
              )
            ],
          ),
        ));
  }
}
