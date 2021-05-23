import 'package:flutter/material.dart';
import 'package:tsu_and_angel/styles/colors.dart';
import 'package:tsu_and_angel/styles/font_styles.dart';

class RsvpForm extends StatefulWidget {
  @override
  _RsvpFormState createState() => _RsvpFormState();
}

class _RsvpFormState extends State<RsvpForm> {
  GlobalKey _key = GlobalKey<FormState>();
  TextEditingController diet = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  String attending = '';
  String dietChoice = '';
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    focusNode = FocusScope.of(context);
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Form(
        key: _key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Will you be attending?',
              style: MyFonts.formQuestionText,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    (attending == 'Yes')
                        ? Icons.check_box_rounded
                        : Icons.check_box_outline_blank_rounded,
                    color: Palette.primary,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        attending = 'Yes';
                      },
                    );
                  },
                ),
                Text(
                  'Yes',
                  style: MyFonts.formInputText,
                ),
                SizedBox(width: 32.0),
                IconButton(
                  icon: Icon(
                    (attending == 'No')
                        ? Icons.check_box_rounded
                        : Icons.check_box_outline_blank_rounded,
                    color: Palette.primary,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        attending = 'No';
                      },
                    );
                  },
                ),
                Text(
                  'No',
                  style: MyFonts.formInputText,
                ),
              ],
            ),
            SizedBox(height: 32.0),
            showOrHideForm(attending),
            SizedBox(height: 32.0),
            (attending == '')
                ? Container()
                : ElevatedButton.icon(
                    icon: Icon(Icons.send_rounded),
                    style: ElevatedButton.styleFrom(
                      primary: Palette.primary,
                    ),
                    onPressed: () {},
                    label: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        'Reply',
                        style: MyFonts.replyButtonText,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Widget showOrHideForm(String attending) {
    switch (attending) {
      case 'Yes':
        return Column(
          children: <Widget>[
            Text(
              'Great! Do you have any dietary preferences?',
              style: MyFonts.formQuestionText,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    (dietChoice == 'No')
                        ? Icons.check_box_rounded
                        : Icons.check_box_outline_blank_rounded,
                    color: Palette.primary,
                  ),
                  onPressed: () {
                    setState(() {
                      dietChoice = 'No';
                    });
                    focusNode.unfocus();
                  },
                ),
                Text(
                  'No',
                  style: MyFonts.formInputText,
                ),
                SizedBox(width: 32.0),
                IconButton(
                  icon: Icon(
                    (dietChoice == 'Vegetarian')
                        ? Icons.check_box_rounded
                        : Icons.check_box_outline_blank_rounded,
                    color: Palette.primary,
                  ),
                  onPressed: () {
                    setState(() {
                      dietChoice = 'Vegetarian';
                    });
                    focusNode.unfocus();
                  },
                ),
                Text(
                  'Vegetarian',
                  style: MyFonts.formInputText,
                ),
                SizedBox(width: 32.0),
                IconButton(
                  icon: Icon(
                    (dietChoice == 'Other')
                        ? Icons.check_box_rounded
                        : Icons.check_box_outline_blank_rounded,
                    color: Palette.primary,
                  ),
                  onPressed: () {
                    setState(
                      () {
                        dietChoice = 'Other';
                      },
                    );
                  },
                ),
                Text(
                  'Other',
                  style: MyFonts.formInputText,
                ),
              ],
            ),
            Container(
              height: 40.0,
              width: 256.0,
              margin: const EdgeInsets.only(bottom: 8.0),
              child: TextField(
                cursorHeight: 24.0,
                controller: diet,
                cursorColor: Palette.primary,
                onTap: () {
                  setState(() {
                    dietChoice = 'Other';
                  });
                },
                maxLines: 3,
                style: MyFonts.formInputText,
                decoration: InputDecoration(
                  hintText: 'If other, please specify.',
                  hintStyle: TextStyle(color: Colors.grey),
                  isDense: true, // Added this
                  contentPadding: EdgeInsets.all(8),
                  focusColor: Palette.primary,
                ),
              ),
            ),
          ],
        );
      case 'No':
        return Container(
          child: Text(
            'We\'re sorry to hear that, if you change your mind, please update your RSVP before 14th July 2021',
            textAlign: TextAlign.center,
            style: MyFonts.sorryText,
          ),
        );
      default:
        return Container();
    }
  }
}
