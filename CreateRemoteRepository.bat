@echo off
:: hub�R�}���h�Ń����[�g���|�W�g���𐶐�����
:: https://github.com/github/hub
:: 
:: 1.���炩���߃��[�J�����|�W�g���𐶐�����
:: 1.`hub create`�R�}���h�Ń����[�g���|�W�g���𐶐�����
:: 
:: * push���邱�Ƃœ��e���A�b�v���[�h�ł���
:: * CP932(Shift-JIS)������͂��Ă�UTF8�Ƃ��ăA�b�v���[�h�����
:: * �폜�R�}���h�͂Ȃ����ۂ�

set hub=C:\root\tool\System\hub-windows-386-2.2.8\bin\hub.exe
set hub_file=C:\Documents and Settings\Administrator\.config\hub
set hub_yourUser=C:\Documents and Settings\Administrator\.config\hub_yourUser
type "%hub_yourUser%" > "%hub_file%"

set DESCRIPTION="Hub�R�}���h���g���ă����[�g���|�W�g�����쐬����B"
set HOMEPAGE="https://github.com/"

%hub% create -d %DESCRIPTION% -h %HOMEPAGE%

::pause
@echo on
