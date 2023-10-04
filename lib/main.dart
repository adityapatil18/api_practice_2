import 'package:api_practice_2/Screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ApiPractice2());
}
class ApiPractice2 extends StatelessWidget {
  const ApiPractice2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:HomePage() ,);
  }
}