import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta_seo/meta_seo.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'navigator/navigator.dart';

void main() async {
  BindingBase.debugZoneErrorsAreFatal = false;
  // WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
// );
  // await Firebase.initializeApp();
  if (kIsWeb) {
    MetaSEO().config();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => Rout(),
      child: MaterialApp.router(
        // routerConfig: Rout.router,
        routeInformationProvider: Rout.router.routeInformationProvider,
        routeInformationParser: Rout.router.routeInformationParser,
        routerDelegate: Rout.router.routerDelegate,
      ),
    );
  }
}


/// The route configuration.
// final GoRouter _router = GoRouter(
//   initialLocation: '/aaa',
//   routes: <RouteBase>[
//     GoRoute(
//       path: '/aaa',
//       builder: (BuildContext context, GoRouterState state) {
//         return const HomeScreen();
//       },

//       routes: <RouteBase>[
//         GoRoute(
//           path: 'details',
//           builder: (BuildContext context, GoRouterState state) {
//             return const DetailsScreen();
//           },
//         ),
//       ],
//     ),
//     GoRoute(
//       path: '/details',
//       builder: (BuildContext context, GoRouterState state) {
//         return const DetailsScreen();
//       },
//     ),
//   ],
// );

// class HomeScreen extends StatelessWidget {
//   /// Constructs a [HomeScreen]
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Home Screen')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () => context.go('/details'),
//           child: const Text('Go to the Details screen'),
//         ),
//       ),
//     );
//   }
// }


