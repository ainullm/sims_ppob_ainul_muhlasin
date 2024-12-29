import 'package:flutter/material.dart';
import 'package:sims_ppob_ainul_muhlasin/shared/resources/rersources.dart';

class ContentDummyModel {
  final String title;
  final Widget imageUrl;
  final int price;
  final String? serviceCode;

  ContentDummyModel({
    required this.title,
    required this.imageUrl,
    this.price = 0,
    this.serviceCode,
  });
}

List<ContentDummyModel> content = [
  ContentDummyModel(
    title: ' PBB',
    serviceCode: 'PAJAK',
    imageUrl: AppImages.icPbb.image(),
    price: 40000,
  ),
  ContentDummyModel(
    title: 'Listrik',
    price: 10000,
    serviceCode: 'PLN',
    imageUrl: AppImages.icElectrical.image(),
  ),
  ContentDummyModel(
    title: 'Pulsa',
    serviceCode: 'PULSA',
    price: 40000,
    imageUrl: AppImages.icPhone.image(),
  ),
  ContentDummyModel(
    title: 'PDAM',
    serviceCode: 'PDAM',
    price: 40000,
    imageUrl: AppImages.icPdam.image(),
  ),
  ContentDummyModel(
    title: 'PGN',
    serviceCode: 'PGN',
    price: 50000,
    imageUrl: AppImages.icPgn.image(),
  ),
  ContentDummyModel(
    title: 'Televisi',
    serviceCode: 'TV',
    price: 50000,
    imageUrl: AppImages.icTv.image(),
  ),
  ContentDummyModel(
    title: 'Musik',
    serviceCode: 'MUSIK',
    price: 50000,
    imageUrl: AppImages.icMusic.image(),
  ),
  ContentDummyModel(
    title: 'Game',
    serviceCode: 'VOUCHER_GAME',
    price: 100000,
    imageUrl: AppImages.icGame.image(),
  ),
  ContentDummyModel(
    title: 'Makanan',
    serviceCode: 'VOUCHER_MAKANAN',
    price: 100000,
    imageUrl: AppImages.icFood.image(),
  ),
  ContentDummyModel(
    title: 'Qurban',
    serviceCode: 'QURBAN',
    price: 200000,
    imageUrl: AppImages.icMoon.image(),
  ),
  ContentDummyModel(
    title: 'Zakat',
    serviceCode: 'ZAKAT',
    price: 300000,
    imageUrl: AppImages.icZakat.image(),
  ),
  ContentDummyModel(
    title: 'Data',
    serviceCode: 'PULSA',
    price: 50000,
    imageUrl: AppImages.icPhone.image(),
  ),
];
