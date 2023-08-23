# NVIDIA DGX-STATIONでのDockerの作り方

2023-08-22現在

## 目標

1. ローカルPCのVSCodeからDGX上のDockerに接続して開発したり実行したりする
2. DGX上の開発コンテナからGitLabにプッシュする

## 1. DGXからGitLabへのssh接続環境構築

1. ローカルのWindowsでPowerShellを管理者で起動
2. ssh-agentを起動
    ```
    PS > Set-Service ssh-agent -StartupType Automatic
    PS > Start-Service ssh-agent
    # 起動できているかの確認
    PS > Get-Service ssh-agent
    ```
3. GitLabの秘密鍵の登録
    ```
    PS > ssh-add C:\Users\ユーザー名\.ssh\秘密鍵
    # 登録できているかの確認
    PS > ssh-add -l
    ```
- 参考: [Windows上でVSCode remote containersを使っている場合にコンテナ内からsshでGitHubに接続する方法](https://qiita.com/SolKul/items/3103fdde94c09b044a3a)

## 2. VSCodeからDGXへ接続

1. VSCodeで新しいウインドウを開く
2. VSCodeの拡張機能Dev Containersをインストール
3. VSCodeウインドウ左下 >< をクリック
4. コマンドパレットから「現在のウインドウをホストに接続する」を選択
5. コマンドパレットから「dgx」を選択

## 3. DGXにGitLabからプロジェクトをクローン

1. dgxにssh接続しているVSCodeウインドウでターミナルを開き、GitLabからクローン
    ```
    $ git clone git@repo.neut3d.com:hot_docs/docker_on_dgx.git
    :
    ```
2. VSCodeウインドウのフォルダを開くからdocker_on_dgxを開く
3. ユーザーIDの書き換え
    1. ターミナルからdgxのIDの確認
    ```
    $ id
    uid=1005(nagashima) gid=100(users) groups=100(users),27(sudo),999(docker)
    ```
    2. docker_on_dgx/.devcontainer/Dockerfile を開き、USER_UIDを上のuidに書き換える
    ```
    :
    ARG USER_UID=1005
    :
    ```

## 4. DGX上のDocker起動

1. ctrl + shift + p でコマンドパレットを開き、下記を選択
    ```
    >Dev Containers: Rebuild and Reopen in Containner
    ```
    dockerコンテナがビルドされる（数分かかることも）
2. gitの設定
    1. ターミナルを開き、gitのユーザー名、アドレスを設定
    ```
    $ git config --global user.name Nagashima
    $ git config --global user.email nagashima.takehiro@neut.co.jp
    ```
    2. ~/.ssh/configに以下を追加
    ```
    Host repo.neut3d.com
        HostName repo.neut3d.com
        Port 9022
        User git
    ```