# OpenComputersTank
OpenComputers program to manage GTNH Large Fluid Cells and Tanks.
![20220801_1](https://user-images.githubusercontent.com/59131259/182160941-f7048a85-81af-4ec9-b4bf-f46efa7d5e26.jpg)

## 何これ？
Super TankやQuantum Tankの中身がある程度貯まったら自動でAE内の空セルに移し替えます。  
逆に少なくなったらAE内の中身入りセルから補充します。~~それだけ~~  
これにより空セルが無くならない限り容量無限のタンクを実現します。  
Transposerがコンポーネント最大数を超えない限り、タンクも複数設置できます。  
GTNH環境用ですがQuantum Tankがあれば使えるはず。  

## 必要なもの
- OpenComputersのコンピュータ
  - Server推奨。コンポーネント最大数をComponent Busで増やせるので。
  - HDDはTier1、メモリはTier1を2枚かTier1.5を1枚でよい。
- Transposer 必要な数だけ
- Analyzer
  - Transposerを識別するアドレスをコピーするため
- Applied EnergisticsのInterface 必要な数だけ
- Large Chrome Fluid Cell、Bedrockium Drumなどの大容量のセル 大量に
- 上記セルよりも（少し）容量の大きいSuper TankかQuantum Tank 必要な数だけ

## 準備
コンピュータにはOpenOSをインストールしておきます。  
コンピュータにTransposerを接続します。  
Transposerに隣接するようにTank（複数可）とInterface（Transposer毎に1つでよい）を配置します。  
![20220801_5](https://user-images.githubusercontent.com/59131259/182178275-5053192a-ca1c-412c-ae8f-453bd8d7961c.jpg)  
Interfaceには移し替える時に必要な空セル、液体入りセルをそれぞれ1つずつ補充されるように設定します。  
![20220801_2](https://user-images.githubusercontent.com/59131259/182164698-cb11b4d8-9eba-4690-a621-124967e9e353.jpg)  
一番右は使用済みセル返却に使うので空けておいてください。  

次のコマンドでエディタを開きます。
> edit tank.lua

GitHubからtank.luaの内容をコピーして、マウス中ボタンクリックでゲーム内に貼り付けします。  
Ctrl+Sを押して保存、Ctrl+Wで終了。  
![20220801_3](https://user-images.githubusercontent.com/59131259/182164979-84041567-9069-4fac-97ea-2cd0d3779079.jpg)

transposer.txtをエディタを開いて、タンクの数だけ行を追加します。
> edit transposer.txt

> Transposerのアドレス,液体量下限(\*),上限(\*),Transposerから見てタンクのある方角,Interfaceのある方角,Interface内の空セルのスロット番号(1-8),中身入りセルのスロット番号(1-8)

(\*)液体量下限より少なくなったら中身入りセル投入、上限より多くなったら空セル投入します。
![20220801_4](https://user-images.githubusercontent.com/59131259/182165049-ba8216cf-6e9c-4230-a29c-231178c5c7b1.jpg)  
Ctrl+Sを押して保存、Ctrl+Wで終了。  

### アドレスの指定方法
Analyzerを手に持った状態でTransposerをCtrl+右クリックするとクリップボードにコピーします。マウス中ボタンクリックでゲーム内に貼り付けします。  

### 方角
bottom,top,north,south,west,east  

## 実行
次のコマンドでtank.luaを実行します。  
> tank

正常に実行した場合、count=(タンク数)と表示されます。  
終了するにはCtrl+Alt+Cを押してください。  

## FAQ
### 液体入りセルがまだ無いんですけど
とりあえず無くても動きます。補充できないだけ。
### Too many components connected to the computer.と表示される
Transposerが多すぎるので減らすかComponent Busを追加してください。
