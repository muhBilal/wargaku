import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'media.dart';

class Customtextfilds {
  static Widget textField(
    Color textclr,
    Color hintclr,
    Color borderclr,
    String img,
    String hinttext,
    Color fillcolor, [
    TextEditingController? controller,
    bool passwordField = false,
  ]) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 18),
      child: Container(
        color: Colors.transparent,
        height: height / 15,
        child: TextField(
          controller: controller,
          autofocus: false,
          obscureText: passwordField,
          style: TextStyle(
            fontSize: height / 50,
            color: textclr,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: fillcolor,
            hintText: hinttext,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height / 100, horizontal: height / 70),
              child: Image.asset(
                img,
                height: height / 30,
              ),
            ),
            hintStyle: TextStyle(color: hintclr, fontSize: height / 60),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderclr),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.4),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  static Widget numericTextField(
    Color textclr,
    Color hintclr,
    Color borderclr,
    String img,
    String hinttext,
    Color fillcolor, [
    TextEditingController? controller,
  ]) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 18),
      child: Container(
        color: Colors.transparent,
        height: height / 15,
        child: TextField(
          controller: controller,
          keyboardType: TextInputType.number,
          // Numeric keyboard
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly, // Only numbers allowed
          ],
          autofocus: false,
          style: TextStyle(
            fontSize: height / 50,
            color: textclr,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: fillcolor,
            hintText: hinttext,
            prefixIcon: Padding(
              padding: EdgeInsets.symmetric(
                  vertical: height / 100, horizontal: height / 70),
              child: Image.asset(
                img,
                height: height / 30,
              ),
            ),
            hintStyle: TextStyle(color: hintclr, fontSize: height / 60),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderclr),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.4),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }

  static Widget dateInputField(
    Color textclr,
    Color hintclr,
    Color borderclr,
    String img,
    String hinttext,
    Color fillcolor, [
    TextEditingController? controller,
    BuildContext? context, // Pass context to show DatePicker
  ]) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        color: Colors.transparent,
        height: 60,
        child: GestureDetector(
          onTap: () async {
            // debugPrint("masuk");
            if (context != null) {
              // debugPrint("oke");

              DateTime? selectedDate = DateTime.now(); // Set default date
              await showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        SizedBox(
                          height: 250,
                          child: CalendarDatePicker(
                            initialDate: selectedDate!,
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                            onDateChanged: (DateTime date) {
                              selectedDate = date;
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context); // Cancel action
                              },
                              child: Text(
                                "Batal",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                if (selectedDate != null) {
                                  String formattedDate =
                                      DateFormat('yyyy-MM-dd')
                                          .format(selectedDate!);
                                  controller?.text = formattedDate;
                                }
                                Navigator.pop(context); // Confirm action
                              },
                              child: Text(
                                "OK",
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
          child: AbsorbPointer(
            child: TextField(
              controller: controller,
              style: TextStyle(
                fontSize: 18,
                color: textclr,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: fillcolor,
                hintText: hinttext,
                prefixIcon: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
                  child: Image.asset(
                    img,
                    height: 30,
                  ),
                ),
                hintStyle: TextStyle(color: hintclr, fontSize: 16),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: borderclr),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.withOpacity(0.4),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static Widget selectInputField(
    Color textclr,
    Color hintclr,
    Color borderclr,
    String hinttext,
    Color fillcolor,
    List<String> options, [
    String? selectedValue,
    ValueChanged<String?>? onChanged,
  ]) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width / 18),
      child: Container(
        color: Colors.transparent,
        height: height / 15,
        child: DropdownButtonFormField<String>(
          value: selectedValue,
          onChanged: onChanged,
          decoration: InputDecoration(
            filled: true,
            fillColor: fillcolor,
            hintText: hinttext,
            hintStyle: TextStyle(color: hintclr, fontSize: height / 60),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderclr),
              borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(0.4),
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(
                option,
                style: TextStyle(color: textclr),
              ),
            );
          }).toList(),
          style: TextStyle(
            fontSize: height / 50,
            color: textclr,
          ),
          isExpanded: true,
        ),
      ),
    );
  }
}
