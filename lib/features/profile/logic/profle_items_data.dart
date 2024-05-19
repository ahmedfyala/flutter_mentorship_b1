import 'package:flutter/material.dart';
import 'package:flutter_mentorship_b1/core/constants/app_strings.dart';
import 'package:flutter_mentorship_b1/features/profile/data/models/profile_item_model.dart';

List<ProfileItemModel> profileItems = [
  ProfileItemModel(
    icon: Icons.favorite_rounded,
    title: AppStrings.favorite,
    routeName: '',
  ),
  ProfileItemModel(
    icon: Icons.business_rounded,
    title: AppStrings.aboutCompany,
    routeName: '',
  ),
  ProfileItemModel(
    icon: Icons.people_rounded,
    title: AppStrings.ourTeam,
    routeName: '',
  ),
  ProfileItemModel(
    icon: Icons.logout_rounded,
    title: AppStrings.logout,
    routeName: '',
  ),
];
