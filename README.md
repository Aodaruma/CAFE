CAFE
====

## Important Notice

本プロジェクトを立ち上げた、thoth42(旧aoitofu)と申します。  
受験に専念するという意味でネット上のアカウントのほとんどを削除していました。

しかしその間に、CAFEが広く周知され、「AviUtlの後継」というキャッチコピーやAviUtlと比較するような表現が問題になっていた為、この場を借りて謝罪させていただきます。  
AviUtl製作者であるKENくん様、またAviUtlの公式な後継と誤解されてしまった方へお詫び申し上げます。  
この問題は、私の軽率な発言によって起きたと考えています。

更に今回の件によって、中核を成していた開発メンバーの方々に多大な迷惑をかけたことに対し、謝罪させていただきます。  
KENくん様、曖昧な情報によって誤解されてしまった方々、開発メンバーの方々、誠に申し訳ありませんでした。

開発メンバーの方々に迷惑をかけてしまった原因としては、私の複数人やチームでの開発経験が乏しいことが大きいと考えています。  
そのため、受験を終えたあとは一人で最初から作り直す予定です。

KENくん様、曖昧な情報によって誤解されてしまった方々、開発メンバーの方々、この度は誠に申し訳ありませんでした。

## Releases
https://github.com/aoitofu/CAFE/releases

## Description

現在開発中です。

## Demo

## Requirement

### OS

動作確認済みOS

* Windows 10 Home 64bit
* Windows 7 Professional 64bit
* Ubuntu 14.04 LTS (Unity)

### Libraries

#### Windows
* OpenGL
* OpenAL
* SDL2
* freetype

Windowsに於いてはライブラリが同梱されているので別途インストールの必要はありません。

#### Linux
* libopenal-dev
* libsdl2-dev
* freeglut3-dev
* libglew1.5-dev
* [freetype](http://download.savannah.gnu.org/releases/freetype/)

apt-get : `sudo apt-get install libopenal-dev libsdl2-dev freeglut3-dev libglew1.5-dev`  
freetypeは手動でインストールしてください。

#### OS X
* freetype
* openal
* opengl
* sdl2

homebrewを使用したライブラリのインストール方法:
`brew install freetype; brew install openal; brew install sdl2`


### Compiler and BuildTool

* dmd 2.075.0
* dub 1.0.0

## Build

リリースされているものと同じバイナリを作成するには以下のコマンドを使用します。  
binに実行ファイルが生成されます。

    dub build --build=release -a x86_64

デバッグ用のバイナリは以下のコマンドで作成します。

    dub build

デバッグコンパイルに於いて、マルチスレッドを利用すると正常に動作しません。

## Licence

[GNU Public License v3.0](https://github.com/aoitofu/CAFE/blob/master/LICENSE)

## Author

aoitofu
