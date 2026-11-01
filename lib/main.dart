import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const DigitalLawyerApp());
  }

  class DigitalLawyerApp extends StatelessWidget {
    const DigitalLawyerApp({super.key});

      @override
        Widget build(BuildContext context) {
            return MaterialApp(
                  title: 'المحامي الرقمي',
                        debugShowCheckedModeBanner: false,
                              localizationsDelegates: const [
                                      GlobalMaterialLocalizations.delegate,
                                              GlobalWidgetsLocalizations.delegate,
                                                      GlobalCupertinoLocalizations.delegate,
                                                            ],
                                                                  supportedLocales: const [
                                                                          Locale('ar', ''),
                                                                                ],
                                                                                      theme: ThemeData(
                                                                                              primaryColor: const Color(0xFF1A237E),
                                                                                                      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
                                                                                                            ),
                                                                                                                  home: const HomeScreen(),
                                                                                                                      );
                                                                                                                        }
                                                                                                                        }
                                                                                                                        