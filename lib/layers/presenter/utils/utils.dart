import 'package:flutter/material.dart';

class Utils {
  static const assetLogo = "assets/images/logo.png";
}
const greenDark = Color.fromARGB(255, 13, 107, 130);
const greenLight = Color.fromARGB(255, 15, 152, 187);
const greenUltraLight = Color.fromARGB(255, 33, 233, 243);
String reverse(String value) {
  var valueReverse = "";
  var valueLength = value.length - 1;
  for (var index = 0; index < value.length; index++) {
    valueReverse += value[valueLength];
    valueLength--;
  }

  return valueReverse;
}

String separatorMoney(String valueMain, [String unitSep = "."]) {
  var value = reverse(valueMain);
  List<String> orderIndex = [];
  var newValue = "";
  for (int index = 0; index < value.length + 1; index++) {
    orderIndex.add("");
  }
  for (var index = 0; index < value.length; index++) {
    orderIndex[index + 1] = value[index];
  }

  for (var index = 1; index < orderIndex.length; index++) {
    if (index % 3 == 0 && orderIndex.length > 4) {
      if ((index + 1) == orderIndex.length) {
        newValue += orderIndex[index];
      } else {
        newValue += orderIndex[index] + unitSep;
      }
    } else {
      newValue += orderIndex[index];
    }
  }

  return reverse(newValue);
}

String separator(String value) {
  if (value.length > 3) {
    String newValue = "";

    for (int letter = 0; letter < value.length; letter++) {
      if (letter == 0 && value.length == 4 ||
          letter == 0 && value.length == 7) {
        newValue = newValue + value[letter] + ".";
      } else if (letter == 2 && value.length == 5) {
        newValue = newValue + "." + value[letter];
      } else if (letter == 3 && value.length == 6) {
        newValue = newValue + "." + value[letter];
      } else if (letter == 4 && value.length == 7) {
        newValue = newValue + "." + value[letter];
      } else {
        newValue = newValue + value[letter];
      }
    }
    return newValue;
  }
  return value;
}

Future<void> showResultCustom(BuildContext context, String valueResult,
    {bool isError = false, Color? color, Function? action}) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: isError ? Colors.red : color,
        content: Text(
          valueResult,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: color != null
                ? Colors.white
                : isError
                    ? Colors.white
                    : Colors.black,
          ),
        ),
        actions: [
          TextButton(
            child: Text(
              "Ok",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: color != null
                    ? Colors.white
                    : isError
                        ? Colors.white
                        : Colors.black,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
              if (action != null) {
                action();
              }
            },
          )
        ],
      );
    },
  );
}
