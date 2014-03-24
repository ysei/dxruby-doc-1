## module Image
### 要約
画像を表すクラスです。

----

### 特異メソッド
#### new  -> Image
* width(幅)/height(高さ)で表されるサイズのImageオブジェクトを生成して返します。  
  color（[a, r, g, b]それぞれ0～255の配列です）を指定すると全体がその色で初期化され、  
  省略すると[0, 0, 0, 0]の透明色となります。
  * **width** *Integer*
    * 横幅
  * **height** *Integer*
    * 高さ
  * **color** *Array*
    * 色[ARGB]


----

#### load  -> Image
* 画像を読み込み、Imageオブジェクトを生成して返します。  
  x/y/width/heightを指定するとその部分のみ切り出してImageオブジェクトを生成します。  
  サポートするファイル形式はjpgとpng、bmpその他ですが、カラーキーは対応していないので透明色のある絵はpngにしてください。
  * **path** *String*
    * ファイルパス
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **width** *Integer*
    * 横幅
  * **height** *Integer*
    * 高さ


----

#### load_tiles  -> Array
* 画像を読み込み、横・縦がそれぞれxcount個、ycount個であると仮定して自動で分割し、  
  左上から右に向かう順序でImageオブジェクトの配列を生成して返します。  
  サポートするファイル形式はjpgとpng、bmpその他ですが、カラーキーは対応していないので透明色のある絵はpngにしてください。  
  share_switchはtrueにすると全てのImageのテクスチャが共有されます。  
  描画は速くなりますが、Shaderを使って描画する際にテクスチャ座標が(0.0, 0.0)～(1.0, 1.0)にならなくなります。
  * **path** *String*
    * ファイルパス
  * **xcount** *Integer*
    * X軸分割数
  * **ycount** *Integer*
    * Y軸分割数
  * **share_switch** *bool*
    * Imageのテクスチャ共有の有無


----

#### create_from_array  -> Image
* 色情報を格納した配列からImageオブジェクトを生成して返します。  
  配列はalpha, red, green, blueの４つをピクセル数分並べたものです。  
  例)32×32ピクセルの白い四角は[255, 255, 255, 255] * 32 * 32と指定します。
  * **width** *Integer*
    * 横幅
  * **height** *Integer*
    * 高さ
  * **array** *Array*
    * 色情報(ARGB)を格納した配列


----

#### load_from_file_in_memory  -> Image
* メモリ上のデータからImageオブジェクトを生成します。
  * **binary_data** *String*
    * 画像ファイルのバイナリ


----

### インスタンスメソッド
#### dispose 
* selfの画像リソースを解放します。  
  使わなくなったデータをdisposeしておくと、PCのメインメモリやビデオメモリを節約することができ、また、GC時の負荷も軽くなります。  
  dispose後、そのオブジェクトのメソッドを呼び出すと例外が発生します。


----

#### delayed_dispose 
* selfの画像リソースを、delayed_disposeが呼ばれたフレームの描画処理が終わった後に解放します。  
  あるフレームで生成し、そのフレームの描画のみで使うImageがあった場合に、次フレームでdisposeするのは面倒ですが、このメソッドでdispose予約ができます。  
  次のフレーム以降、そのオブジェクトのメソッドを呼び出すと例外が発生します。


----

#### disposed?  -> bool
* selfがdisposeされているかどうかをtrue/falseで返します。


----

#### []  -> Array
* Imageオブジェクトの該当ピクセルの色を配列で取得します。  
  配列は[a, r, g, b]となります。  
  それぞれ0～255の範囲です。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標


----

#### []= 
* Imageオブジェクトの該当ピクセルに色を設定します。  
  colorは配列で、[a, r, g, b]と指定します。  
  それぞれ0～255の範囲です。  
  [r, g, b]で渡すとaは255になります。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標


----

#### compare 
* Imageオブジェクトの該当ピクセルの色がcolorと一致するかどうかをtrue/falseで返します。  
  colorは配列で、[a, r, g, b]と指定します。  
  それぞれ0～255の範囲です。  
  [r, g, b]で渡すとaは比較されません。  
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **color** *Array*
    * 色[ARGB]


----

#### line 
* Imageオブジェクトの(x1,y1)-(x2,y2)に線を描画します。
  * **x1** *Integer*
    * X座標1
  * **y1** *Integer*
    * Y座標1
  * **x2** *Integer*
    * X座標2
  * **y2** *Integer*
    * Y座標2
  * **color** *Array*
    * 色[ARGB]


----

#### box 
* (x1,y1)-(x2,y2)の中を塗りつぶさない四角形を描画します。
  * **x1** *Integer*
    * X座標1
  * **y1** *Integer*
    * Y座標1
  * **x2** *Integer*
    * X座標2
  * **y2** *Integer*
    * Y座標2
  * **color** *Array*
    * 色[ARGB]


----

#### box_fill 
* Imageオブジェクトの(x1,y1)-(x2,y2)の範囲を塗りつぶします。
  * **x1** *Integer*
    * X座標1
  * **y1** *Integer*
    * Y座標1
  * **x2** *Integer*
    * X座標2
  * **y2** *Integer*
    * Y座標2
  * **color** *Array*
    * 色[ARGB]


----

#### circle 
* Imageオブジェクトの(x,y)を中心とした半径rの円を描きます。  
  DXRuby1.2.2で円の描画アルゴリズムが変更され、  
  Image.new(10,10).circle(5,5,5,[255,255,255])で上下左右ぴったりの円が描画できるようになりました。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **r** *Integer*
    * 円の半径
  * **color** *Array*
    * 色[ARGB]


----

#### circle_fill 
* Imageオブジェクトの(x,y)を中心とした半径rの円を描き、塗りつぶします。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **r** *Integer*
    * 円の半径
  * **color** *Array*
    * 色[ARGB]


----

#### triangle 
* Imageオブジェクトの(x1, y1)-(x2, y2)-(x3, y3)を結ぶ三角形を描画します。
  * **x1** *Integer*
    * X座標1
  * **y1** *Integer*
    * Y座標1
  * **x2** *Integer*
    * X座標2
  * **y2** *Integer*
    * Y座標2
  * **x3** *Integer*
    * X座標3
  * **y3** *Integer*
    * Y座標3
  * **color** *Array*
    * 色[ARGB]


----

#### triangle_fill 
* Imageオブジェクトの(x1, y1)-(x2, y2)-(x3, y3)を結ぶ三角形を描画し、塗りつぶします。
  * **x1** *Integer*
    * X座標1
  * **y1** *Integer*
    * Y座標1
  * **x2** *Integer*
    * X座標2
  * **y2** *Integer*
    * Y座標2
  * **x3** *Integer*
    * X座標3
  * **y3** *Integer*
    * Y座標3
  * **color** *Array*
    * 色[ARGB]


----

#### fill 
* Imageオブジェクトの全体をcolorで塗りつぶします。
  * **color** *Array*
    * 色[ARGB]


----

#### clear 
* Imageオブジェクトの全体を[0,0,0,0]で塗りつぶします。


----

#### copy_rect 
* selfのオブジェクトのx/yの位置に、imageで指定したオブジェクトのx1/y1/width/heightで指定した部分をコピーします。  
  α値を無視した単純コピーです。  
  自分自身にコピーすることはできません。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **image** *Image*
    * Imageオブジェクト
  * **x1** *Integer*
    * X座標1
  * **y1** *Integer*
    * Y座標1
  * **width** *Integer*
    * 横幅
  * **height** *Integer*
    * 高さ


----

#### draw 
* selfのオブジェクトのx/yの位置に、imageで指定したオブジェクトのx1/y1/width/heightで指定した部分をコピーします。  
  α値を考慮して半透明演算されます。  
  自分自身にコピーすることはできません。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **image** *Image*
    * Imageオブジェクト
  * **x1** *Integer*
    * X座標1
  * **y1** *Integer*
    * Y座標1
  * **width** *Integer*
    * 横幅
  * **height** *Integer*
    * 高さ


----

#### draw_font 
* selfのオブジェクトのx/yの位置に、fontで指定したフォントオブジェクトでstringを書き込みます。  
  colorは色配列で[r, g, b]を指定してください。  
  省略すると[255, 255, 255]の白文字となります。  
  [a, r, g, b]の形式でも指定は可能ですが、現在のバージョンではaは無視されます。  
  このメソッドでは文字列に"\n"を入れても改行することはできません。  
  文字コードはSJIS(Ruby1.8の場合)です。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **text** *String*
    * 書き込む文字列
  * **font** *Font*
    * フォントオブジェクト
  * **color** *Array*
    * RGB色配列


----

#### draw_font_ex 
* 高品質な文字の描画をします。  
  selfのオブジェクトのx/yの位置に、fontで指定したフォントオブジェクトでtextを書き込みます。  
  このメソッドでは文字列に"\n"を入れても改行することはできません。  
  文字コードはSJIS(Ruby1.8の場合)です。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **text** *String*
    * 書き込む文字列
  * **font** *Font*
    * フォントオブジェクト
  * **option** *Hash*
    * オプション
      * **:color** *Array* (default: [255,255,255])
        * RGB色配列でそれぞれ0～255、省略すると白文字になります。
      * **:edge** *Boolean* (default: false)
        * 袋文字を描画するかどうか。
      * **:edge_color** *Array* (default: [0,0,0])
        * 袋文字の枠色を指定します。配列で[R, G, B]、それぞれ0～255、省略すると[0, 0, 0]、黒い枠になります。
      * **:edge_width** *Integer* (default: 2)
        * 袋文字の枠の幅を0～の数値で指定します。1で1ピクセルとなります。
      * **:edge_level** *Integer* (default: 4)
        * 袋文字の枠の濃さを0～の数値で指定します。大きいほど濃くなりますが、幅が大きいほど薄くなります。値の制限はありませんが、目安としては一桁ぐらいが実用範囲でしょう。
      * **:shadow** *Boolean* (default: false)
        * 影を描画するかどうかをtrue/falseで指定します。
      * **:shadow_edge** *Boolean* (default: false)
        * edgeがtrueの場合に、枠の部分に対して影を付けるかどうかをtrue/falseで指定します。trueで枠の影が描かれます。
      * **:shadow_color** *Array* (default: [0,0,0])
        * 影の色を指定します。配列で[R, G, B]、それぞれ0～255、省略すると[0, 0, 0]、黒い影になります。
      * **:shadow_x** *Integer* (default: font.size/24+1)
        * 影の位置を相対座標で指定します。+1は1ピクセル右になります。省略するとフォントサイズ/24+1になります。
      * **:shadow_y** *Integer* (default: font.size/24+1)
        * 影の位置を相対座標で指定します。+1は1ピクセル下になります。省略するとフォントサイズ/24+1になります。
      * **:aa** *bool* (default: true)
        * アンチエイリアスの有無


----

#### save 
* selfの画像を指定のフォーマットで画像ファイルとして保存します。  
  省略するとファイル名の拡張子から自動判別されます。判別に失敗するとPNGになります。
  * **path** *String*
    * ファイルパス
  * **format** *Constant*
    * 保存形式（FORMAT_JPG/FORMAT_PNG/FORMAT_BMP/FORMAT_DDS）。


----

#### slice  -> Image
* selfの画像から、x/y/width/heightで表される部分を切り出して新たなImageオブジェクトを生成します。  
  DXRuby1.2.2で新しいテクスチャが作成されるようになりました。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **width** *Integer*
    * 横幅
  * **height** *Integer*
    * 高さ


----

#### slice_tiles  -> Array
* selfの画像を横・縦それぞれxcount個、ycount個に分割し、  
  左上から右に向かう順序でImageオブジェクトの配列を生成して返します。  
  DXRuby1.2.2で新しいテクスチャが作成されるようになりました。
  * **xcount** *Integer*
    * X軸分割数
  * **ycount** *Integer*
    * Y軸分割数


----

#### dup  -> Image
* selfをコピーして新たなImageオブジェクトを生成します。


----

#### clone  -> Image
* selfをコピーして新たなImageオブジェクトを生成します。


----

#### set_color_key 
* selfの画像で、colorで指定された色と同じ色のα値を0にします。  
  colorは3要素色配列の[r, g, b]で指定してください。  
  [a, r, g, b]で指定するとaは無視してRGBのみ比較されます。  
  * **color** *Array*
    * RGB色配列


----

#### width  -> Integer
* 画像の幅を取得します。


----

#### height  -> Integer
* 画像の高さを取得します。


----

#### flush 
* selfの透明じゃないピクセルをすべてcolorで指定した色に置き換えたImageオブジェクトを生成して返します。  
  colorが3要素配列の場合、元のピクセルのα値が保持されます。  
  半透明がある絵のフラッシュ後に半透明状態を残したい時にどうぞ。  
  4要素配列を指定するとα値も置き換えます。
  * **color** *Array*
    * RGB色配列


----

#### effect_image_font  -> Image
* selfの赤成分とα成分を合成し、それをグリフ情報として使ってdraw_font_exと同じエフェクトをかけたImageオブジェクトを生成して返します。hashはdraw_font_exのhashと同じです。  
  赤成分とα成分を合成するので例えばα255で白と黒のモノクロ画像や、αでアンチエイリアシングされた白黒モノクロ画像などを扱うことができます。白を赤に置き換えても同様です。
  * **option** *Hash*
    * オプション
      * **:color** *Array* (default: [255,255,255])
        * RGB色配列でそれぞれ0～255、省略すると白文字になります。
      * **:edge** *Boolean* (default: false)
        * 袋文字を描画するかどうか。
      * **:edge_color** *Array* (default: [0,0,0])
        * 袋文字の枠色を指定します。配列で[R, G, B]、それぞれ0～255、省略すると[0, 0, 0]、黒い枠になります。
      * **:edge_width** *Integer* (default: 2)
        * 袋文字の枠の幅を0～の数値で指定します。1で1ピクセルとなります。
      * **:edge_level** *Integer* (default: 4)
        * 袋文字の枠の濃さを0～の数値で指定します。大きいほど濃くなりますが、幅が大きいほど薄くなります。値の制限はありませんが、目安としては一桁ぐらいが実用範囲でしょう。
      * **:shadow** *Boolean* (default: false)
        * 影を描画するかどうかをtrue/falseで指定します。
      * **:shadow_edge** *Boolean* (default: false)
        * edgeがtrueの場合に、枠の部分に対して影を付けるかどうかをtrue/falseで指定します。trueで枠の影が描かれます。
      * **:shadow_color** *Array* (default: [0,0,0])
        * 影の色を指定します。配列で[R, G, B]、それぞれ0～255、省略すると[0, 0, 0]、黒い影になります。
      * **:shadow_x** *Integer* (default: font.size/24+1)
        * 影の位置を相対座標で指定します。+1は1ピクセル右になります。省略するとフォントサイズ/24+1になります。
      * **:shadow_y** *Integer* (default: font.size/24+1)
        * 影の位置を相対座標で指定します。+1は1ピクセル下になります。省略するとフォントサイズ/24+1になります。
      * **:aa** *bool* (default: true)
        * アンチエイリアスの有無


----

#### change_hls  -> Image
* selfに対して色相、輝度、彩度それぞれの差分を加えたImageオブジェクトを生成して返します。  
  引数はすべて整数です。
  * **hue** *Integer*
    * 色相。360度系なので、-360もしくは+360すると一周して同じ色になります。
  * **luminance** *Integer*
    * 輝度で、-100すると真っ黒、+100すると真っ白になります。
  * **saturation** *Integer*
    * 彩度で、-100するとモノクロ、+100すると最も鮮やかになります。



