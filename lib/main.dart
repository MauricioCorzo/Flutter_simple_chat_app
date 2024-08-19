import 'package:flutter/material.dart'
    show BuildContext, MaterialApp, StatelessWidget, Widget, runApp;
import 'package:provider/provider.dart'
    show MultiProvider, ChangeNotifierProvider;
import 'package:yes_no_app/config/theme/app_theme.dart' show AppTheme;
import 'package:yes_no_app/presentation/providers/chat_provider.dart'
    show ChatProvider;
import 'package:yes_no_app/presentation/screens/chat/chat_screen.dart'
    show ChatScreen;

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Como el context y Provider de React
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        title: 'Yes No App',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().theme(),
        home: const ChatScreen(),
      ),
    );
  }
}
