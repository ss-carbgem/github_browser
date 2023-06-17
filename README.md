# github_browser

## プロジェクトの構成
このプロジェクトをベースに課題に取り組んでいただいます。Github APIを想定していますが、期待する実装ができるようなら、他のAPIでも問題ありません。
また、課題自体が未熟ですので、ご質問していただいて問題ありません。

以下の３つの画面を作成してもらいます
- 検索画面(実装済み)
- 検索結果一覧画面(テンプレートのみ)
- 詳細画面(作成してください)

### 検索画面の仕様
検索するキーワードが入力できる
検索ボタンを押すと、キーワードを渡して、検索結果一覧画面に遷移する

### 検索結果一覧画面の仕様
検索したキーワードの結果が一覧(GithubApiの場合、レポジトリの一覧)で表示される
WebAPIを使用して検索する。すでに検索結果などに対応したパッケージは使用しない
一覧の中から項目を選択すると、選択項目を渡して、詳細画面に遷移する

### 詳細画面の仕様
WebAPIを使用して選択した項目の詳細を検索する
選択した項目の詳細が表示される

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

import 'package:flutter_gen/gen_l10n/app_localizations.dart';でインポートする
AppLocalizations.of(context).XXX と記述して、使う

## 実装方法
### ビルド
flutter gen-l10n
flutter pub get
dart run build_runner build
flutter run

### ページの作成
「masonのインストール」を参考にmvvmを設定してください
ページは、プロジェクトのルートで「mason make mvvm」と実行し、ページ名を作成します
実行すると、ページ用のフォルダが作成され、以下のファイルが作成されます。MVVMモデルをベースにしてます。
XXX_page.dart: MVVMのView
XXX_vm.dart: MVVMのViewModelのインターフェース
impl/XXX_vm_impl.dart: MVVMのViewModelの実装クラス
impl/XXX_vm_dummy.dart: MVVMのViewModelのダミークラス(ゴールデンテスト時に使用する)

XXX_vm.dart には、表示したいデータ、実施したいイベントを記載してください。
表示したいデータは、リストやクラスでデフォルト設定ができないため、型をNullableで設定してください。

dart run build_runner build を実施してください。
impl/XXX_vm_impl.gvm.dart が作成されます。こちらには、値のgetter,setterが定義されています。
そのため、XXX_vm.dartから、値の設定は_value(値)で、取得はvalueで実行できます。

impl/XXX_vm_impl.dart に実際に動くソースを書きます。

作成したViewModelのソースは、GetIt経由で取得します。
main.dartの_initializeDIに登録してください。
GetIt.I<インターフェース名>()で呼び出します。

### インフラ層の作成
インフラ層では、実際にGithubなどの接続先からデータを取得するソースを作成します。
infrastructures内に接続先ごとにディレクトリを作成し、その中に作成します。

また、ドメイン層(domains/infrastructures)にインターフェースを作成します。インフラ層の実装クラスは、このインターフェースを実装します。

### ドメイン層
ドメイン層には、ビジネスロジックを記述します。ただ、作成するアプリはデータの取得と表示のため、不要となるかもしれません。
インフラ層のインターフェースのみ作成します。

### ユースケースの作成
ユースケース層は、各画面から呼ばれて、インフラ層から取得したデータを加工し、各画面のViewModelに返します。
ユースケースでは、ドメイン層のインターフェースを使用してください。 インフラ層の実装クラスは呼びません。

### Widgetの作成
ページ内のWidgetは適切にクラス化し見通のよいクラスにします。そのページでしか使わないWidgetは、ページのディレクトリのwidgetsディレクトリに作成します。
共通部品は、application/widgetsに作成します。こちらは、アトミックデザインに基づいて構成されています。
ただし、以下のように解釈を入れています。
- atoms: 従来のWidgetは色々な使い方ができるため、用途を限定するした単一のWidget
- molecules: 複数のWidgetで構成されたWidget。外観は定義するが、イベントは定義しない。親Widgetからコールバックを受け取る。
- organisms: 複数のWidgetで構成されたWidget。外観とイベントを定義する。
- templates: AppBarやBottomNavigatorなどを含めたページの外枠を定義する。(アトミックデザインでのtemplateと異なる）

### 画面の遷移
GoRouterを使用している。
application/router.dart にページのパスとクラスの結び付けを定義する。

### パッケージ
現在pubspec.yamlに定義しているパッケージで実装する。ただ、相談は可能。

## 評価ポイント
- 検索画面を参考に、他の画面が実装されていること
  - MVVMモデルで実装されている
  - インターフェース、実装クラス、ダミークラスが作成されている
  - 多言語対応がされている
  - テーマからスタイルをしている
  - DIを使いこなしている
  - 適切な画面遷移の設定がされている
- 適切なコメントが書かれている
- テストがある
- エラー時の処理が適切に実行されている
