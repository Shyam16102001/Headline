# Headline <img src="https://github.com/Shyam16102001/Headline/blob/main/assets/icons/icon.svg" alt="Logo" width="50" >

**_All the news you need and more._**

Headline is a flutter application which uses [Google News Api](https://rapidapi.com/bonaipowered/api/google-news22) to fetch top news headlines in India and displays it.
The main aim of the application is to provide a easy way for the people to know what is happening around the world.

[Website Link](https://headline16102001.netlify.app/#/)

> The website may take some time when loading the website for the first time.

![website](https://user-images.githubusercontent.com/55325014/159108921-4f7b9ddd-a4a8-4401-8902-d0d57ec74950.png)

## Prerequisite

1. Latest version of the flutter is installed and configured properly.
   To test it run the following command

```
flutter doctor
```

2. Having an RapidApi account. If not visit [RapidApi](https://rapidapi.com/) to create a account.
3. Go to [Google News](https://rapidapi.com/bonaipowered/api/google-news22) and subscribe to the API.

## Usage

1. Download or Clone this repository.
2. Please open file **constant.dart** and change `YOUR API KEY` in the variable `apiKey` with your own RapidApi-key.
3. The application is developed for large screen devices.
4. To run the application in debug mode on chrome

```
flutter run -d chrome
```

6. To build and release the fluter web app

```
flutter build web
```

You can also choose which renderer to use by using the `--web-renderer` option (See [Web renderers](https://docs.flutter.dev/development/tools/web-renderers)).

7. This generates the app, including the assets, and places the files into the /build/web directory of the project.

The release build of a simple app has the following structure:

```
/build/web
  assets
    AssetManifest.json
    FontManifest.json
    NOTICES
    fonts
      MaterialIcons-Regular.ttf
      <other font files>
    <image files>
  index.html
  main.dart.js
  main.dart.js.map
```

8. Launch a web server (for example, `python -m http.server 8000`, or by using the [dhttpd](https://pub.dev/packages/dhttpd) package), and open the /build/web directory.
9. Navigate to `localhost:8000` in your browser (given the python SimpleHTTPServer example) to view the release version of your app.

For more information visit: [https://docs.flutter.dev/deployment/web](https://docs.flutter.dev/deployment/web)

## Dependencies

1. [http](https://pub.dev/packages/http) - A composable, multi-platform, Future-based API for HTTP requests.
2. [flutter_svg](https://pub.dev/packages/flutter_svg) - An SVG rendering and widget library for Flutter, which allows painting and displaying Scalable Vector Graphics 1.1 files.
3. [jiffy](https://pub.dev/packages/jiffy) - Jiffy is a date dart package inspired by momentjs for parsing, manipulating and formatting dates.
4. [flutter_spinkit](https://pub.dev/packages/flutter_spinkit) - A collection of loading indicators animated with flutter.

## New to flutter

A few resources for you to get started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
