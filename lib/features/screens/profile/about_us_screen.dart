import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  static const String routeName = "/about-screen";
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("About Us"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                "Welcome to Velvetbrew – your premier destination for next-generation cafe management.\nWith our cutting-edge software suite, we're transforming the traditional\n cafe experience into a seamless digital journey. From table reservations to online payments,\nVelvetbrew empowers both cafe owners and patrons with intuitive tools designed for efficiency and satisfaction. Our web-based admin platform and companion mobile app offer a comprehensive solution for order management,\ninventory tracking, and analytics. Plus, our QR code integration ensures hassle-free online ordering and self-service options, reducing wait times and enhancing convenience. At Velvetbrew, we're not just a software solution; we're your partner in navigating the digital\nlandscape of modern cafes.",
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
    );
  }
}
