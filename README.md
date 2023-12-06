# HooTv: Movies & Tv Shows Streaming

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Flutter](https://img.shields.io/badge/flutter-%5E2.0.0-blue.svg)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/dart-%5E2.12.0-blue.svg)](https://dart.dev)

## Features
1. Cross Platform application (Android and iOS)
2. Full stack application with `FastAPI` backend(Python).
3. Best Practices and `Clean Architecture`.
4. Flutter `Bloc` for state management.
5. Proper `Error handling` and `logging`.
6. `Route`, `Asset` and `Theme` management.
7. Dependency injection.
8. `dartz` error handling using `Either`
9. `Dio` API integration, `retrofit` code generation & using `interceptors`.
10. `json_serializable` for generating models.
11. UI and Logic separation.
12. `Firebase` integration with Authentication(Google, Phone and Facebook)
13. `WebView` integration using `inAppWebView`.

## ScreenShots

| **_Image 1_**                                                                      | **_Image 2_**                                                                      | **_Image 3_**                                                                      |
|------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| ![Demo 1](https://raw.githubusercontent.com/YashMakan/hootv/main/images/demo1.png) | ![Demo 2](https://raw.githubusercontent.com/YashMakan/hootv/main/images/demo2.png) | ![Demo 3](https://raw.githubusercontent.com/YashMakan/hootv/main/images/demo3.png) |

| **_Image 4_**                                                                      | **_Image 5_**                                                                      |
|------------------------------------------------------------------------------------|------------------------------------------------------------------------------------|
| ![Demo 4](https://raw.githubusercontent.com/YashMakan/hootv/main/images/demo4.png) | ![Demo 5](https://raw.githubusercontent.com/YashMakan/hootv/main/images/demo5.png) |

## App Demo
COMING SOON

## Packages used

`cupertino_icons`, `responsive_sizer`, `intl_phone_number_input`, `flutter_social_button`
, `flutter_otp_text_field`, `flutter_custom_tab_bar`, `google_sign_in`, `firebase_auth`
, `firebase_phone_auth_handler`, `flutter_facebook_auth`, `carousel_slider`, `carousel_indicator`
, `glassmorphism_ui`, `device_preview`, `timeago`, `flutter_dropzone`, `dotted_border`
, `card_swiper`, `chewie`, `video_player`, `cached_network_image`, `hidable`, `firebase_core`
, `firebase_storage`, `cloud_firestore`, `equatable`, `bloc`, `flutter_bloc`, `get_it`, `dio`
, `retrofit`, `dartz`, `json_serializable`, `json_annotation`, `connectivity_plus`, `auto_size_text`
, `shimmer`, `youtube_player_flutter`, `material_floating_search_bar_2`
, `flutter_staggered_grid_view`, `readmore`, `flutter_inappwebview`, `intl`

## Folder Structure

```
.
└── lib/
    ├── app/
    │   ├── features/
    │   │   ├── auth/
    │   │   ├── discover/
    │   │   │   ├── data/
    │   │   │   │   ├── data_sources/
    │   │   │   │   │   ├── discover_data_source.dart
    │   │   │   │   │   └── discover_data_source.g.dart
    │   │   │   │   ├── models
    │   │   │   │   └── repository_impl/
    │   │   │   │       └── discover_repository_impl.dart
    │   │   │   ├── domain/
    │   │   │   │   ├── entities
    │   │   │   │   ├── repository/
    │   │   │   │   │   └── discover_repository.dart
    │   │   │   │   └── usecases/
    │   │   │   │       ├── fetch_trending_media_usecase.dart
    │   │   │   │       └── search_for_medias_usecase.dart
    │   │   │   └── presentation/
    │   │   │       ├── blocs/
    │   │   │       │   ├── discover_bloc/
    │   │   │       │   │   ├── bloc.dart
    │   │   │       │   │   ├── events.dart
    │   │   │       │   │   └── states.dart
    │   │   │       │   └── discover_search_bloc/
    │   │   │       │       ├── bloc.dart
    │   │   │       │       ├── events.dart
    │   │   │       │       └── states.dart
    │   │   │       ├── components/
    │   │   │       │   ├── discover_grid.dart
    │   │   │       │   ├── discover_screen_app_bar.dart
    │   │   │       │   ├── discover_search_area.dart
    │   │   │       │   └── story_view.dart
    │   │   │       └── pages/
    │   │   │           ├── discover_screen.dart
    │   │   │           └── discover_screen2.dart
    │   │   ├── home/
    │   │   │   ├── data/
    │   │   │   │   ├── data_sources/
    │   │   │   │   │   ├── home_data_source.dart
    │   │   │   │   │   └── home_data_source.g.dart
    │   │   │   │   ├── models/
    │   │   │   │   │   └── trending_media.dart
    │   │   │   │   └── repository_impl/
    │   │   │   │       └── home_repository_impl.dart
    │   │   │   ├── domain/
    │   │   │   │   ├── entities
    │   │   │   │   ├── repository/
    │   │   │   │   │   └── home_repository.dart
    │   │   │   │   └── usecases/
    │   │   │   │       ├── fetch_new_on_movies_usecase.dart
    │   │   │   │       ├── fetch_trending_movies_usecase.dart
    │   │   │   │       └── fetch_trending_tv_shows_use_case.dart
    │   │   │   └── presentation/
    │   │   │       ├── blocs/
    │   │   │       │   ├── home_continue_watching_bloc/
    │   │   │       │   │   ├── bloc.dart
    │   │   │       │   │   ├── events.dart
    │   │   │       │   │   └── states.dart
    │   │   │       │   ├── home_new_on_bloc/
    │   │   │       │   │   ├── bloc.dart
    │   │   │       │   │   ├── events.dart
    │   │   │       │   │   └── states.dart
    │   │   │       │   ├── home_trending_bloc/
    │   │   │       │   │   ├── bloc.dart
    │   │   │       │   │   ├── events.dart
    │   │   │       │   │   └── states.dart
    │   │   │       │   └── home_tv_shows_bloc/
    │   │   │       │       ├── bloc.dart
    │   │   │       │       ├── events.dart
    │   │   │       │       └── states.dart
    │   │   │       ├── components/
    │   │   │       │   ├── continue_watching_card.dart
    │   │   │       │   ├── continue_watching_list.dart
    │   │   │       │   ├── home_screen_app_bar.dart
    │   │   │       │   ├── new_on_hoo.dart
    │   │   │       │   ├── trending_movie_card.dart
    │   │   │       │   ├── trending_movie_list.dart
    │   │   │       │   ├── trending_video.dart
    │   │   │       │   └── tv_show_list.dart
    │   │   │       └── pages/
    │   │   │           └── home_screen.dart
    │   │   ├── main/
    │   │   │   ├── data/
    │   │   │   │   ├── data_sources
    │   │   │   │   ├── models
    │   │   │   │   └── repository_impl
    │   │   │   ├── domain/
    │   │   │   │   ├── entities
    │   │   │   │   ├── repository
    │   │   │   │   └── usecases
    │   │   │   └── presentation/
    │   │   │       ├── bloc
    │   │   │       ├── components/
    │   │   │       │   └── main_screen_bottom_nav_bar.dart
    │   │   │       └── pages/
    │   │   │           └── main_screen.dart
    │   │   ├── media_info/
    │   │   │   ├── data/
    │   │   │   │   ├── data_sources/
    │   │   │   │   │   ├── media_info_data_source.dart
    │   │   │   │   │   └── media_info_data_source.g.dart
    │   │   │   │   ├── models/
    │   │   │   │   │   ├── created_by.dart
    │   │   │   │   │   ├── created_by.g.dart
    │   │   │   │   │   ├── credits_model.dart
    │   │   │   │   │   ├── credits_model.g.dart
    │   │   │   │   │   ├── genre.dart
    │   │   │   │   │   ├── genre.g.dart
    │   │   │   │   │   ├── last_episode_to_air.dart
    │   │   │   │   │   ├── last_episode_to_air.g.dart
    │   │   │   │   │   ├── movie_info_model.dart
    │   │   │   │   │   ├── movie_info_model.g.dart
    │   │   │   │   │   ├── network.dart
    │   │   │   │   │   ├── network.g.dart
    │   │   │   │   │   ├── production_company.dart
    │   │   │   │   │   ├── production_company.g.dart
    │   │   │   │   │   ├── production_country.dart
    │   │   │   │   │   ├── production_country.g.dart
    │   │   │   │   │   ├── season.dart
    │   │   │   │   │   ├── season.g.dart
    │   │   │   │   │   ├── spoken_language.dart
    │   │   │   │   │   ├── spoken_language.g.dart
    │   │   │   │   │   ├── tv_show_info_model.dart
    │   │   │   │   │   ├── tv_show_info_model.g.dart
    │   │   │   │   │   ├── youtube_video_model.dart
    │   │   │   │   │   └── youtube_video_model.g.dart
    │   │   │   │   └── repository_impl/
    │   │   │   │       └── media_info_repository_impl.dart
    │   │   │   ├── domain/
    │   │   │   │   ├── entities
    │   │   │   │   ├── repository/
    │   │   │   │   │   └── media_info_repository.dart
    │   │   │   │   └── usecases/
    │   │   │   │       ├── fetch_movie_credits_use_case.dart
    │   │   │   │       ├── fetch_movie_info_use_case.dart
    │   │   │   │       ├── fetch_movie_videos_use_case.dart
    │   │   │   │       ├── fetch_tv_show_credits_use_case.dart
    │   │   │   │       ├── fetch_tv_show_info_use_case.dart
    │   │   │   │       └── fetch_tv_show_videos_use_case.dart
    │   │   │   └── presentation/
    │   │   │       ├── blocs/
    │   │   │       │   ├── media_credits_bloc/
    │   │   │       │   │   ├── bloc.dart
    │   │   │       │   │   ├── events.dart
    │   │   │       │   │   └── states.dart
    │   │   │       │   ├── media_info_bloc/
    │   │   │       │   │   ├── bloc.dart
    │   │   │       │   │   ├── events.dart
    │   │   │       │   │   └── states.dart
    │   │   │       │   └── media_info_videos_bloc/
    │   │   │       │       ├── bloc.dart
    │   │   │       │       ├── events.dart
    │   │   │       │       └── states.dart
    │   │   │       ├── components/
    │   │   │       │   ├── cast_list_widget.dart
    │   │   │       │   ├── cast_widget.dart
    │   │   │       │   ├── description_widget.dart
    │   │   │       │   ├── expanded_header_section.dart
    │   │   │       │   ├── more_like_this_widget.dart
    │   │   │       │   └── videos_list.dart
    │   │   │       └── pages/
    │   │   │           └── media_info_screen.dart
    │   │   ├── media_player/
    │   │   │   ├── data/
    │   │   │   │   ├── data_sources
    │   │   │   │   ├── models
    │   │   │   │   └── repository_impl
    │   │   │   ├── domain/
    │   │   │   │   ├── entities
    │   │   │   │   ├── repository
    │   │   │   │   └── usecases
    │   │   │   └── presentation/
    │   │   │       ├── blocs
    │   │   │       ├── components
    │   │   │       └── pages/
    │   │   │           └── media_player.dart
    │   │   ├── reel/
    │   │   │   ├── data/
    │   │   │   │   ├── data_sources/
    │   │   │   │   │   ├── reel_data_source.dart
    │   │   │   │   │   └── reel_data_source.g.dart
    │   │   │   │   ├── models
    │   │   │   │   └── repository_impl/
    │   │   │   │       └── reel_repository_impl.dart
    │   │   │   ├── domain/
    │   │   │   │   ├── entities/
    │   │   │   │   │   ├── reel_comment_model.dart
    │   │   │   │   │   ├── reel_comment_model.g.dart
    │   │   │   │   │   ├── reel_model.dart
    │   │   │   │   │   └── reel_model.g.dart
    │   │   │   │   ├── repository/
    │   │   │   │   │   └── reel_repository.dart
    │   │   │   │   └── usecases/
    │   │   │   │       └── fetch_reels_usecase.dart
    │   │   │   └── presentation/
    │   │   │       ├── blocs/
    │   │   │       │   └── reel_bloc/
    │   │   │       │       ├── bloc.dart
    │   │   │       │       ├── events.dart
    │   │   │       │       └── states.dart
    │   │   │       ├── components/
    │   │   │       │   ├── comment_bottomsheet.dart
    │   │   │       │   ├── comment_list_tile.dart
    │   │   │       │   ├── reel_page_widget.dart
    │   │   │       │   ├── reel_screen_app_bar.dart
    │   │   │       │   ├── reel_screen_options.dart
    │   │   │       │   └── reels_viewer.dart
    │   │   │       └── pages/
    │   │   │           └── reel_screen.dart
    │   │   └── splash/
    │   │       ├── data/
    │   │       │   ├── data_sources
    │   │       │   ├── models
    │   │       │   └── repository_impl
    │   │       ├── domain/
    │   │       │   ├── entities
    │   │       │   ├── repository
    │   │       │   └── usecases
    │   │       └── presentation/
    │   │           ├── bloc
    │   │           ├── components
    │   │           └── pages/
    │   │               └── splash_screen.dart
    │   └── shared/
    │       ├── config/
    │       │   ├── assets/
    │       │   │   ├── asset.dart
    │       │   │   ├── dummy.dart
    │       │   │   ├── icon.dart
    │       │   │   └── image.dart
    │       │   ├── constants/
    │       │   │   ├── colors.dart
    │       │   │   ├── constants.dart
    │       │   │   ├── enums.dart
    │       │   │   ├── extensions.dart
    │       │   │   ├── strings.dart
    │       │   │   └── strings_en.dart
    │       │   ├── routes/
    │       │   │   └── routes.dart
    │       │   └── theme/
    │       │       └── theme.dart
    │       └── core/
    │           ├── components/
    │           │   ├── media_vertical_card.dart
    │           │   └── section_heading_widget.dart
    │           ├── error_handler/
    │           │   ├── error_handler.dart
    │           │   └── error_state.dart
    │           ├── firebase_options.dart
    │           ├── inject_dependency/
    │           │   ├── api_sources.dart
    │           │   ├── blocs.dart
    │           │   ├── dependencies.dart
    │           │   ├── repositories.dart
    │           │   └── usecases.dart
    │           ├── interceptors/
    │           │   └── dio_interceptor.dart
    │           ├── models/
    │           │   ├── media_model.dart
    │           │   ├── movie_model.dart
    │           │   ├── movie_model.g.dart
    │           │   ├── tv_show_model.dart
    │           │   └── tv_show_model.g.dart
    │           └── utils/
    │               ├── convert_numbers_to_short.dart
    │               ├── date_formatter.dart
    │               └── url_checker.dart
    └── main.dart
```

## Technical Details

1. Flutter(3.10.6)
2. Dart(3.0.6)
3. Android Studio(Flamingo)
4. Python(3.10)
5. Minimum Android SDK (API LEVEL 21) - Android 5.0+