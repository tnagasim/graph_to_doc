# NVIDIA DGX-STATIONでのDockerの作り方

2023-07-14現在

## 目標

1. DockerでPython環境を構築
2. ローカルのVSCodeから接続し開発・実行

## 1. DockerでPython環境を構築

1. DGXにこのリポジトリをクローンするか、Dockerfile, requirements.txtを作成
2. Dockerイメージを作成
    ```
    $ docker image build -t kaiyoken .
    ```
    上のkaiyokenはイメージ名。適宜変更してください。誰かが既にイメージを作っていたらそれを利用してもいい
3. Dockerを起動
    ```
    $ docker run --name kaiyoken-nagashima -it -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro -v .:/KaiYoKen -u $(id -u $USER):$(id -g $USER) kaiyoken bash
    ```
    kaiyoken-nagashimaはコンテナ名。適宜変更してください
    /KaiYoKenはDocker側の作業ディレクトリ名。適宜変更してください

## 2. ローカルのVSCodeから接続し開発・実行

1. ローカルPCのVSCodeから左下 >< をクリック
2. コマンドパレットから「現在のウインドウをホストに接続する」を選択
3. コマンドパレットから「dgx」を選択
4. 再度VSCodeウインドウの左下 >< をクリック
5. コマンドパレットから「実行中のコンテナーにアタッチ」を選択
6. コマンドパレットから「/kaiyoken-nagashima」を選択