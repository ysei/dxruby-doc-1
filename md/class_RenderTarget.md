## class RenderTarget
### 要約

RenderTragetは画像イメージを持ち、ハードウェア描画の対象に指定できるオブジェクトです。  
Window.draw系のメソッドは画面に直接描画しますが、RenderTarget#draw系のメソッドはレシーバのRenderTargetオブジェクトに対して描画します。  
また、Window.draw系/RenderTarget#draw系メソッドの引数でImageオブジェクトの代わりに渡して、画面や他のRenderTargetに描画することもできます。  
基本的な使い方は、RenderTarget.newして、RenderTarget#draw系メソッドで描画、Window.draw系/RenderTarget#draw系メソッドでimageに指定して使う、という流れになります。  
　@note このメソッドでは"\n"を入れても改行することはできません。

### 目次

<a href='#RenderTarget.new'>new</a>
<a href='#RenderTarget_23dispose'>dispose</a>
<a href='#RenderTarget_23disposed_3F'>disposed?</a>
<a href='#RenderTarget_23draw'>draw</a>
<a href='#RenderTarget_23draw_scale'>draw_scale</a>
<a href='#RenderTarget_23draw_rot'>draw_rot</a>
<a href='#RenderTarget_23draw_alpha'>draw_alpha</a>
<a href='#RenderTarget_23draw_add'>draw_add</a>
<a href='#RenderTarget_23draw_sub'>draw_sub</a>
<a href='#RenderTarget_23draw_shader'>draw_shader</a>
<a href='#RenderTarget_23draw_ex'>draw_ex</a>
<a href='#RenderTarget_23draw_font'>draw_font</a>
<a href='#RenderTarget_23draw_font_ex'>draw_font_ex</a>
<a href='#RenderTarget_23draw_morph'>draw_morph</a>
<a href='#RenderTarget_23draw_tile'>draw_tile</a>
<a href='#RenderTarget_23draw_line'>draw_line</a>
<a href='#RenderTarget_23draw_box_fill'>draw_box_fill</a>
<a href='#RenderTarget_23update'>update</a>
<a href='#RenderTarget_23width'>width</a>
<a href='#RenderTarget_23height'>height</a>
<a href='#RenderTarget_23bgcolor'>bgcolor</a>
<a href='#RenderTarget_23bgcolor_3D'>bgcolor=</a>
<a href='#RenderTarget_23min_filter'>min_filter</a>
<a href='#RenderTarget_23min_filter_3D'>min_filter=</a>
<a href='#RenderTarget_23mag_filter'>mag_filter</a>
<a href='#RenderTarget_23mag_filter_3D'>mag_filter=</a>
<a href='#RenderTarget_23to_image'>to_image</a>
<a href='#RenderTarget_23discard'>discard</a>
<a href='#RenderTarget_23decide'>decide</a>
<a href='#RenderTarget_23resize'>resize</a>
<a href='#RenderTarget_23ox'>ox</a>
<a href='#RenderTarget_23ox_3D'>ox=</a>
<a href='#RenderTarget_23oy'>oy</a>
<a href='#RenderTarget_23oy_3D'>oy=</a>

----

### 特異メソッド

<a name='RenderTarget.new'></a>
#### new(width, height, bgcolor=[0,0,0,0])
* RenderTargetオブジェクトを生成して返します。
  * **width** *Integer*
    * 横幅
  * **height** *Integer*
    * 高さ
  * **bgcolor** *Array*
    * ARGB順（それぞれ0～255）の配列。指定すると生成時に全体が指定色に塗られます。  
      省略すると[0,0,0,0]の透明色になります。update時、描画処理前に指定色でクリアされます。


----

### インスタンスメソッド

<a name='RenderTarget_23dispose'></a>
#### dispose
* selfの画像リソースを解放します。  
  使わなくなったデータをdisposeしておくと、PCのメインメモリやビデオメモリを節約することができ、また、GC時の負荷も軽くなります。  
  dispose後、そのオブジェクトのメソッドを呼び出すと例外が発生します。




<a name='RenderTarget_23disposed_3F'></a>
#### disposed? -> bool
* selfがdisposeされているかどうかをtrue/falseで返します。




<a name='RenderTarget_23draw'></a>
#### draw(x, y, image, z=0) -> nil
* 単純描画をします。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **image** *Image|RenderTarget*
    * 描画元の画像オブジェクト
  * **z** *Integer|Float*
    * 描画順序。  
      小さいほど奥になり、同じ値の場合は最初にdrawしたものが一番奥になります。




<a name='RenderTarget_23draw_scale'></a>
#### draw_scale(x, y, image, scale_x, scale_y, center_x=nil, center_y=nil, z=0) -> nil
* 縦、横の拡大率を指定して描画します。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **image** *Image|RenderTarget*
    * 描画元の画像オブジェクト
  * **scale_x** *Float*
    * X方向の拡大率。1が等倍、-1で上下反転します。
  * **scale_y** *Float*
    * Y方向の拡大率。1が等倍、-1で左右反転します。
  * **center_x** *Integer*
    * 画像の拡大中心とするX座標。nilの場合は画像中央になります。
  * **center_y** *Integer*
    * 画像の拡大中心とするY座標。nilの場合は画像中央になります。
  * **z** *Integer|Float*
    * 描画順序。  
      小さいほど奥になり、同じ値の場合は最初にdrawしたものが一番奥になります。




<a name='RenderTarget_23draw_rot'></a>
#### draw_rot(x, y, image, angle, center_x=nil, center_y=nil, z=0)
* 回転角度と中心を指定して描画します。  
  center_x/center_y省略時は画像の中心を原点として回転します。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **image** *Image|RenderTarget*
    * 描画元の画像オブジェクト
  * **angle** *Integer*
    * 回転角度。0を基準として時計回りに360で一周します。
  * **center_x** *Integer*
    * 画像の回転中心とするX座標。
  * **center_y** *Integer*
    * 画像の回転中心とするY座標。
  * **z** *Integer|Float*
    * 描画順序。  
      小さいほど奥になり、同じ値の場合は最初にdrawしたものが一番奥になります。




<a name='RenderTarget_23draw_alpha'></a>
#### draw_alpha(x, y, image, alpha, z=0)
* アルファ値を指定して描画します。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **image** *Image|RenderTarget*
    * 描画元の画像オブジェクト
  * **alpha** *Integer*
    * アルファ値。範囲は0(完全に透明)から255(完全に不透明)までです。
  * **z** *Integer|Float*
    * 描画順序。  
      小さいほど奥になり、同じ値の場合は最初にdrawしたものが一番奥になります。




<a name='RenderTarget_23draw_add'></a>
#### draw_add(x, y, image, z=0)
* 加算合成描画をします。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **image** *Image|RenderTarget*
    * 描画元の画像オブジェクト
  * **z** *Integer|Float*
    * 描画順序。  
      小さいほど奥になり、同じ値の場合は最初にdrawしたものが一番奥になります。




<a name='RenderTarget_23draw_sub'></a>
#### draw_sub(x, y, image, z=0)
* 減算合成描画をします。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **image** *Image|RenderTarget*
    * 描画元の画像オブジェクト
  * **z** *Integer|Float*
    * 描画順序。  
      小さいほど奥になり、同じ値の場合は最初にdrawしたものが一番奥になります。




<a name='RenderTarget_23draw_shader'></a>
#### draw_shader(x, y, image, shader, z=0)
* シェーダ処理を適用して描画します。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **image** *Image|RenderTarget*
    * 描画元の画像オブジェクト
  * **shader** *Shader*
    * 適用するShaderオブジェクト
  * **z** *Integer|Float*
    * 描画順序。  
      小さいほど奥になり、同じ値の場合は最初にdrawしたものが一番奥になります。




<a name='RenderTarget_23draw_ex'></a>
#### draw_ex(x, y, image, option={})
* 拡縮、回転、半透明、加算合成を一括指定して描画します。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **image** *Image|RenderTarget*
    * 描画元の画像オブジェクト
  * **option** *Hash*
    * オプション
      * **:scale_x** *Float* (default: 1)
        * 横の拡大率。
      * **:scale_y** *Float* (default: 1)
        * 縦の拡大率。
      * **:center_x** *Integer* (default: nil)
        * 回転、拡大の中心X座標。nilで画像の中心になります。
      * **:center_y** *Integer* (default: nil)
        * 回転、拡大の中心Y座標。nilで画像の中心になります。
      * **:alpha** *Integer* (default: 255)
        * アルファ値(0～255)。
      * **:blend** *Symbol* (default: :alpha)
        * :blend :alpha、:none、:add、:add2、:subで合成方法を指定。:noneは透明色、半透明色もそのまま上書き描画します。:addはソースにアルファ値を、:add2は背景に255-アルファ値を適用します。:subはアルファ値を全ての色の合成に、:sub2はRGBの色をそれぞれ別々に合成に適用します。
      * **:color** *Array* (default: [255,255,255])
        * [R, G, B]で、それぞれ0～255、省略すると[255, 255, 255](白文字)になります。
      * **:angle** *Integer* (default: 0)
        * 360度系で画像の回転角度を指定します。拡大率と同時に指定した場合は拡大率が先に適用されます。
      * **:z** *Integer|Float* (default: 0)
        * 描画順序。  
          小さいほど奥になり、同じ値の場合は最初にdrawしたものが一番奥になります。
      * **:offset_sync** *bool* (default: false)
        * 描画時の指定座標x/yに、画像のcenter_x/yで指定した位置が来るように補正されます。




<a name='RenderTarget_23draw_font'></a>
#### draw_font(x, y, text, font, option={})
* 文字の描画をします。"\n"を入れると改行することができます。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **text** *String*
    * 描画する文字列
  * **font** *Font*
    * フォントオブジェクト
  * **option** *Hash*
    * オプション
      * **:scale_x** *Float* (default: 1)
        * 横の拡大率。
      * **:scale_y** *Float* (default: 1)
        * 縦の拡大率。
      * **:center_x** *Integer* (default: nil)
        * 回転、拡大の中心X座標。nilで画像の中心になります。
      * **:center_y** *Integer* (default: nil)
        * 回転、拡大の中心Y座標。nilで画像の中心になります。
      * **:alpha** *Integer* (default: 255)
        * アルファ値(0～255)。
      * **:blend** *Symbol* (default: :alpha)
        * :blend :alpha、:none、:add、:add2、:subで合成方法を指定。:noneは透明色、半透明色もそのまま上書き描画します。:addはソースにアルファ値を、:add2は背景に255-アルファ値を適用します。:subはアルファ値を全ての色の合成に、:sub2はRGBの色をそれぞれ別々に合成に適用します。
      * **:color** *Array* (default: [255,255,255])
        * [R, G, B]で、それぞれ0～255、省略すると[255, 255, 255](白文字)になります。
      * **:angle** *Integer* (default: 0)
        * 360度系で画像の回転角度を指定します。拡大率と同時に指定した場合は拡大率が先に適用されます。
      * **:z** *Integer|Float* (default: 0)
        * 描画順序。  
          小さいほど奥になり、同じ値の場合は最初にdrawしたものが一番奥になります。




<a name='RenderTarget_23draw_font_ex'></a>
#### draw_font_ex(x, y, text, font, option={})
* 高品質な文字の描画をします。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
  * **text** *String*
    * 描画する文字列
  * **font** *Font*
    * フォントオブジェクト
  * **option** *Hash*
    * オプション
      * **:scale_x** *Float* (default: 1)
        * 横の拡大率。
      * **:scale_y** *Float* (default: 1)
        * 縦の拡大率。
      * **:center_x** *Integer* (default: nil)
        * 回転、拡大の中心X座標。nilで画像の中心になります。
      * **:center_y** *Integer* (default: nil)
        * 回転、拡大の中心Y座標。nilで画像の中心になります。
      * **:alpha** *Integer* (default: 255)
        * アルファ値(0～255)。
      * **:blend** *Symbol* (default: :alpha)
        * :blend :alpha、:none、:add、:add2、:subで合成方法を指定。:noneは透明色、半透明色もそのまま上書き描画します。:addはソースにアルファ値を、:add2は背景に255-アルファ値を適用します。:subはアルファ値を全ての色の合成に、:sub2はRGBの色をそれぞれ別々に合成に適用します。
      * **:color** *Array* (default: [255,255,255])
        * [R, G, B]で、それぞれ0～255、省略すると[255, 255, 255](白文字)になります。
      * **:angle** *Integer* (default: 0)
        * 360度系で画像の回転角度を指定します。拡大率と同時に指定した場合は拡大率が先に適用されます。
      * **:edge** *bool* (default: false)
        * 袋文字を描画するかどうか
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
      * **:z** *Integer|Float* (default: 0)
        * 描画順序。  
          小さいほど奥になり、同じ値の場合は最初にdrawしたものが一番奥になります。




<a name='RenderTarget_23draw_morph'></a>
#### draw_morph(x1, y1, x2, y2, x3, y3, x4, y4, image, option={})
* 4点を自由に指定してimageを描画できます。これを使うと自在に変形した画像を描画することができます。  
  ただし、実際にはhashで指定するdividexとdivideyの数だけ絵を分割して変形しますので、分割数が少ない場合/描画面積が大きい場合に見え方がぎこちなくなることがあります。その場合は分割数を増やしてください。分割数を増やすと描画枚数が増えるのでパフォーマンスは下がります。  
  座標はx1から順に右回りで指定してください。順番が違う場合の描画結果は保証されません。
  * **x1** *Integer*
    * X1座標
  * **y1** *Integer*
    * Y1座標
  * **x2** *Integer*
    * X2座標
  * **y2** *Integer*
    * Y2座標
  * **x3** *Integer*
    * X3座標
  * **y3** *Integer*
    * Y3座標
  * **x4** *Integer*
    * X4座標
  * **y4** *Integer*
    * Y4座標
  * **image** *Image|RenderTarget*
    * 描画元の画像オブジェクト
  * **option** *Hash*
    * オプション
      * **:alpha** *Integer* (default: 255)
        * アルファ値(0～255)。
      * **:blend** *Symbol* (default: :alpha)
        * :blend :alpha、:none、:add、:add2、:subで合成方法を指定。:noneは透明色、半透明色もそのまま上書き描画します。:addはソースにアルファ値を、:add2は背景に255-アルファ値を適用します。:subはアルファ値を全ての色の合成に、:sub2はRGBの色をそれぞれ別々に合成に適用します。
      * **:dividex** *Integer* (default: 1)
        * 横の分割数
      * **:dividey** *Integer* (default: 1)
        * 縦の分割数
      * **:z** *Integer|Float* (default: 0)
        * 描画順序。  
          小さいほど奥になり、同じ値の場合は最初にdrawしたものが一番奥になります。
      * **:color** *Array* (default: [255,255,255])
        * [R, G, B]で、それぞれ0～255、省略すると[255, 255, 255](白文字)になります。




<a name='RenderTarget_23draw_tile'></a>
#### draw_tile(base_x, base_y, map, image_array, start_x, start_y, size_x, size_y, z=0)
* タイルチップと二次元配列を使ってマップ描画をします。  
  画像のサイズはimage_arrの先頭の画像から取得します。  
  すべて同じサイズのImageオブジェクトを使用してください。  
  描画範囲が2次元配列からはみ出した場合、自動的にループします。  
  ピクセル単位でスクロールさせることができますが、描画は上下左右に最大1枚分はみ出すため、  
  上に枠をかぶせて隠すように描画するか、RenderTargetに一度描画して範囲を制限するか、ウィンドウのサイズ全体に描画してはみ出した部分を描画されないようにするかしてください。   
  image_arrに配列を入れ子にすることができます。  
  Array#flatten的な処理がされて前から連番が振られますので、  
  同じサイズの配列であれば中身を差し替えることで簡単にアニメーションすることができます。 
  * **base_x** *Integer*
    * マップを描画する画面上の左上基点X座標を指定します。  
      ピクセル単位スクロールの都合上、実際の描画は左にはみ出すことがあります。  
      nilを指定するとRenderTarget#ox/oyの値に関わらず画面の左上固定となります。
  * **base_y** *Integer*
    * マップを描画する画面上の左上基点Y座標を指定します。  
      ピクセル単位スクロールの都合上、実際の描画は上にはみ出すことがあります。  
      nilを指定するとRenderTarget#ox/oyの値に関わらず画面の左上固定となります。
  * **map** *Array*
    * マップの二次元配列を指定します。中の値がimage配列の要素番号になります。
  * **image_array** *Array*
    * マップタイルのImageオブジェクト配列を指定します。
  * **start_x** *Integer*
    * マップ内の描画開始位置をピクセル単位で指定します。  
      nilを指定するとRenderTarget#oxの値によって開始位置が定まります。
  * **start_y** *Integer*
    * マップ内の描画開始位置をピクセル単位で指定します。  
      nilを指定するとRenderTarget#oyの値によって開始位置が定まります。
  * **size_x** *Integer*
    * 描画するマップタイルの枚数を縦横の数で指定します。  
      nilを指定するとRenderTargetサイズから適切な数が算出されます。
  * **size_y** *Integer*
    * 描画するマップタイルの枚数を縦横の数で指定します。  
      nilを指定するとRenderTargetサイズから適切な数が算出されます。
  * **z** *Integer|Float*
    * 描画順序。  
      小さいほど奥になり、同じ値の場合は最初にdrawしたものが一番奥になります。




<a name='RenderTarget_23draw_line'></a>
#### draw_line(x1, y1, x2, y2, color, z=0)
* 画面に(x1, y1)～(x2, y2)を結ぶ線を引きます。
  * **x1** *Integer*
    * 開始X座標。
  * **y1** *Integer*
    * 開始Y座標。
  * **x2** *Integer*
    * 終了X座標。
  * **y2** *Integer*
    * 終了Y座標。
  * **color** *Array*
    * [R, G, B]でそれぞれ0～255
  * **z** *Integer|Float*
    * 描画順序。  
      小さいほど奥になり、同じ値の場合は最初にdrawしたものが一番奥になります。




<a name='RenderTarget_23draw_box_fill'></a>
#### draw_box_fill(x1, y1, x2, y2, color, z=0)
* 画面に(x1, y1)～(x2, y2)を塗りつぶす矩形を描画します。
  * **x1** *Integer*
    * 開始X座標。
  * **y1** *Integer*
    * 開始Y座標。
  * **x2** *Integer*
    * 終了X座標。
  * **y2** *Integer*
    * 終了Y座標。
  * **color** *Array*
    * [R, G, B]でそれぞれ0～255
  * **z** *Integer|Float*
    * 描画順序。  
      小さいほど奥になり、同じ値の場合は最初にdrawしたものが一番奥になります。




<a name='RenderTarget_23update'></a>
#### update
* 描画を実行します。




<a name='RenderTarget_23width'></a>
#### width -> Integer
* RenderTargetの横幅を取得します。




<a name='RenderTarget_23height'></a>
#### height -> Integer
* RenderTargetの高さを取得します。




<a name='RenderTarget_23bgcolor'></a>
#### bgcolor -> Array
* 画面のクリア（RenderTarget#update時、描画処理前に自動的にされます）時に使う色を取得します。  
  色の指定はARGBもしくはRGBの配列です。




<a name='RenderTarget_23bgcolor_3D'></a>
#### bgcolor=(color)
* 画面のクリア（RenderTarget#update時、描画処理前に自動的にされます）時に使う色を設定します。
  * **color** *Array*
    * ARGBもしくはRGBの配列




<a name='RenderTarget_23min_filter'></a>
#### min_filter -> Constant
* draw_scaleやdraw_exのscale_x/yキーで縮小する場合に使用されるフィルタを取得します。
* SEE ALSO
  * <a href='#RenderTarget_23min_filter_3D'>RenderTarget#min_filter=</a>
  * <a href='#RenderTarget_23mag_filter'>RenderTarget#mag_filter</a>





<a name='RenderTarget_23min_filter_3D'></a>
#### min_filter=(filter)
* draw_scaleやdraw_exのscale_x/yキーで縮小する場合に使用されるフィルタを設定します。  
  この設定はWindow.scale=には反映されません。
  * **filter** *Constant*
    * 以下のフィルタ定数  
      TEXF_POINT 単純拡大・縮小フィルタ  
      TEXF_LINEAR 線形補間フィルタ（デフォルト）  
      TEXF_GAUSSIANQUAD 4-サンプルガウスフィルタ




<a name='RenderTarget_23mag_filter'></a>
#### mag_filter -> Constant
* draw_scaleやdraw_exのscale_x/yキーで拡大する場合に使用されるフィルタを取得します。
* SEE ALSO
  * <a href='#RenderTarget_23mag_filter_3D'>RenderTarget#mag_filter=</a>
  * <a href='#RenderTarget_23min_filter'>RenderTarget#min_filter</a>





<a name='RenderTarget_23mag_filter_3D'></a>
#### mag_filter=(filter)
* draw_scaleやdraw_exのscale_x/yキーで拡大する場合に使用されるフィルタを設定します。
  * **filter** *Constant*
    * 以下のフィルタ定数  
      TEXF_POINT 単純拡大・縮小フィルタ  
      TEXF_LINEAR 線形補間フィルタ（デフォルト）  
      TEXF_GAUSSIANQUAD 4-サンプルガウスフィルタ




<a name='RenderTarget_23to_image'></a>
#### to_image -> Image
* RenderTargetオブジェクトが保持する画像をImageオブジェクトに変換して返します。  
  このメソッドはかなり遅いので毎フレーム実行するようなことはなるべく避けてください。




<a name='RenderTarget_23discard'></a>
#### discard
* RenderTarget#draw系メソッドで描画した絵は描画予約されて、RenderTarget#update時に実際に描画されます。  
  描画される前にRenderTarget#discardを実行すると描画予約を消去することができます。  
  RenderTarget#decideを実行した場合、実行前の描画予約は消去されません。




<a name='RenderTarget_23decide'></a>
#### decide
* RenderTarget#draw系メソッドで描画した絵は描画予約されて、RenderTarget#update時に実際に描画されます。  
  RenderTarget#decideを実行すると、その時点での描画予約が確定されます。これはRenderTarget#discardでも消去されません。  
  このメソッドはRenderTarget#discardで消去されなくするためだけに存在するので、これを実行しないと描画されないということではありません。




<a name='RenderTarget_23resize'></a>
#### resize(x, y)
* サイズを変更します。中身は消去されます。描画予約は残ります。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標




<a name='RenderTarget_23ox'></a>
#### ox -> Integer
* X軸方向の描画位置補正を取得します。初期値は0です。  
  selfに対する描画のすべての座標に-oxを加算します。  
  画面をはみ出すような広大な座標系をイメージして、表示される範囲(画面)の左上座標がox/oyになるような感じです。  
  この指定はdraw系メソッドと、Sprite#targetにRenderTargetオブジェクトを指定したSpriteの描画、及び、衝突判定に影響します。




<a name='RenderTarget_23ox_3D'></a>
#### ox=(x)
* X軸方向の描画位置補正を設定します。初期値は0です。  
  selfに対する描画のすべての座標に-oxを加算します。  
  画面をはみ出すような広大な座標系をイメージして、表示される範囲(画面)の左上座標がox/oyになるような感じです。  
  この指定はdraw系メソッドと、Sprite#targetにRenderTargetオブジェクトを指定したSpriteの描画、及び、衝突判定に影響します。
  * **x** *Integer*
    * X座標




<a name='RenderTarget_23oy'></a>
#### oy -> Integer
* Y軸方向の描画位置補正を取得します。初期値は0です。  
  selfに対する描画のすべての座標に-oyを加算します。  
  画面をはみ出すような広大な座標系をイメージして、表示される範囲(画面)の左上座標がox/oyになるような感じです。  
  この指定はdraw系メソッドと、Sprite#targetにRenderTargetオブジェクトを指定したSpriteの描画、及び、衝突判定に影響します。




<a name='RenderTarget_23oy_3D'></a>
#### oy=(y)
* Y軸方向の描画位置補正を設定します。初期値は0です。  
  selfに対する描画のすべての座標に-oyを加算します。  
  画面をはみ出すような広大な座標系をイメージして、表示される範囲(画面)の左上座標がox/oyになるような感じです。  
  この指定はdraw系メソッドと、Sprite#targetにRenderTargetオブジェクトを指定したSpriteの描画、及び、衝突判定に影響します。
  * **y** *Integer*
    * Y座標




