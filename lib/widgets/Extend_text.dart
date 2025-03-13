// ignore_for_file: file_names

import 'package:bug/constants.dart';
import 'package:flutter/material.dart';

class ExtendeText extends StatefulWidget {
  final String text;
  const ExtendeText({super.key, required this.text});

  @override
  State<ExtendeText> createState() => _ExtendeTextState();
}

class _ExtendeTextState extends State<ExtendeText> {
  late String firsttext;
  late String secondtext;
  double textheight = 94.0;

  bool hiddentext = true;

  @override
  void initState() {
    if (widget.text.length > textheight) {
      firsttext = widget.text.substring(0, textheight.toInt());
      secondtext =
          widget.text.substring(textheight.toInt() + 1, widget.text.length);
    } else {
      firsttext = widget.text;
      secondtext = "";
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: secondtext.isEmpty
            ? Medtext(text: firsttext)
            : Column(
                children: [
                  Medtext(
                      textcolor: Colors.grey.shade700,
                      text: hiddentext
                          ? ("$firsttext...")
                          : (firsttext + secondtext)),
                  InkWell(
                    onTap: () {
                      setState(() {
                        hiddentext = !hiddentext;
                      });
                    },
                    child: Row(
                      children: [
                        Medtext(
                          text: hiddentext ? "Show more" : "Show less",
                          textcolor: Mycolors.primarycolor,
                        ),
                        Icon(
                          hiddentext
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: Mycolors.primarycolor,
                        )
                      ],
                    ),
                  )
                ],
              ));
  }
}
