import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../models/banner_model.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  StreamSubscription? subscription;
  RemoteConfigUpdate? remoteConfigUpdate;
  String pageToNavigate = Routes.login;
  BannerModel? bannerModel;
  final isBusy = false.obs;
  @override
  void onInit() {
    super.onInit();
    setupRemoteConfig();
  }

  Future<void> setupRemoteConfig() async {
    isBusy.toggle();
    try {
      final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
      if (subscription != null) {
        await subscription!.cancel();

        subscription = null;

        log('Listening cancelled');
      }

      await remoteConfig.activate();
      await remoteConfig.fetch();
      final responseBody =
          jsonDecode(remoteConfig.getValue('banner_config').asString());
      bannerModel = BannerModel.fromJson(responseBody as Map<String, dynamic>);

      subscription = remoteConfig.onConfigUpdated.listen((event) async {
        // Make new values available to the app.
        await remoteConfig.activate();
        await remoteConfig.fetch();
        final responseBody =
            jsonDecode(remoteConfig.getValue('banner_config').asString());
        bannerModel =
            BannerModel.fromJson(responseBody as Map<String, dynamic>);
        remoteConfigUpdate = event;
      });

      log('Listening, waiting for update...');
    } on PlatformException catch (exception, stacktrace) {
      // Fetch exception.
      log(exception.toString(), stackTrace: stacktrace);
      log('Exception: $exception');
    } catch (exception, stacktrace) {
      log('Unable to listen to remote config. Cached or default values will be used $exception',
          stackTrace: stacktrace);
      return;
    }
    isBusy.toggle();
  }

  @override
  void onClose() {
    subscription?.cancel();

    super.onClose();
  }
}
