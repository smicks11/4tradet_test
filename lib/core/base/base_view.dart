import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../shared/color_manager.dart';
import '../../shared/loader.dart';
import 'base_vm.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final T Function(BuildContext) vmBuilder;
  final Widget Function(BuildContext, T) builder;

  const BaseView({Key? key, required this.vmBuilder, required this.builder})
      : super(key: key);

  @override
  _BaseViewState createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: widget.vmBuilder(context),
      child: Consumer<T>(
        builder: _buildScreenContent,
      ),
    );
  }

  Widget _buildScreenContent(
          BuildContext context, T viewModel, Widget? child) =>
      !viewModel.isInitialized
          ? Container(
              color: AppColors.white,
              child: Center(
                  child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.w, vertical: 25.h),
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(12)),
                      child: Loader(
                          color: AppColors.kPrimaryColor, radius: 20.r))),
            )
          : Stack(
              children: [
                widget.builder(context, viewModel),
                Visibility(
                    visible: viewModel.isLoading,
                    child: Center(
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.w, vertical: 25.h),
                            decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(12)),
                            child: Loader(
                                color: AppColors.kPrimaryColor, radius: 20.r))))
              ],
            );
}
