@echo off
:: GitHubに初めてPushする
:: 
:: あらかじめ、以下を済ませておく。
::
:: 1. Git for Windows をインストールする
:: 2. ssh鍵を作成する
::     2.1. 以下のパスへ移動する
::         C:\Documents and Settings\Administrator\.ssh
::     2.2. ssh鍵を作成する
::         GitBash > ssh-keygen -t rsa -C "your_email@youremail.com" -f [file name]※「id_rsa_ytyaru」
::         ・configファイル
::         ・秘密鍵ファイル([file name])
::         ・公開鍵ファイル([file name].pub)
:: 3. GitHubのアカウントを作成する
:: 4. GitHubにログインする
:: 5. GitHubにSSH公開鍵を登録する（https://github.com/settings/ssh）
:: 6. C:\Documents and Settings\Administrator\.ssh/configファイルに以下を追記する
::     Host github.com.ytyaru
::     User git
::     Port 22
::     HostName github.com
::     IdentityFile ~/.ssh/id_rsa_ytyaru
::     TCPKeepAlive yes
::     IdentitiesOnly yes
:: 7. 接続テストする
::    GitBash > ssh -T github.com.ytyaru
:: 8.GitHubでリポジトリを作成する（※「ColorEditor20160609」）
::
:: 参考
:: http://dev.classmethod.jp/tool/github-ssh-sub-account-setting/
:: http://www.slideshare.net/nullpopopo/github-12293342
:: http://dackdive.hateblo.jp/entry/2015/10/12/210547



:: GitHubアカウント
SET USER_NAME=YourUsername
SET USER_MAIL=YourUsername@domain.com
:: "C:\Documents and Settings\Administrator\.ssh\config"ファイルの対象"HOST"
SET SSH_HOST=github.com.YourUsername
:: GitHubのリポジトリ名（親ディレクトリ名）
for %%I in (.) do set REPOSITORY_NAME=%%~nI%%~xI


:: ローカルリポジトリに.gitファイル一式を作成（リビジョン管理の開始）
git init

:: アカウント切替
git config --local user.name "%USER_NAME%"
git config --local user.email "%USER_MAIL%"

:: ローカルリポジトリにソースコードをステージングしコミットする
git add .
git commit -m "initial commit"

:: .git/configの設定追記コマンド。1回だけ実行すればいい。
:: 「fatal: remote origin already exists.」というエラーが表示されたらコメントアウトする。
git remote add origin git@%SSH_HOST%:%USER_NAME%/%REPOSITORY_NAME%.git

:: リモートリポジトリ生成
call CreateRemoteRepository.bat
@echo off

:: ローカルリポジトリからリモートリポジトリへ修正を反映させる
git push origin master

pause
@echo on
