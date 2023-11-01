import 'package:flutter/material.dart';

PreferredSizeWidget appBar(title) {
  return AppBar(
    backgroundColor: Colors.black,
    title: Text(
      title,
      style: const TextStyle(color: Colors.white, fontStyle: FontStyle.italic),
    ),
  );
}
