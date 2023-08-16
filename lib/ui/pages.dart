import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:go_router/go_router.dart';
import 'package:meta_seo/meta_seo.dart';

import '../navigator/navigator.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const pageTitle = 'My Dynamic Page';
    const pageDescription = 'This is a dynamic page with meta tags';
    final pageKeywords = ['flutter', 'meta tags', 'dynamic'];
    return Scaffold(
      appBar: AppBar(title: const Text('HomePage')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (kIsWeb)
            HtmlWidget(
              '''
            <!DOCTYPE html>
            <html>
              <head>
                <meta charset="UTF-8">
                <meta name="description" content="$pageDescription">
                <meta name="keywords" content="${pageKeywords.join(',')}">
                <title>$pageTitle</title>
              </head>
            </html>
            ''',
            ),
          Center(
            child: ElevatedButton(
              // onPressed: () {
              //   final url = Uri(path: '/allBlogs/favorite/article');
              //   final configuration = RouteMatchList(
              //     matches: [],
              //     pathParameters: {},
              //     uri: url,
              //   );
              //   Rout.router.routerDelegate.setNewRoutePath(configuration);
              // },
              onPressed: () => context.go(Rout.allBlogs),
              child: const Text('Go back to the allBlogs screen'),
            ),
          ),
        ],
      ),
    );
  }
}

class AllBlogs extends StatelessWidget {
  const AllBlogs({super.key});

  @override
  Widget build(BuildContext context) {
    if (kIsWeb) {
      // Define MetaSEO object
      MetaSEO meta = MetaSEO();
      // add meta seo data for web app as you want
      meta.author(author: 'Eng Mouaz M AlShahmeh');
      meta.description(description: 'Meta SEO Web Example');
      meta.keywords(keywords: 'Flutter, Dart, SEO, Meta, Web');
    }
    return Scaffold(
      appBar: AppBar(title: const Text('AllBlogs')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go('${Rout.allBlogs}/${Rout.details}'),
          child: const Text('Go back to the details screen'),
        ),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const pageTitle = 'My Dynamic Page';
    const pageDescription = 'This is a dynamic page with meta tags';
    final pageKeywords = ['flutter', 'meta tags', 'dynamic'];
    return Scaffold(
      appBar: AppBar(title: const Text('Details Screen')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (kIsWeb)
            HtmlWidget(
              '''
            <!DOCTYPE html>
            <html>
              <head>
                <meta charset="UTF-8">
                <meta name="description" content="$pageDescription">
                <meta name="keywords" content="${pageKeywords.join(',')}">
                <title>$pageTitle</title>
              </head>
            </html>
            ''',
            ),
          Center(
            child: ElevatedButton(
              onPressed: () => context.go(Rout.favorite),
              child: const Text('Go back to the Home screen'),
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteBlogs extends StatelessWidget {
  const FavoriteBlogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('FavoriteBlogs')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go(Rout.article),
          child: const Text('Go back to the singleArticle screen'),
        ),
      ),
    );
  }
}

class SingleArticle extends StatelessWidget {
  const SingleArticle({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Article')),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.go(Rout.root),
          child: const Text('Go back to the Home screen'),
        ),
      ),
    );
  }
}

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NotFoundPage')),
      body: ColoredBox(
        color: Colors.red,
        child: Center(
          child: ElevatedButton(
            onPressed: () => context.go(Rout.root),
            child: const Text('Go back to the Home screen'),
          ),
        ),
      ),
    );
  }
}
