import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';

import '../../../../firebase_options.dart';

class FirebaseApp {
  Future<void> initializeApp() async {
    try {
      await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    } on FirebaseException catch (fireErr) {
      return debugPrint(fireErr.message);
    } catch (e) {
      return debugPrint(e.toString());
    }
  }
}
