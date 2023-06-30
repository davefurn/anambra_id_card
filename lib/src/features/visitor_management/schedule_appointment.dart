import 'package:acmc/src/constants/colors.dart';
import 'package:acmc/src/features/authentication/create_account/widget/custom_text_input.dart';
import 'package:acmc/src/features/home/views/bottom_nav.dart';
import 'package:acmc/src/features/onboarding/widgets/custom_button.dart';

import 'package:acmc/src/features/visitor_management/schedule_details.dart';
import 'package:acmc/src/model/enums.dart';
import 'package:acmc/src/riverpod/providers.dart';
import 'package:acmc/src/router/app_routes.dart';
import 'package:acmc/src/utils/extension/widget_extension.dart';
import 'package:acmc/src/widgets/card.dart';
import 'package:acmc/src/widgets/error_widget.dart';
import 'package:acmc/src/widgets/loading_button.dart';
import 'package:acmc/src/widgets/search_parameter_widget.dart';
import 'package:acmc/src/widgets/special_button_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../model/model.dart';

class ScheduleAppointment extends StatefulWidget {
  const ScheduleAppointment({super.key});

  @override
  State<ScheduleAppointment> createState() => _ScheduleAppointmentState();
}

class _ScheduleAppointmentState extends State<ScheduleAppointment> {
  SearchParameter initialValue = SearchParameter.email;

  SearchModel? selectedEmployee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          textAlign: TextAlign.start,
          'Schedule appointment',
          style:
              Theme.of(context).textTheme.headlineLarge?.copyWith(fontSize: 24),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.only(
          top: 32.h,
          right: 20.w,
          left: 20.w,
        ),
        children: [
          Text(
            'Who do you want to see?',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              color: const Color(0xff5E6166),
            ),
          ),
          8.sbH,
          SizedBox(
            height: 90.h,
            child: GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 13.w,
              childAspectRatio: 103.w / 90.h,
              children: [
                SearchParameterWidget(
                  family: initialValue,
                  parameter: SearchParameter.email,
                  iconData: Icons.mail_outline,
                  onTap: (p0) => setState(() {
                    initialValue = p0;
                  }),
                  text: 'Email Address',
                ),
                SearchParameterWidget(
                  family: initialValue,
                  parameter: SearchParameter.mda,
                  iconData: Icons.apartment_outlined,
                  onTap: (p0) => setState(() {
                    initialValue = p0;
                  }),
                  text: 'MDA',
                ),
              ],
            ),
          ),
          20.sbH,
          Row(
            children: [
              initialValue == SearchParameter.mda
                  ? const SizedBox.shrink()
                  : SpecialButton2(
                      text: selectedEmployee == null
                          ? 'Select employee'
                          : '${selectedEmployee!.lastName} ${selectedEmployee!.firstName} ${selectedEmployee!.middleName}',
                      icon: selectedEmployee == null
                          ? null
                          : const Icon(Icons.person_outline),
                      onTap: () async {
                        var a = await showModalBottomSheet<SearchModel>(
                          context: globalContext,
                          isScrollControlled: true,
                          builder: (context) => const BottomSearhing(),
                        );
                        setState(() {
                          if (a != null) selectedEmployee = a;
                        });
                      },
                    ),
            ],
          ),
          if (selectedEmployee != null)
            Column(
              children: [
                5.sbH,
                Align(
                  alignment: Alignment.bottomLeft,
                  child: GestureDetector(
                    onTap: () async {
                      var a = await showModalBottomSheet<SearchModel>(
                        context: globalContext,
                        isScrollControlled: true,
                        builder: (context) => const BottomSearhing(),
                      );
                      setState(() {
                        if (a != null) selectedEmployee = a;
                      });
                    },
                    child: const Text(
                      "Replace",
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          initialValue == SearchParameter.mda
              ? Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: DropdownMenu(
                    textStyle: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'inter',
                    ),
                    selectedTrailingIcon: const Icon(
                      Icons.keyboard_arrow_down,
                    ),
                    trailingIcon: const Icon(
                      Icons.keyboard_arrow_down,
                    ),
                    dropdownMenuEntries: const [
                      DropdownMenuEntry(
                        value: 1,
                        label: 'All employees on payroll',
                      ),
                      DropdownMenuEntry(
                        value: 2,
                        label: 'Ministry of Health',
                      ),
                      DropdownMenuEntry(
                        value: 3,
                        label: 'ICT Agency',
                      ),
                      DropdownMenuEntry(
                        value: 5,
                        label: 'Ministry of Health',
                      ),
                    ],
                  ),
                )
              : const SizedBox.shrink(),
          20.sbH,
          const CustomTextInput(
            titleText: 'Full name',
            hpD: 0,
          ),
          24.sbH,
          const CustomTextInput(
            titleText: 'Email',
            hpD: 0,
          ),
          24.sbH,
          const CustomTextInput(
            titleText: 'Phone number',
            hpD: 0,
          ),
          30.sbH,
          LoadingButton(
            state: LoadingState.normal,
            onTap: () {
              pushTo(context, const ScheduleDetails());
            },
            text: 'Next',
          )
        ],
      ),
    );
  }
}

class BottomSearhing extends StatefulWidget {
  const BottomSearhing({super.key});

  @override
  State<BottomSearhing> createState() => _BottomSearhingState();
}

class _BottomSearhingState extends State<BottomSearhing> {
  late TextEditingController textController;
  SearchParameter initialValue = SearchParameter.email;
  late PageController controller;
  bool showBack = false;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    controller = PageController();
  }

  @override
  void dispose() {
    textController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      child: PageView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              32.sbH,
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    'Select what information you’re searching with.',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
              16.sbH,
              SizedBox(
                height: 90.h,
                child: GridView.count(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  crossAxisCount: 3,
                  crossAxisSpacing: 13.w,
                  childAspectRatio: 103.w / 90.h,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    SearchParameterWidget(
                      family: initialValue,
                      parameter: SearchParameter.email,
                      iconData: Icons.mail_outline,
                      onTap: (p0) => setState(() {
                        initialValue = p0;
                        // textController.text = email;
                        // focus.requestFocus();
                      }),
                      text: 'Email Address',
                    ),
                    SearchParameterWidget(
                      family: initialValue,
                      parameter: SearchParameter.phoneNumber,
                      iconData: Icons.phone,
                      onTap: (p0) => setState(() {
                        initialValue = p0;
                        // textController.text = phone;
                        // focus.requestFocus();
                      }),
                      text: 'Phone number',
                    ),
                    SearchParameterWidget(
                      family: initialValue,
                      parameter: SearchParameter.staffId,
                      iconData: Icons.person_outlined,
                      onTap: (p0) => setState(() {
                        initialValue = p0;
                        // textController.text = id;
                        // focus.requestFocus();
                      }),
                      text: 'Staff ID',
                    ),
                  ],
                ),
              ),
              20.sbH,
              CustomTextInput(
                // focusNode: focus,
                onChanged: (v) => setState(() {
                  // if (initialValue == SearchParameter.email) {
                  //   email = v;
                  // } else if (initialValue ==
                  //     SearchParameter.phoneNumber) {
                  //   phone = v;
                  // } else {
                  //   id = v;
                  // }
                }),
                validator: (v) {
                  return null;
                },
                textInputAction: TextInputAction.next,
                titleText: initialValue == SearchParameter.email
                    ? 'Email'
                    : initialValue == SearchParameter.phoneNumber
                        ? 'Phone'
                        : 'Staff ID',
                keyboardType: initialValue == SearchParameter.email
                    ? TextInputType.emailAddress
                    : initialValue == SearchParameter.phoneNumber
                        ? TextInputType.number
                        : TextInputType.number,
                controller: textController,
                suffixIcon: Visibility(
                  visible: textController.text.isNotEmpty,
                  child: IconButton(
                      onPressed: () => textController.clear(),
                      icon: const Icon(Icons.clear)),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomButton(
                thickLine: 1,
                onpressed: () {
                  if (textController.text.isNotEmpty) {
                    controller.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn,
                    );
                  }
                },
                text: 'Search Database',
                textcolor: IdColors.textColorBlack,
                disable: textController.text.isEmpty,
              ),
            ],
          ),
          SearchResult(
            word: textController.text,
            controller: controller,
          )
        ],
      ),
    );
  }
}

class SearchResult extends ConsumerStatefulWidget {
  final String word;
  final PageController controller;
  const SearchResult({
    super.key,
    required this.word,
    required this.controller,
  });

  @override
  ConsumerState<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends ConsumerState<SearchResult> {
  final EmployeePaginationModel paginationModel = EmployeePaginationModel();
  late RefreshController refreshController;
  List<SearchModel> value = [];

  @override
  void initState() {
    super.initState();
    refreshController = RefreshController();
    paginationModel.word = widget.word;
    paginationModel.identifier = 'email';
  }

  @override
  Widget build(BuildContext context) {
    final searchList = ref.watch(
      searchProvider(
        paginationModel,
      ),
    );
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              onPressed: () => widget.controller.animateToPage(
                0,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
              ),
              icon: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          Expanded(
            child: searchList.when(
              data: (val) {
                if (val?.statusCode == 200 && val != null && val.data != null) {
                  Map<String, dynamic> convertedMap = {};
                  val.data.forEach((key, value) {
                    convertedMap[key] = value;
                  });
                  var newP = SearchModel.fromJson(convertedMap);
                  return Cards(
                    model: newP,
                    select: () {},
                  );
                } else {
                  return Center(
                    child: AppErrorWidget(
                      errorData: val?.data,
                      errorCode: val?.statusCode,
                    ),
                  );
                }
              },
              error: (error, trace) => const Center(
                child: AppErrorWidget(),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
