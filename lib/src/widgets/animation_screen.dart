import 'package:acmc/src/model/enums.dart';
import 'package:acmc/src/services/get_requests.dart';
import 'package:acmc/src/services/post_requests.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class AnimationScreen extends ConsumerStatefulWidget {
  final bool isLogin;
  final LoadingOption loadingOption;
  const AnimationScreen({
    Key? key,
    this.isLogin = false,
    required this.loadingOption,
  }) : super(key: key);

  @override
  ConsumerState<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends ConsumerState<AnimationScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5),
      reverseDuration: const Duration(seconds: 5),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.repeat();
    switch (widget.loadingOption) {
      case LoadingOption.otp:
        goToVerify();
        break;
      case LoadingOption.profile:
        fetchProfile();
        break;
      default:
    }
  }

  Future<void> goToVerify() async {
    await PostRequest.fetchBearerToken(
      context,
      login: widget.isLogin,
      ref: ref,
    );
  }

  Future<void> fetchProfile() async {
    await GetRequest.fetchUserProfile(
      context,
      ref: ref,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Lottie.asset(
              'assets/lottie/searching e-id card.json',
              controller: _animation,
            ),
            20.sbH,
            if (widget.isLogin)
              const Text('Saving User details ...')
            else
              const Text('Retrieving User details ...'),
          ],
        ),
      ),
    );
  }
}
