import 'package:flutter/material.dart';

class PillButton extends StatelessWidget {
  final String title;
  final Function onpressed;

  PillButton({required this.title, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        )),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed))
              return Colors.green.shade200;
            return Colors.yellow; // Use the component's default.
          },
        ),
      ),
      onPressed: () {},
      child: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 15),
      ),
    );
  }
}
