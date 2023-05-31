// import 'package:acmc/src/services/get_requests.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:pull_to_refresh/pull_to_refresh.dart';

// import 'model.dart';
// import 'provider.dart';

// class MyHomePage extends ConsumerStatefulWidget {
//   const MyHomePage({super.key});

//   @override
//   ConsumerState<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends ConsumerState<MyHomePage> {
//   final PaginationModel paginationModel = PaginationModel();
//   late RefreshController refreshController;

//   @override
//   void initState() {
//     super.initState();
//     refreshController = RefreshController();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final airplaneList = ref.watch(
//       searchProvider(
//         paginationModel,
//       ),
//     );
//     return Scaffold(
//       appBar: AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: const Text('Pagination using Riverpod'),
//       ),
//       body: airplaneList.when(
//         data: (value) => SmartRefresher(
//           reverse: true,
//           controller: refreshController,
//           enablePullUp: true,
//           enablePullDown: false,
//           physics: const ClampingScrollPhysics(),
//           onRefresh: () async {
//             value.clear();
//             paginationModel.page = 0;
//             paginationModel.total = 100;
//             var _ = await ref.refresh(searchProvider(paginationModel).future);
//             refreshController.refreshCompleted();
//           },
//           onLoading: () async {
//             if (value.length != paginationModel.total) {
//               try {
//                 final a = await GetRequest.search(paginationModel);
//                 value.addAll(a);
//                 refreshController.loadComplete();
//                 setState(() {});
//               } catch (_) {
//                 refreshController.refreshFailed();
//               }
//             } else {
//               refreshController.loadNoData();
//             }
//           },
//           child: ListView.builder(
//             itemBuilder: (context, index) {
//               // final listOfAirPlane =
//               //     value.map((e) => AirPlaneModel.fromJson(e)).toList();
//               return ListTile(
//                 title: Text('$index [index].name}'),
//               );
//             },
//             itemCount: value.length,
//           ),
//         ),
//         error: (error, trace) => const Text('ERROR'),
//         loading: () => const Center(
//           child: CircularProgressIndicator.adaptive(),
//         ),
//       ),
//     );
//   }
// }
