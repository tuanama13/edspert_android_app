import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edspert_app/datasource/banner_remote_datasource.dart';
import 'package:edspert_app/model/banner_response_model.dart';

part 'banner_event.dart';
part 'banner_state.dart';

class BannerBloc extends Bloc<BannerEvent, BannerState> {
  final BannerRemoteDataSource bannerRemoteDataSource;

  BannerBloc({required this.bannerRemoteDataSource}) : super(BannerInitial()) {
    on<BannerEvent>((event, emit) async {
      if (event is GetBannerListEvent) {
        emit(BannerLoading());
        final result = await bannerRemoteDataSource.getBanners();
        emit(BannerSuccess(bannerResponse: result));
      }
    });
  }
}
