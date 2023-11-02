import 'package:dio/dio.dart';
import 'package:easy_flutter/core/constant/app_color.dart';
import 'package:easy_flutter/main/ui/view/main_screen.dart';
import 'package:easy_flutter/secret.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class NaverLoginScreen extends StatefulWidget {
  const NaverLoginScreen({Key? key}) : super(key: key);

  @override
  State<NaverLoginScreen> createState() => _NaverLoginScreenState();
}

class _NaverLoginScreenState extends State<NaverLoginScreen> {
  FlutterSecureStorage storage = FlutterSecureStorage();
  InAppWebViewController? webViewController;
  bool isLoading = true;

  Future<bool> fetchToken(String code) async {
    Dio dio = Dio();

    try {
      final response =
          await dio.get('$baseUrl/api/oauth/callback?code=$code&state=null');

      if (response.statusCode == 200) {
        final accessToken = response.data['access_token'];
        final refreshToken = response.data['refresh_token'];

        await storage.write(key: 'accessToken', value: accessToken);
        await storage.write(key: 'refreshToken', value: refreshToken);

        print(accessToken);
        print(refreshToken);

        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  final InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
    crossPlatform: InAppWebViewOptions(
      cacheEnabled: true,
      clearCache: true,
      transparentBackground: true,
      useShouldOverrideUrlLoading: true,
      javaScriptEnabled: true,
    ),
    android: AndroidInAppWebViewOptions(
      useHybridComposition: true,
      mixedContentMode: AndroidMixedContentMode.MIXED_CONTENT_ALWAYS_ALLOW,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      child: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse('$baseUrl/api/oauth/naver'),
        ),
        initialOptions: InAppWebViewGroupOptions(
            android: AndroidInAppWebViewOptions(useHybridComposition: true)),
        onLoadStop: (controller, url) async {
          if (url!.path == '/api/oauth/callback') {
            var code = url.queryParameters['code'];

            if (await fetchToken(code!)) {

              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        MainScreen()), (route) => false,
              );

              // 다이얼로그 띄우기
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 134.h,
                    width: 270.w,
                    child: AlertDialog(
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '로그인 성공!',
                            style: TextStyle(
                              color: AppColor.black,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.close,
                              color: AppColor.primaryColor,
                              weight: 24.w,
                            ),
                          )
                        ],
                      ),
                      content: Row(
                        children: [
                          Image.asset(
                            'assets/images/icon/party.png',
                            width: 60.w,
                            height: 60.h,
                          ),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Welcome to ',
                                  style: TextStyle(
                                    color: AppColor.black,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: '에코마인드',
                                  style: TextStyle(
                                    color: AppColor.realGreen,
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ]
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          }
        },
      ),
    );
  }
}
