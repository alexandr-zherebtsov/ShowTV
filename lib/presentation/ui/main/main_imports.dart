library main;

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:show_tv/common/colors.dart';
import 'package:show_tv/common/localization.dart';
import 'package:show_tv/core/data/repositories/movies/movies_repository.dart';
import 'package:show_tv/core/models/movie_model.dart';
import 'package:show_tv/core/responses/movie_response.dart';
import 'package:show_tv/core/network/exception_handler.dart';

part 'main_screen.dart';
part 'main_controller.dart';
part 'widgets/is_busy_screen.dart';
part 'movies_screen/movies_screen.dart';
part 'movies_screen/widgets/movie_item.dart';
part 'movies_screen/widgets/empty_view.dart';
part 'test_screen/test_screen.dart';
