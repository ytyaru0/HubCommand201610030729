@echo off
:: hubコマンドでリモートリポジトリを生成する
:: https://github.com/github/hub
:: 
:: 1.あらかじめローカルリポジトリを生成する
:: 1.`hub create`コマンドでリモートリポジトリを生成する
:: 
:: * pushすることで内容をアップロードできる
:: * CP932(Shift-JIS)から入力してもUTF8としてアップロードされる
:: * 削除コマンドはないっぽい

set hub=C:\root\tool\System\hub-windows-386-2.2.8\bin\hub.exe
set hub_file=C:\Documents and Settings\Administrator\.config\hub
set hub_yourUser=C:\Documents and Settings\Administrator\.config\hub_yourUser
type "%hub_yourUser%" > "%hub_file%"

set DESCRIPTION="Hubコマンドを使ってリモートリポジトリを作成する。"
set HOMEPAGE="https://github.com/"

%hub% create -d %DESCRIPTION% -h %HOMEPAGE%

::pause
@echo on
