# Headline <img src="https://github.com/Shyam16102001/Headline/blob/main/assets/icons/icon.svg" alt="Logo" width="50" >
**_All the news you need and more._**

Headline is a flutter application which uses [Bing News Search API](https://www.microsoft.com/en-us/bing/apis/bing-news-search-api) to fetch top news headlines in India and displays it.
The main aim of the application is to provide a easy way for the people to know what is happening around the world.

<!-- [Website Link](http://headline.azurewebsites.net/#/)

> The website may take some time when loading the website for the first time. -->

![website](https://user-images.githubusercontent.com/55325014/150069207-5e6b17d9-8bd1-4298-8600-f3a5db041c6b.png)

## Prerequisite

1. Latest version of the flutter is installed and configured properly.
   To test it run the following command

```
flutter doctor
```

2. Having an RapidApi account. If not visit [RapidApi](https://rapidapi.com/) to create a account.
3. Go to [Bing News Search](https://rapidapi.com/microsoft-azure-org-microsoft-cognitive-services/api/bing-news-search1/) and subscribe to the API.

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
