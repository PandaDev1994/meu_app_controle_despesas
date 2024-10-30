import 'package:flutter/material.dart';

Padding textFieldForNameAndEmail(
    TextEditingController controller, String label, String hint) {
  return Padding(
    padding: const EdgeInsets.only(top: 7),
    child: TextField(
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        labelText: label,
        hintText: hint,
      ),
    ),
  );
}

Padding textFieldForPass(TextEditingController controller, String label,
    String hint, IconData icon, bool visibilityOff, VoidCallback voidCallback) {
  return Padding(
    padding: const EdgeInsets.only(top: 7),
    child: TextField(
      obscureText: visibilityOff,
      controller: controller,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
        labelText: label,
        hintText: hint,
        suffixIcon: IconButton(
          onPressed: voidCallback,
          icon: Icon(icon),
        ),
      ),
    ),
  );
}

ElevatedButton buttonCustom(String label, VoidCallback voidCallback) {
  return ElevatedButton.icon(
    style: const ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(Colors.greenAccent)),
    onPressed: voidCallback,
    label: Text(
      label,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
    ),
    icon: const Icon(Icons.send_sharp),
    iconAlignment: IconAlignment.end,
  );
}
