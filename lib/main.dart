import 'package:newrelic_mobile/config.dart';
import 'package:newrelic_mobile/newrelic_navigation_observer.dart';
import 'package:newrelic_mobile/newrelic_mobile.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
import 'routes.dart';

void main() {
  final String appToken = Platform.isIOS
      ? 'AAd48e2ff1e16698d057d9bc897e188584c00df038-NRMA'
      : 'AA8d0f974db805b931d0f663ae64cfa3090edbc7f6-NRMA';

  Config config = Config(
    accessToken: appToken,
    analyticsEventEnabled: true,
    networkErrorRequestEnabled: true,
    networkRequestEnabled: true,
    crashReportingEnabled: true,
    interactionTracingEnabled: true,
    httpResponseBodyCaptureEnabled: true,
    loggingEnabled: true,
    webViewInstrumentation: true,
    printStatementAsEventsEnabled: true,
    httpInstrumentationEnabled: true,
  );

  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = NewrelicMobile.onError;

    await NewrelicMobile.instance.startAgent(config);

    runApp(const ToDoApp());
  }, (Object error, StackTrace stackTrace) {
    NewrelicMobile.instance.recordError(error, stackTrace);
  });
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData(primarySwatch: Colors.teal),
      initialRoute: '/',
      routes: appRoutes,
      navigatorObservers: [
        NewRelicNavigationObserver(),
      ],
    );

    // return MaterialApp(
    //   title: 'ToDo App',
    //   theme: ThemeData(primarySwatch: Colors.teal),
    //   initialRoute: '/',
    //   routes: appRoutes,
    // );
  }
}


// import 'package:newrelic_mobile/newrelic_mobile.dart';
// import 'package:flutter/material.dart';
// import 'dart:io';
// import 'dart:async';
// import 'routes.dart';

// void main() {
//   final String appToken = Platform.isIOS
//       ? 'AAd48e2ff1e16698d057d9bc897e188584c00df038-NRMA'
//       : 'AA8d0f974db805b931d0f663ae64cfa3090edbc7f6-NRMA';

//   final NewRelicConfiguration config = NewRelicConfiguration(
//     accessToken: appToken,
//     analyticsEventEnabled: true,
//     networkErrorRequestEnabled: true,
//     networkRequestEnabled: true,
//     crashReportingEnabled: true,
//     interactionTracingEnabled: true,
//     httpResponseBodyCaptureEnabled: true,
//     loggingEnabled: true,
//     webViewInstrumentation: true,
//     printStatementAsEventsEnabled: true,
//     httpInstrumentationEnabled: true,
//   );

//   runZonedGuarded(() async {
//     WidgetsFlutterBinding.ensureInitialized();
//     FlutterError.onError = NewrelicMobile.onError;

//     await NewrelicMobile.instance.startAgent(configuration: config);

//     runApp(const ToDoApp());
//   }, (Object error, StackTrace stackTrace) {
//     NewrelicMobile.instance.recordError(error, stackTrace);
//   });
// }

// class ToDoApp extends StatelessWidget {
//   const ToDoApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ToDo App',
//       theme: ThemeData(primarySwatch: Colors.teal),
//       initialRoute: '/',
//       routes: appRoutes,
//     );
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:newrelic_mobile/newrelic_mobile.dart';
// import 'dart:io';
// import 'dart:async'; // For runZonedGuarded
// import 'routes.dart';

// void main() {
//   // Assign the correct app token based on the platform
//   var appToken = '';
//   if (Platform.isIOS) {
//     appToken = 'AAd48e2ff1e16698d057d9bc897e188584c00df038-NRMA';
//   } else if (Platform.isAndroid) {
//     appToken = 'AA8d0f974db805b931d0f663ae64cfa3090edbc7f6-NRMA';
//   }

//   // Create the New Relic config
//   Config config = Config(
//     accessToken: appToken,
//     analyticsEventEnabled: true,
//     networkErrorRequestEnabled: true,
//     networkRequestEnabled: true,
//     crashReportingEnabled: true,
//     interactionTracingEnabled: true,
//     httpResponseBodyCaptureEnabled: true,
//     loggingEnabled: true,
//     webViewInstrumentation: true,
//     printStatementAsEventsEnabled: true,
//     httpInstrumentationEnabled: true,
//   );

//   // Set up global error handling and initialize New Relic
//   runZonedGuarded(() async {
//     WidgetsFlutterBinding.ensureInitialized();

//     // Catch Flutter framework errors
//     FlutterError.onError = NewrelicMobile.onError;

//     // Start New Relic agent
//     await NewrelicMobile.instance.startAgent(config);

//     // Run the app
//     runApp(const ToDoApp());
//   }, (Object error, StackTrace stackTrace) {
//     // Capture uncaught errors
//     NewrelicMobile.instance.recordError(error, stackTrace);
//   });
// }

// class ToDoApp extends StatelessWidget {
//   const ToDoApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ToDo App',
//       theme: ThemeData(primarySwatch: Colors.teal),
//       initialRoute: '/',
//       routes: appRoutes,
//     );
//   }
// }




// import 'package:flutter/material.dart';
// import 'package:newrelic_mobile/newrelic_mobile.dart';
// import 'dart:io';
// import 'routes.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   // Assign appropriate token based on platform
//   var appToken = "";
//   if (Platform.isIOS) {
//     appToken = '<YOUR_IOS_TOKEN>'; // Replace with actual iOS token
//   } else if (Platform.isAndroid) {
//     appToken = '<YOUR_ANDROID_TOKEN>'; // Replace with actual Android token
//   }

//   // New Relic config setup
//   Config config = Config(
//     accessToken: appToken,
//     analyticsEventEnabled: true,
//     webViewInstrumentation: true,
//     networkErrorRequestEnabled: true,
//     networkRequestEnabled: true,
//     crashReportingEnabled: true,
//     interactionTracingEnabled: true,
//     httpResponseBodyCaptureEnabled: true,
//     loggingEnabled: true,
//     printStatementAsEventsEnabled: true,
//     httpInstrumentationEnabled: true,
//   );

//   // Start New Relic and then run app
//   NewrelicMobile.instance.start(config, () {
//     runApp(const ToDoApp());
//   });
// }

// class ToDoApp extends StatelessWidget {
//   const ToDoApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ToDo App',
//       theme: ThemeData(primarySwatch: Colors.teal),
//       initialRoute: '/',
//       routes: appRoutes,
//     );
//   }
// }






// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:newrelic_mobile/newrelic_mobile.dart';
// import 'routes.dart';

// void main() {
//   runZonedGuarded(() async {
//     WidgetsFlutterBinding.ensureInitialized();

//     // Determine the appropriate application token based on the platform
//     final appToken = Platform.isAndroid
//         ? 'AA18246ed6831f9b3cdd4a5487808bacf188c947fd-NRMA'
//         : '<YOUR_IOS_APP_TOKEN>';

//     // Configure New Relic settings
//     final config = Config(
//       accessToken: appToken,
//       analyticsEventEnabled: true,
//       networkErrorRequestEnabled: true,
//       networkRequestEnabled: true,
//       crashReportingEnabled: true,
//       interactionTracingEnabled: true,
//       httpResponseBodyCaptureEnabled: true,
//       loggingEnabled: true,
//       printStatementAsEventsEnabled: true,
//       httpInstrumentationEnabled: true,
//       webViewInstrumentation: true, // Effective on iOS
//     );

//     // Assign New Relic's error handler to Flutter's error handling
//     FlutterError.onError = NewrelicMobile.onError;

//     // Initialize the New Relic agent
//     await NewrelicMobile.instance.startAgent(config);

//     // Launch the Flutter application
//     runApp(const ToDoApp());
//   }, (error, stackTrace) {
//     // Record any uncaught errors with New Relic
//     NewrelicMobile.instance.recordError(error, stackTrace);
//   });
// }

// class ToDoApp extends StatelessWidget {
//   const ToDoApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ToDo App',
//       theme: ThemeData(primarySwatch: Colors.teal),
//       initialRoute: '/',
//       routes: appRoutes,
//     );
//   }
// }



// import 'package:flutter/material.dart';
// import 'routes.dart';

// void main() {
//   runApp(const ToDoApp());
// }

// class ToDoApp extends StatelessWidget {
//   const ToDoApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'ToDo App',
//       theme: ThemeData(primarySwatch: Colors.teal),
//       initialRoute: '/',
//       routes: appRoutes,
//     );
//   }
// }




// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // TRY THIS: Try running your application with "flutter run". You'll see
//         // the application has a purple toolbar. Then, without quitting the app,
//         // try changing the seedColor in the colorScheme below to Colors.green
//         // and then invoke "hot reload" (save your changes or press the "hot
//         // reload" button in a Flutter-supported IDE, or press "r" if you used
//         // the command line to start the app).
//         //
//         // Notice that the counter didn't reset back to zero; the application
//         // state is not lost during the reload. To reset the state, use hot
//         // restart instead.
//         //
//         // This works for code too, not just values: Most code changes can be
//         // tested with just a hot reload.
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
