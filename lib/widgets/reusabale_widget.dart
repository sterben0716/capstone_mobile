import 'package:flutter/material.dart';

Image logoWidget(String imagename){
  return Image.asset(
      imagename,
      fit: BoxFit.fitWidth,
      width: 350,
      height: 280
  );
}

Image logofWidget(String imagename){
  return Image.asset(
      imagename,
      fit: BoxFit.fitWidth,
      width: 350,
      height: 350
  );
}

Image logovWidget(String imagename){
  return Image.asset(
      imagename,
      fit: BoxFit.fitWidth,
      width: 250,
      height: 350
  );
}
