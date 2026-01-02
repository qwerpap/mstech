import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/onboarding_data.dart';
import 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit()
      : super(
          OnboardingState(
            currentPage: 0,
            totalPages: OnboardingData.onboardingList.length,
          ),
        );

  void onPageChanged(int index) {
    emit(state.copyWith(currentPage: index));
  }

  bool canGoToNextPage() {
    return !state.isLastPage;
  }
}

