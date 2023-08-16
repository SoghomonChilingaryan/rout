import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meta_seo/meta_seo.dart';

import '../ui/pages.dart';

class Rout {
  static const root = '/';
  static const allBlogs = '/allBlogs';
  static const details = 'details';
  static const favorite = '/favorite';
  static const article = '/article';

  static Widget _homePageRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const HomePage();
  static Widget _allBlogsRouteBuilder(
          BuildContext context, GoRouterState state) =>
      const AllBlogs();

  static Widget _detailsScreen(BuildContext context, GoRouterState state) =>
      const DetailsScreen();
  static Widget _favoriteBlogs(BuildContext context, GoRouterState state) =>
      const FavoriteBlogs();
  static Widget _singleBlog(BuildContext context, GoRouterState state) =>
      const SingleArticle();
  static Widget errorWidget(BuildContext context, GoRouterState state) =>
      const NotFoundPage();

  static final GoRouter _router = GoRouter(
    // initialLocation: root,
    debugLogDiagnostics: true,
    routes: <GoRoute>[
      GoRoute(
        path: root,
        builder: (BuildContext context, GoRouterState state) {
          if (kIsWeb) {
            MetaSEO meta = MetaSEO();
            meta.facebookAppID(facebookAppID: 'your_app_id');
            meta.ogTitle(ogTitle: 'Example Screen');
            meta.ogDescription(ogDescription: 'Example Screen Description');
            meta.ogImage(ogImage: 'https://example.com/example.png');

            meta.propertyContent(property: 'og:site_name', content: 'example');

            meta.twitterCard(twitterCard: TwitterCard.summaryLargeImage);
            meta.twitterTitle(twitterTitle: 'Example Screen');
            meta.twitterDescription(
                twitterDescription: 'Example Screen Description');
            meta.twitterImage(twitterImage: 'https://example.com/example.png');

            meta.nameContent(name: 'twitter:site', content: '@mouaz_m_shahmeh');
          }
          return const HomePage();
        },
      ),
      // GoRoute(
      //   path: root,
      //   builder: _homePageRouteBuilder,
      // ),
      GoRoute(path: allBlogs, builder: _allBlogsRouteBuilder, routes: <GoRoute>[
        GoRoute(path: details, builder: _detailsScreen),
      ]),
      GoRoute(path: favorite, builder: _favoriteBlogs),
      GoRoute(path: article, builder: _singleBlog),
    ],
    errorBuilder: errorWidget,
  );

  static GoRouter get router => _router;
}
