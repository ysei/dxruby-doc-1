## class Image
### 要約

画像を表すクラスです。

### 目次

<a href='#Image.new'>new</a>
<a href='#Image.load'>load</a>
<a href='#Image.load_tiles'>load_tiles</a>
<a href='#Image.create_from_array'>create_from_array</a>
<a href='#Image.load_from_file_in_memory'>load_from_file_in_memory</a>
<a href='#Image_23dispose'>dispose</a>
<a href='#Image_23delayed_dispose'>delayed_dispose</a>
<a href='#Image_23disposed_3F'>disposed?</a>
<a href='#Image_23_5B_5D'>[]</a>
<a href='#Image_23_5B_5D_3D'>[]=</a>
<a href='#Image_23compare'>compare</a>
<a href='#Image_23line'>line</a>
<a href='#Image_23box'>box</a>
<a href='#Image_23box_fill'>box_fill</a>
<a href='#Image_23circle'>circle</a>
<a href='#Image_23circle_fill'>circle_fill</a>
<a href='#Image_23triangle'>triangle</a>
<a href='#Image_23triangle_fill'>triangle_fill</a>
<a href='#Image_23fill'>fill</a>
<a href='#Image_23clear'>clear</a>
<a href='#Image_23copy_rect'>copy_rect</a>
<a href='#Image_23draw'>draw</a>
<a href='#Image_23draw_font'>draw_font</a>
<a href='#Image_23draw_font_ex'>draw_font_ex</a>
<a href='#Image_23save'>save</a>
<a href='#Image_23slice'>slice</a>
<a href='#Image_23slice_tiles'>slice_tiles</a>
<a href='#Image_23dup'>dup</a>
<a href='#Image_23clone'>clone</a>
<a href='#Image_23set_color_key'>set_color_key</a>
<a href='#Image_23width'>width</a>
<a href='#Image_23height'>height</a>
<a href='#Image_23flush'>flush</a>
<a href='#Image_23effect_image_font'>effect_image_font</a>
<a href='#Image_23change_hls'>change_hls</a>

----

### 特異メソッド

<a name='Image.new'></a>
#### new(width, height, color=[0,0,0,0]) -> Image
* Imageオブジェクトを生成して返します。
  * **width** *Integer*
    * 横幅
  * **height** *Integer*
    * 高さ
  * **color** *Array*
    * ARGB順（それぞれ0～255）の配列。指定すると生成時に全体が指定色に塗られます。  
      省略すると[0,0,0,0]の透明色になります。update時、描画処理前にcolor指定色でクリアされます。




<a name='Image.load'></a>
#### load(path, x=nil, y=nil, width=nil, height=nil) -> Image
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




<a name='Image.load_tiles'></a>
#### load_tiles(path, xcount, ycount, share_switch=true) -> Array
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




<a name='Image.create_from_array'></a>
#### create_from_array(width, height, array) -> Image
* 色情報を格納した配列からImageオブジェクトを生成して返します。  
  配列はalpha, red, green, blueの４つをピクセル数分並べたものです。  
  例)32×32ピクセルの白い四角は[255, 255, 255, 255] * 32 * 32と指定します。
  * **width** *Integer*
    * 横幅
  * **height** *Integer*
    * 高さ
  * **array** *Array*
    * 色情報(ARGB)を格納した配列




<a name='Image.load_from_file_in_memory'></a>
#### load_from_file_in_memory(binary_data) -> Image
* メモリ上のデータからImageオブジェクトを生成します。
  * **binary_data** *String*
    * 画像ファイルのバイナリ


----

### インスタンスメソッド

<a name='Image_23dispose'></a>
#### dispose
* selfの画像リソースを解放します。  
  使わなくなったデータをdisposeしておくと、PCのメインメモリやビデオメモリを節約することができ、また、GC時の負荷も軽くなります。  
  dispose後、そのオブジェクトのメソッドを呼び出すと例外が発生します。




<a name='Image_23delayed_dispose'></a>
#### delayed_dispose
* selfの画像リソースを、delayed_disposeが呼ばれたフレームの描画処理が終わった後に解放します。  
  あるフレームで生成し、そのフレームの描画のみで使うImageがあった場合に、次フレームでdisposeするのは面倒ですが、このメソッドでdispose予約ができます。  
  次のフレーム以降、そのオブジェクトのメソッドを呼び出すと例外が発生します。




<a name='Image_23disposed_3F'></a>
#### disposed? -> bool
* selfがdisposeされているかどうかをtrue/falseで返します。




<a name='Image_23_5B_5D'></a>
#### [](x, y) -> Array
* Imageオブジェクトの該当ピクセルの色を配列で取得します。  
  配列はARGB順となります。  
  それぞれ0～255の範囲です。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標




<a name='Image_23_5B_5D_3D'></a>
#### []=(x, y, color)
* Imageオブジェクトの該当ピクセルに色を設定します。  
  colorは配列で、ARGB順（0～255）で指定します。  
  [r, g, b]で渡すとaは255になります。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **color** *Array*
    * ARGB順（それぞれ0～255）の配列。指定すると生成時に全体が指定色に塗られます。  
      省略すると[0,0,0,0]の透明色になります。update時、描画処理前にcolor指定色でクリアされます。




<a name='Image_23compare'></a>
#### compare(x, y, color)
* Imageオブジェクトの該当ピクセルの色がcolorと一致するかどうかをtrue/falseで返します。  
  colorは配列で、[a, r, g, b]と指定します。  
  それぞれ0～255の範囲です。  
  [r, g, b]で渡すとaは比較されません。  
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **color** *Array*
    * ARGB順（それぞれ0～255）の配列。指定すると生成時に全体が指定色に塗られます。  
      省略すると[0,0,0,0]の透明色になります。update時、描画処理前にcolor指定色でクリアされます。




<a name='Image_23line'></a>
#### line(x1, y1, x2, y2, color)
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
    * ARGB順（それぞれ0～255）の配列。指定すると生成時に全体が指定色に塗られます。  
      省略すると[0,0,0,0]の透明色になります。update時、描画処理前にcolor指定色でクリアされます。




<a name='Image_23box'></a>
#### box(x1, y1, x2, y2, color)
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
    * ARGB順（それぞれ0～255）の配列。指定すると生成時に全体が指定色に塗られます。  
      省略すると[0,0,0,0]の透明色になります。update時、描画処理前にcolor指定色でクリアされます。




<a name='Image_23box_fill'></a>
#### box_fill(x1, y1, x2, y2, color)
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
    * ARGB順（それぞれ0～255）の配列。指定すると生成時に全体が指定色に塗られます。  
      省略すると[0,0,0,0]の透明色になります。update時、描画処理前にcolor指定色でクリアされます。




<a name='Image_23circle'></a>
#### circle(x, y, r, color)
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
    * ARGB順（それぞれ0～255）の配列。指定すると生成時に全体が指定色に塗られます。  
      省略すると[0,0,0,0]の透明色になります。update時、描画処理前にcolor指定色でクリアされます。




<a name='Image_23circle_fill'></a>
#### circle_fill(x, y, r, color)
* Imageオブジェクトの(x,y)を中心とした半径rの円を描き、塗りつぶします。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **r** *Integer*
    * 円の半径
  * **color** *Array*
    * ARGB順（それぞれ0～255）の配列。指定すると生成時に全体が指定色に塗られます。  
      省略すると[0,0,0,0]の透明色になります。update時、描画処理前にcolor指定色でクリアされます。




<a name='Image_23triangle'></a>
#### triangle(x1, y1, x2, y2, x3, y3, color)
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
    * ARGB順（それぞれ0～255）の配列。指定すると生成時に全体が指定色に塗られます。  
      省略すると[0,0,0,0]の透明色になります。update時、描画処理前にcolor指定色でクリアされます。




<a name='Image_23triangle_fill'></a>
#### triangle_fill(x1, y1, x2, y2, x3, y3, color)
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
    * ARGB順（それぞれ0～255）の配列。指定すると生成時に全体が指定色に塗られます。  
      省略すると[0,0,0,0]の透明色になります。update時、描画処理前にcolor指定色でクリアされます。




<a name='Image_23fill'></a>
#### fill(color)
* Imageオブジェクトの全体をcolorで塗りつぶします。
  * **color** *Array*
    * ARGB順（それぞれ0～255）の配列。指定すると生成時に全体が指定色に塗られます。  
      省略すると[0,0,0,0]の透明色になります。update時、描画処理前にcolor指定色でクリアされます。




<a name='Image_23clear'></a>
#### clear
* Imageオブジェクトの全体を[0,0,0,0]で塗りつぶします。




<a name='Image_23copy_rect'></a>
#### copy_rect(x, y, image, x1=0, y1=0, width=image.width, height=image.height)
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




<a name='Image_23draw'></a>
#### draw(x, y, image, x1=0, y1=0, width=image.width, height=image.height)
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




<a name='Image_23draw_font'></a>
#### draw_font(x, y, text, font, color=[255,255,255])
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




<a name='Image_23draw_font_ex'></a>
#### draw_font_ex(x, y, text, font, option={})
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
      * **:edge** *bool* (default: false)
        * 袋文字を描画するかどうか。
      * **:edge_color** *Array* (default: [0,0,0])
        * 袋文字の枠色を指定します。配列で[R, G, B]、それぞれ0～255、省略すると[0, 0, 0]、黒い枠になります。
      * **:edge_width** *Integer* (default: 2)
        * 袋文字の枠の幅を0～の数値で指定します。1で1ピクセルとなります。
      * **:edge_level** *Integer* (default: 4)
        * 袋文字の枠の濃さを0～の数値で指定します。大きいほど濃くなりますが、幅が大きいほど薄くなります。値の制限はありませんが、目安としては一桁ぐらいが実用範囲でしょう。
      * **:shadow** *bool* (default: false)
        * 影を描画するかどうかをtrue/falseで指定します。
      * **:shadow_edge** *bool* (default: false)
        * edgeがtrueの場合に、枠の部分に対して影を付けるかどうかをtrue/falseで指定します。trueで枠の影が描かれます。
      * **:shadow_color** *Array* (default: [0,0,0])
        * 影の色を指定します。配列で[R, G, B]、それぞれ0～255、省略すると[0, 0, 0]、黒い影になります。
      * **:shadow_x** *Integer* (default: font.size/24+1)
        * 影の位置を相対座標で指定します。+1は1ピクセル右になります。省略するとフォントサイズ/24+1になります。
      * **:shadow_y** *Integer* (default: font.size/24+1)
        * 影の位置を相対座標で指定します。+1は1ピクセル下になります。省略するとフォントサイズ/24+1になります。
      * **:aa** *bool* (default: true)
        * アンチエイリアスの有無




<a name='Image_23save'></a>
#### save(path, format=nil)
* selfの画像を指定のフォーマットで画像ファイルとして保存します。  
  省略するとファイル名の拡張子から自動判別されます。判別に失敗するとPNGになります。
  * **path** *String*
    * ファイルパス
  * **format** *Constant*
    * 保存形式（FORMAT_JPG/FORMAT_PNG/FORMAT_BMP/FORMAT_DDS）。




<a name='Image_23slice'></a>
#### slice(x, y, width, height) -> Image
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




<a name='Image_23slice_tiles'></a>
#### slice_tiles(xcount, ycount) -> Array
* selfの画像を横・縦それぞれxcount個、ycount個に分割し、  
  左上から右に向かう順序でImageオブジェクトの配列を生成して返します。  
  DXRuby1.2.2で新しいテクスチャが作成されるようになりました。
  * **xcount** *Integer*
    * X軸分割数
  * **ycount** *Integer*
    * Y軸分割数




<a name='Image_23dup'></a>
#### dup -> Image
* selfをコピーして新たなImageオブジェクトを生成します。




<a name='Image_23clone'></a>
#### clone -> Image
* selfをコピーして新たなImageオブジェクトを生成します。




<a name='Image_23set_color_key'></a>
#### set_color_key(color)
* selfの画像で、colorで指定された色と同じ色のα値を0にします。  
  colorは3要素色配列の[r, g, b]で指定してください。  
  [a, r, g, b]で指定するとaは無視してRGBのみ比較されます。  
  * **color** *Array*
    * RGB色配列




<a name='Image_23width'></a>
#### width -> Integer
* 画像の幅を取得します。




<a name='Image_23height'></a>
#### height -> Integer
* 画像の高さを取得します。




<a name='Image_23flush'></a>
#### flush(color)
* selfの透明じゃないピクセルをすべてcolorで指定した色に置き換えたImageオブジェクトを生成して返します。  
  colorが3要素配列の場合、元のピクセルのα値が保持されます。  
  半透明がある絵のフラッシュ後に半透明状態を残したい時にどうぞ。  
  4要素配列を指定するとα値も置き換えます。
  * **color** *Array*
    * RGB色配列
* NOTE
  * 遅いのでリアルタイムで毎フレーム実行することはお勧めしません。





<a name='Image_23effect_image_font'></a>
#### effect_image_font(option={}) -> Image
* selfの赤成分とα成分を合成し、それをグリフ情報として使ってdraw_font_exと同じエフェクトをかけたImageオブジェクトを生成して返します。hashはdraw_font_exのhashと同じです。  
  赤成分とα成分を合成するので例えばα255で白と黒のモノクロ画像や、αでアンチエイリアシングされた白黒モノクロ画像などを扱うことができます。白を赤に置き換えても同様です。
  * **option** *Hash*
    * オプション
      * **:color** *Array* (default: [255,255,255])
        * RGB色配列でそれぞれ0～255、省略すると白文字になります。
      * **:edge** *bool* (default: false)
        * 袋文字を描画するかどうか。
      * **:edge_color** *Array* (default: [0,0,0])
        * 袋文字の枠色を指定します。配列で[R, G, B]、それぞれ0～255、省略すると[0, 0, 0]、黒い枠になります。
      * **:edge_width** *Integer* (default: 2)
        * 袋文字の枠の幅を0～の数値で指定します。1で1ピクセルとなります。
      * **:edge_level** *Integer* (default: 4)
        * 袋文字の枠の濃さを0～の数値で指定します。大きいほど濃くなりますが、幅が大きいほど薄くなります。値の制限はありませんが、目安としては一桁ぐらいが実用範囲でしょう。
      * **:shadow** *bool* (default: false)
        * 影を描画するかどうかをtrue/falseで指定します。
      * **:shadow_edge** *bool* (default: false)
        * edgeがtrueの場合に、枠の部分に対して影を付けるかどうかをtrue/falseで指定します。trueで枠の影が描かれます。
      * **:shadow_color** *Array* (default: [0,0,0])
        * 影の色を指定します。配列で[R, G, B]、それぞれ0～255、省略すると[0, 0, 0]、黒い影になります。
      * **:shadow_x** *Integer* (default: font.size/24+1)
        * 影の位置を相対座標で指定します。+1は1ピクセル右になります。省略するとフォントサイズ/24+1になります。
      * **:shadow_y** *Integer* (default: font.size/24+1)
        * 影の位置を相対座標で指定します。+1は1ピクセル下になります。省略するとフォントサイズ/24+1になります。
      * **:aa** *bool* (default: true)
        * アンチエイリアスの有無
* NOTE
  * 遅いのでリアルタイムで毎フレーム実行することはお勧めしません。





<a name='Image_23change_hls'></a>
#### change_hls(hue, luminance, saturation) -> Image
* selfに対して色相、輝度、彩度それぞれの差分を加えたImageオブジェクトを生成して返します。  
  引数はすべて整数です。
  * **hue** *Integer*
    * 色相。360度系なので、-360もしくは+360すると一周して同じ色になります。
  * **luminance** *Integer*
    * 輝度で、-100すると真っ黒、+100すると真っ白になります。
  * **saturation** *Integer*
    * 彩度で、-100するとモノクロ、+100すると最も鮮やかになります。
* NOTE
  * 遅いのでリアルタイムで毎フレーム実行することはお勧めしません。





