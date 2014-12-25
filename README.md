# あんやとBOX


まちつむぎハッカソンで作った、あんやとBOXのプロトタイプです。
Parse の[Anypicのソースコード](https://github.com/ParsePlatform/Anypic) を改変して作ってあります。

利用には、Parseのアカウント情報及びFacebookIDの登録が必要です。以下の手順でセットアップしてください。

1. Keys.plist をコピーしてXCodeを起動

```
git clone https://github.com/halsk/annyato-box.git
cd annyato-box/Anypic-iOS
cp Keys.plist.sample Keys.plist
open Anypic.xcodeproj
```

2. XCode 上で、Keys.plistを編集

Supporting Files/Keys.plist を開き、parseApplicationId、parseClientKey、facebookApplicationId を設定してください。

以上で起動するはずですが、facebook ログインを行う場合、テストユーザーのアカウントがフェイスブックアプリケーション側に登録されている必要があります。事前にご連絡ください。
