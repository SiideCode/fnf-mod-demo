
# Инструкции

Проект (на данный момент) базируется на [Psych Engine](<https://github.com/ShadowMario/FNF-PsychEngine/tree/main>)
Результаты компиляции хранятся в директории ```export/```, название субдиректории зависит от вида сборки (release, debug или 32bit), приложение называется DEMO, а медиафайлы игры находятся в папке assets.

## Последние артефакты компиляции main находятся в Actions

---

## Инструкции по компиляции Linux

1. Установите Haxe и VLC последней версии:
   1. Ubuntu/Debian:```
      sudo add-apt-repository ppa:haxe/releases -y
      sudo apt update
      sudo apt install haxe libvlc-dev libvlccore-dev -y```
   2. Arch: ```sudo pacman -Syu haxe vlc --noconfirm```
   3. Gentoo: ```sudo emerge --ask dev-lang/haxe media-video/vlc```
2. Запустите ```setup/unix.bat```.
3. В ```art/buildScripts/``` запустите ```build_unix.sh``` или ```build_unix-debug.sh```.

---

## Инструкции по компиляции Windows

1. Установите Haxe последней версии для вашей ОС (<https://haxe.org/download/>).
2. Установите MSVC 2019/2022 или иной C++-компилятор.
   1. Если вы используете MSVC 2019/2022 (<https://visualstudio.microsoft.com/ru/downloads/>) - установите пакет для разработки классических C++-приложений ИЛИ запустите ```setup/windows-msvc.bat```.
   2. Если вы используете MSVC, то вам потребуются runtime-компоненты для Microsoft Visual C++.
3. Запустите ```setup/windows.bat```.
4. В ```art/buildScripts/``` запустите ```build_x64.bat```, ```build_x64-debug.bat```, или ```build_x32.bat```.

---

## Инструкции по компиляции Mac

1. Установите Haxe последней версии для вашей ОС (<https://haxe.org/download/>).
2. Запустите ```setup/unix.sh```.
3. В ```art/buildScripts/``` запустите ```build_unix.sh``` или ```build_unix-debug.sh```.
