import 'package:binus_smart/pages/global/widgets/loading.dart';
import 'package:binus_smart/pages/global/widgets/my_error.dart';
import 'package:flutter/material.dart';

class StateCondition extends StatelessWidget {
  final bool _isLoading;
  final bool _showLoading;
  final bool _isError;
  final bool _showError;
  final Widget _widget;
  const StateCondition({
    Key? key,
    required bool isLoading,
    required bool isError,
    required Widget widget,
    bool showError = true,
    bool showLoading = true,
  })  : _isLoading = isLoading,
        _isError = isError,
        _widget = widget,
        _showError = showError,
        _showLoading = showLoading,
        super(key: key);
  @override
  Widget build(BuildContext context) {
    if (!_showError && _isError) {
      return const SizedBox();
    }
    if (_isError) {
      return const MyError();
    } else {
      if (_isLoading) {
        if(!_showLoading) {
          return const SizedBox();
        }
        return const Loading();
      } else {
        return _widget;
      }
    }
  }
}
