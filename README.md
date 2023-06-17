# github_browser
## プロジェクトの構成

## 問題作成者がしたこと
### プロジェクトの作成
GithubでREADME.mdのみのレポジトリを作成
AndroidStudioでレポジトリからプロジェクトを作成
flutter create . を実行
1回目のコミット
アプリを実行

### パッケージの追加
#### masonのインストール
dart pub global activate mason_cli
mason new -o .mason/templates mvvm
mvvmの中身を作成
mason add mvvm --path .mason/templates/mvvm
mason make mvvm をプロジェクトのルートで実行し、検索ページを作成

#### 各パッケージの追加
flutter pub add flutter_riverpod
flutter pub add get_it
flutter pub add go_router
flutter pub add http
flutter pub add flutter_gen_runner --dev
flutter pub add build_runner --dev
flutter pub add source_gen --dev
flutter pub get 

#### 多言語対応の追加
flutter pub add intl
lib/l10/app_en.arbとapp_ja.arbを作成
flutter gen-l10n を実行
　.dart_tool/flutter_gen/gen)l10n/gen_l10nに言語用のクラスが生成される

