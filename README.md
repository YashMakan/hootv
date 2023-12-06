# HooTv: Movies & Tv Shows Streaming

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Flutter](https://img.shields.io/badge/flutter-%5E3.10.6-blue.svg)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/dart-%5E3.0.6-blue.svg)](https://dart.dev)

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
14. `Shimmer` animations for every api component.

## ScreenShots

| **_Image 1_**                                                            | **_Image 2_**                                                            | **_Image 3_**                                                            |
|--------------------------------------------------------------------------|--------------------------------------------------------------------------|--------------------------------------------------------------------------|
| ![Demo 1](https://github.com/YashMakan/hootv/raw/main/images/demo_1.png) | ![Demo 2](https://github.com/YashMakan/hootv/raw/main/images/demo_2.png) | ![Demo 3](https://github.com/YashMakan/hootv/raw/main/images/demo_3.png) |

| **_Image 4_**                                                            | **_Image 5_**                                                            | **_Image 6_**                                                            |
|--------------------------------------------------------------------------|--------------------------------------------------------------------------|--------------------------------------------------------------------------|
| ![Demo 4](https://github.com/YashMakan/hootv/raw/main/images/demo_4.png) | ![Demo 5](https://github.com/YashMakan/hootv/raw/main/images/demo_5.png) | ![Demo 6](https://github.com/YashMakan/hootv/raw/main/images/demo_6.png) |

| **_Image 7_**                                                            | **_Image 8_**                                                            | **_Image 9_**                                                            |
|--------------------------------------------------------------------------|--------------------------------------------------------------------------|--------------------------------------------------------------------------|
| ![Demo 7](https://github.com/YashMakan/hootv/raw/main/images/demo_7.png) | ![Demo 8](https://github.com/YashMakan/hootv/raw/main/images/demo_8.png) | ![Demo 9](https://github.com/YashMakan/hootv/raw/main/images/demo_9.png) |

| **_Image 10_**                                                             | **_Image 11_**                                                             |
|----------------------------------------------------------------------------|----------------------------------------------------------------------------|
| ![Demo 10](https://github.com/YashMakan/hootv/raw/main/images/demo_10.png) | ![Demo 11](https://github.com/YashMakan/hootv/raw/main/images/demo_11.png) |


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
    │   ├── features/ {CLEAN ARCHITECTURE}
    │   │   ├── auth/
    │   │   ├── discover/
    │   │   │   ├── data/
    │   │   │   │   ├── data_sources/
    │   │   │   │   │   ├── discover_data_source.dart
    │   │   │   │   │   └── discover_data_source.g.dart
    │   │   │   │   ├── models/
    │   │   │   │   └── repository_impl/
    │   │   │   │       └── discover_repository_impl.dart
    │   │   │   ├── domain/
    │   │   │   │   ├── entities/
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
    │   │   │           └── discover_screen.dart
    │   │   ├── home/
    │   │   ├── main/
    │   │   ├── media_info/
    │   │   ├── media_player/
    │   │   ├── reel/
    │   │   └── splash/
    |   |
    │   └── shared/ {Shared code in the app}
    │       ├── config/ {Contains the theme, routes, constants, assets of the app}
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
    │       └── core/ {contains the global components, error handling, global managers, models and other util classes}
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