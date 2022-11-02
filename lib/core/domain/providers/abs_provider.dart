import 'package:dio/dio.dart';
import 'package:erp_employee_app/core/data/entities/provider_state/provider_state.dart';
import 'package:erp_employee_app/core/errors/error_messages.dart';
import 'package:erp_employee_app/core/errors/exceptions.dart';
import 'package:flutter/foundation.dart';

import 'package:erp_employee_app/core/data/api/enums/api_state_enum.dart';

abstract class AbsProvider<Model> extends ChangeNotifier {
  Future<void> makeApiRequest({
    required void Function(ProviderState Function(ProviderState) state)
        setState,
    required Future<void> Function() callback,
  }) async {
    setState((ProviderState state) {
      return state.copyWith(
        apiState: ApiState.LOADING,
        errorMessage: null,
      );
    });

    try {
      await callback();
      setState(
        (ProviderState state) =>
            state.copyWith(apiState: ApiState.LOADED, errorMessage: null),
      );
    } on NoInternetException {
      setState(
        (ProviderState state) => state.copyWith(
          apiState: ApiState.ERROR,
          errorMessage: ErrorMessages.NO_INTERNET_CONNECTION,
        ),
      );
    } on DioError catch (e) {
      if (kDebugMode) {
        print(e.response?.data);
      }
      setState(
        (ProviderState state) => state.copyWith(
          apiState: ApiState.ERROR,
          errorMessage: ErrorMessages.SOMETHING_WENT_WRONG_TRY_AGAIN,
        ),
      );
      if (e.response != null && e.response?.statusCode == 400) {
        final errorKey = e.response!.data["message"];
        setState(
          (ProviderState state) => state.copyWith(
            apiState: ApiState.ERROR,
            errorMessage: ErrorMessages.map[errorKey],
          ),
        );
      }
    } on UnauthorizedException {
      setState(
        (ProviderState state) => state.copyWith(
          apiState: ApiState.ERROR,
          errorMessage: ErrorMessages.WRONG_CREDINTIALS,
        ),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }

      setState(
        (ProviderState state) => state.copyWith(
          apiState: ApiState.ERROR,
          errorMessage: ErrorMessages.SOMETHING_WENT_WRONG_TRY_AGAIN,
        ),
      );
    }
  }
}
