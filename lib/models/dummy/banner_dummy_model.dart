import 'package:flutter/material.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/resources/rersources.dart';

class BannerDummyModel {
  final Widget image;
  final String title;
  final String? description;

  BannerDummyModel({
    required this.image,
    required this.title,
    this.description,
  });
}

List<BannerDummyModel> banner = [
  BannerDummyModel(
      image: AppImages.imBanner1.image(),
      title: 'Banner 1',
      description: 'Description 1'),
  BannerDummyModel(
      image: AppImages.imBanner2.image(),
      title: 'Banner 2',
      description: 'Description 2'),
  BannerDummyModel(
      image: AppImages.imBanner3.image(),
      title: 'Banner 3',
      description: 'Description 3'),
  BannerDummyModel(
      image: AppImages.imBanner4.image(),
      title: 'Banner 4',
      description: 'Description 4'),
  BannerDummyModel(
    image: AppImages.imBanner5.image(),
    title: 'Banner 5',
    description: 'Description 5',
  ),
];
