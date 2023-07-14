# NVIDIA DGX-STATIONでのDockerの作り方

2023-07-14現在

## 目標

1. DockerでPython環境を構築
2. ローカルのVSCodeから接続し開発・実行

## 1. DockerでPython環境を構築

- このリポジトリをクローンするか、Dockerfile, requirements.txtを作成
- Dockerイメージを作成
    ```
    $ docker image build -t kaiyoken .
    ```
    上のkaiyokenはイメージ名。適宜変更してください。誰かが既にイメージを作っていたらそれを利用してもいい
- Dockerを起動
    ```
    $ docker run --name kaiyoken-nagashima -it -v /etc/group:/etc/group:ro -v /etc/passwd:/etc/passwd:ro -u $(id -u $USER):$(id -g $USER) kaiyoken bash
    ```
    kaiyoken-nagashimaはコンテナ名。適宜変更してください
    
    