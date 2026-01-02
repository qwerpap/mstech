import 'package:flutter/material.dart';
import 'models/onboarding_model.dart';

class OnboardingData {
  static final onboardingList = [
    OnboardingModel(
      icon: Icons.star,
      text: 'Create beautiful\nwishlists',
    ),
    OnboardingModel(
      icon: Icons.local_offer,
      text: 'Compare prices and\nfind deals',
    ),
    OnboardingModel(
      icon: Icons.share,
      text: 'Share lists with\nfriends',
    ),
  ];
}
