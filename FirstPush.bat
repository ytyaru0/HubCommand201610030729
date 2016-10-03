@echo off
:: GitHub�ɏ��߂�Push����
:: 
:: ���炩���߁A�ȉ����ς܂��Ă����B
::
:: 1. Git for Windows ���C���X�g�[������
:: 2. ssh�����쐬����
::     2.1. �ȉ��̃p�X�ֈړ�����
::         C:\Documents and Settings\Administrator\.ssh
::     2.2. ssh�����쐬����
::         GitBash > ssh-keygen -t rsa -C "your_email@youremail.com" -f [file name]���uid_rsa_ytyaru�v
::         �Econfig�t�@�C��
::         �E�閧���t�@�C��([file name])
::         �E���J���t�@�C��([file name].pub)
:: 3. GitHub�̃A�J�E���g���쐬����
:: 4. GitHub�Ƀ��O�C������
:: 5. GitHub��SSH���J����o�^����ihttps://github.com/settings/ssh�j
:: 6. C:\Documents and Settings\Administrator\.ssh/config�t�@�C���Ɉȉ���ǋL����
::     Host github.com.ytyaru
::     User git
::     Port 22
::     HostName github.com
::     IdentityFile ~/.ssh/id_rsa_ytyaru
::     TCPKeepAlive yes
::     IdentitiesOnly yes
:: 7. �ڑ��e�X�g����
::    GitBash > ssh -T github.com.ytyaru
:: 8.GitHub�Ń��|�W�g�����쐬����i���uColorEditor20160609�v�j
::
:: �Q�l
:: http://dev.classmethod.jp/tool/github-ssh-sub-account-setting/
:: http://www.slideshare.net/nullpopopo/github-12293342
:: http://dackdive.hateblo.jp/entry/2015/10/12/210547



:: GitHub�A�J�E���g
SET USER_NAME=YourUsername
SET USER_MAIL=YourUsername@domain.com
:: "C:\Documents and Settings\Administrator\.ssh\config"�t�@�C���̑Ώ�"HOST"
SET SSH_HOST=github.com.YourUsername
:: GitHub�̃��|�W�g�����i�e�f�B���N�g�����j
for %%I in (.) do set REPOSITORY_NAME=%%~nI%%~xI


:: ���[�J�����|�W�g����.git�t�@�C���ꎮ���쐬�i���r�W�����Ǘ��̊J�n�j
git init

:: �A�J�E���g�ؑ�
git config --local user.name "%USER_NAME%"
git config --local user.email "%USER_MAIL%"

:: ���[�J�����|�W�g���Ƀ\�[�X�R�[�h���X�e�[�W���O���R�~�b�g����
git add .
git commit -m "initial commit"

:: .git/config�̐ݒ�ǋL�R�}���h�B1�񂾂����s����΂����B
:: �ufatal: remote origin already exists.�v�Ƃ����G���[���\�����ꂽ��R�����g�A�E�g����B
git remote add origin git@%SSH_HOST%:%USER_NAME%/%REPOSITORY_NAME%.git

:: �����[�g���|�W�g������
call CreateRemoteRepository.bat
@echo off

:: ���[�J�����|�W�g�����烊���[�g���|�W�g���֏C���𔽉f������
git push origin master

pause
@echo on
