import 'package:flutter/material.dart';
import 'package:hootv/app/shared/core/models/movie_model.dart';

class TrendingMovie {
  final String image;
  final String title;
  final String subtitle;
  final String description;
  final Color color;
  final List<MovieModel> medias;
  final String id;

  TrendingMovie({
    required this.subtitle,
    required this.description,
    required this.medias,
    required this.image,
    required this.title,
    required this.id,
    required this.color,
  });
}
