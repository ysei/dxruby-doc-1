
class RenderTarget
  RenderTragetは画像イメージを持ち、ハードウェア描画の対象に指定できるオブジェクトです。
  Window.draw系のメソッドは画面に直接描画しますが、RenderTarget#draw系のメソッドはレシーバのRenderTargetオブジェクトに対して描画します。
  また、Window.draw系/RenderTarget#draw系メソッドの引数でImageオブジェクトの代わりに渡して、画面や他のRenderTargetに描画することもできます。
  基本的な使い方は、RenderTarget.newして、RenderTarget#draw系メソッドで描画、Window.draw系/RenderTarget#draw系メソッドでimageに指定して使う、という流れになります。
  
  
  def self.new(width, height, bgcolor=[0,0,0,0])
    RenderTargetオブジェクトを生成して返します。
    @param width  Integer 横幅
    @param height Integer 高さ
    @param bgcolor Array ARGB順（それぞれ0～255）の配列。指定すると生成時に全体が指定色に塗られます。
      省略すると[0,0,0,0]の透明色になります。update時、描画処理前に指定色でクリアされます。
  
  
  def dispose
    selfの画像リソースを解放します。
    使わなくなったデータをdisposeしておくと、PCのメインメモリやビデオメモリを節約することができ、また、GC時の負荷も軽くなります。
    dispose後、そのオブジェクトのメソッドを呼び出すと例外が発生します。
  
  
  def disposed? -> bool
     selfがdisposeされているかどうかをtrue/falseで返します。


  def draw(x, y, image, z=0) -> nil
    単純描画をします。
    @param x Integer X座標
    @param y Integer Y座標
    @param image Image|RenderTarget 描画元の画像オブジェクト
    @param z Integer|Float 描画順序。
      小さいほど奥になり、同じ値の場合は最初にdrawしたものが一番奥になります。


  def draw_scale(x, y, image, scale_x, scale_y, center_x=nil, center_y=nil, z=0) -> nil
    縦、横の拡大率を指定して描画します。
    @param scale_x Float X方向の拡大率。1が等倍、-1で上下反転します。
    @param scale_y Float Y方向の拡大率。1が等倍、-1で左右反転します。
    @param center_x Integer 画像の拡大中心とするX座標。nilの場合は画像中央になります。
    @param center_y Integer 画像の拡大中心とするY座標。nilの場合は画像中央になります。

    
  def draw_rot(x, y, image, angle, center_x=nil, center_y=nil, z=0)
    回転角度と中心を指定して描画します。
    center_x/center_y省略時は画像の中心を原点として回転します。
    @param angle Integer 回転角度。0を基準として時計回りに360で一周します。
    @param center_x Integer 画像の回転中心とするX座標。
    @param center_y Integer 画像の回転中心とするY座標。


  def draw_alpha(x, y, image, alpha, z=0)
    アルファ値を指定して描画します。
    @param alpha Integer アルファ値。範囲は0(完全に透明)から255(完全に不透明)までです。


  def draw_add(x, y, image, z=0)
    加算合成描画をします。


  def draw_sub(x, y, image, z=0)
    減算合成描画をします。
  
  
  def draw_shader(x, y, image, shader, z=0)
    シェーダ処理を適用して描画します。
    @param shader Shader 適用するShaderオブジェクト


  def draw_ex(x, y, image, option={})
    拡縮、回転、半透明、加算合成を一括指定して描画します。
    @param option Hash オプション
    @option :scale_x Float 1 横の拡大率。
    @option :scale_y Float 1 縦の拡大率。
    @option :center_x Integer nil 回転、拡大の中心X座標。nilで画像の中心になります。
    @option :center_y Integer nil 回転、拡大の中心Y座標。nilで画像の中心になります。
    @option :alpha Integer 255 アルファ値(0～255)。
    @option :blend Symbol :alpha :blend :alpha、:none、:add、:add2、:subで合成方法を指定。:noneは透明色、半透明色もそのまま上書き描画します。:addはソースにアルファ値を、:add2は背景に255-アルファ値を適用します。:subはアルファ値を全ての色の合成に、:sub2はRGBの色をそれぞれ別々に合成に適用します。
    @option :color Array [255,255,255] [R, G, B]で、それぞれ0～255、省略すると[255, 255, 255](白文字)になります。
    @option :angle Integer 0 360度系で画像の回転角度を指定します。拡大率と同時に指定した場合は拡大率が先に適用されます。
    @option :z Integer|Float 0 描画順序。
      小さいほど奥になり、同じ値の場合は最初にdrawしたものが一番奥になります。
    @option :offset_sync bool false 描画時の指定座標x/yに、画像のcenter_x/yで指定した位置が来るように補正されます。


  def draw_font(x, y, text, font, option={})
    文字の描画をします。"\n"を入れると改行することができます。
    @param font Font フォントオブジェクト
    @param text String 描画する文字列
    @option :scale_x
    @option :scale_y
    @option :center_x
    @option :center_y
    @option :alpha
    @option :blend
    @option :color
    @option :angle
    @option :z


  def draw_font_ex(x, y, text, font, option={})
    高品質な文字の描画をします。
    @option :scale_x
    @option :scale_y
    @option :center_x
    @option :center_y
    @option :alpha
    @option :blend
    @option :color
    @option :angle
    @option :edge bool false 袋文字を描画するかどうか
    @option :edge_color Array [0,0,0] 袋文字の枠色を指定します。配列で[R, G, B]、それぞれ0～255、省略すると[0, 0, 0]、黒い枠になります。
    @option :edge_width Integer 2 袋文字の枠の幅を0～の数値で指定します。1で1ピクセルとなります。
    @option :edge_level Integer 4 袋文字の枠の濃さを0～の数値で指定します。大きいほど濃くなりますが、幅が大きいほど薄くなります。値の制限はありませんが、目安としては一桁ぐらいが実用範囲でしょう。
    @option :shadow bool false 影を描画するかどうかをtrue/falseで指定します。
    @option :shadow_edge bool false edgeがtrueの場合に、枠の部分に対して影を付けるかどうかをtrue/falseで指定します。trueで枠の影が描かれます。
    @option :shadow_color Array [0,0,0] 影の色を指定します。配列で[R, G, B]、それぞれ0～255、省略すると[0, 0, 0]、黒い影になります。
    @option :shadow_x Integer font.size/24+1 影の位置を相対座標で指定します。+1は1ピクセル右になります。省略するとフォントサイズ/24+1になります。
    @option :shadow_y Integer font.size/24+1 影の位置を相対座標で指定します。+1は1ピクセル下になります。省略するとフォントサイズ/24+1になります。
    @option :z
  　@note このメソッドでは"\n"を入れても改行することはできません。
  
  
  def draw_morph(x1, y1, x2, y2, x3, y3, x4, y4, image, option={})
    4点を自由に指定してimageを描画できます。これを使うと自在に変形した画像を描画することができます。
    ただし、実際にはhashで指定するdividexとdivideyの数だけ絵を分割して変形しますので、分割数が少ない場合/描画面積が大きい場合に見え方がぎこちなくなることがあります。その場合は分割数を増やしてください。分割数を増やすと描画枚数が増えるのでパフォーマンスは下がります。
    座標はx1から順に右回りで指定してください。順番が違う場合の描画結果は保証されません。
    @param x1 Integer X1座標
    @param y1 Integer Y1座標
    @param x2 Integer X2座標
    @param y2 Integer Y2座標
    @param x3 Integer X3座標
    @param y3 Integer Y3座標
    @param x4 Integer X4座標
    @param y4 Integer Y4座標
    @option :alpha
    @option :blend
    @option :dividex Integer 1 横の分割数
    @option :dividey Integer 1 縦の分割数
    @option :z
    @option :color


  def draw_tile(base_x, base_y, map, image_array, start_x, start_y, size_x, size_y, z=0)
    タイルチップと二次元配列を使ってマップ描画をします。
    画像のサイズはimage_arrの先頭の画像から取得します。
    すべて同じサイズのImageオブジェクトを使用してください。
    描画範囲が2次元配列からはみ出した場合、自動的にループします。
    ピクセル単位でスクロールさせることができますが、描画は上下左右に最大1枚分はみ出すため、
    上に枠をかぶせて隠すように描画するか、RenderTargetに一度描画して範囲を制限するか、ウィンドウのサイズ全体に描画してはみ出した部分を描画されないようにするかしてください。 
    image_arrに配列を入れ子にすることができます。
    Array#flatten的な処理がされて前から連番が振られますので、
    同じサイズの配列であれば中身を差し替えることで簡単にアニメーションすることができます。 
    @param base_x Integer マップを描画する画面上の左上基点X座標を指定します。
      ピクセル単位スクロールの都合上、実際の描画は左にはみ出すことがあります。
      nilを指定するとRenderTarget#ox/oyの値に関わらず画面の左上固定となります。
    @param base_y Integer マップを描画する画面上の左上基点Y座標を指定します。
      ピクセル単位スクロールの都合上、実際の描画は上にはみ出すことがあります。
      nilを指定するとRenderTarget#ox/oyの値に関わらず画面の左上固定となります。
    @param map Array マップの二次元配列を指定します。中の値がimage配列の要素番号になります。
    @param image_array Array マップタイルのImageオブジェクト配列を指定します。
    @param start_x Integer マップ内の描画開始位置をピクセル単位で指定します。
      nilを指定するとRenderTarget#oxの値によって開始位置が定まります。
    @param start_y Integer マップ内の描画開始位置をピクセル単位で指定します。
      nilを指定するとRenderTarget#oyの値によって開始位置が定まります。
    @param size_x Integer 描画するマップタイルの枚数を縦横の数で指定します。
      nilを指定するとRenderTargetサイズから適切な数が算出されます。
    @param size_y Integer 描画するマップタイルの枚数を縦横の数で指定します。
      nilを指定するとRenderTargetサイズから適切な数が算出されます。


  def draw_line(x1, y1, x2, y2, color, z=0)
    画面に(x1, y1)～(x2, y2)を結ぶ線を引きます。
    @param x1 Integer 開始X座標。
    @param y1 Integer 開始Y座標。
    @param x2 Integer 終了X座標。
    @param y2 Integer 終了Y座標。
    @param color Array [R, G, B]でそれぞれ0～255
  
  
  def draw_box_fill(x1, y1, x2, y2, color, z=0)
    画面に(x1, y1)～(x2, y2)を塗りつぶす矩形を描画します。
  
  
  def update
    描画を実行します。
  
  
  def width -> Integer
    RenderTargetの横幅を取得します。
  
  
  def height -> Integer
    RenderTargetの高さを取得します。
  
  
  def bgcolor -> Array
    画面のクリア（RenderTarget#update時、描画処理前に自動的にされます）時に使う色を取得します。
    色の指定はARGBもしくはRGBの配列です。
  
  
  def bgcolor=(color)
    画面のクリア（RenderTarget#update時、描画処理前に自動的にされます）時に使う色を設定します。
    @param color Array ARGBもしくはRGBの配列
  
  
  def min_filter -> Constant
    draw_scaleやdraw_exのscale_x/yキーで縮小する場合に使用されるフィルタを取得します。
    @see min_filter=
    @see mag_filter
  
  
  def min_filter=(filter)
    draw_scaleやdraw_exのscale_x/yキーで縮小する場合に使用されるフィルタを設定します。
    この設定はWindow.scale=には反映されません。
    @param filter Constant 以下のフィルタ定数
      TEXF_POINT 単純拡大・縮小フィルタ
      TEXF_LINEAR 線形補間フィルタ（デフォルト）
      TEXF_GAUSSIANQUAD 4-サンプルガウスフィルタ
    
  def mag_filter -> Constant
    draw_scaleやdraw_exのscale_x/yキーで拡大する場合に使用されるフィルタを取得します。
    @see mag_filter=
    @see min_filter
  
  
  def mag_filter=(filter)
    draw_scaleやdraw_exのscale_x/yキーで拡大する場合に使用されるフィルタを設定します。
  
  
  def to_image -> Image
    RenderTargetオブジェクトが保持する画像をImageオブジェクトに変換して返します。
    このメソッドはかなり遅いので毎フレーム実行するようなことはなるべく避けてください。
  
  
  def discard
    RenderTarget#draw系メソッドで描画した絵は描画予約されて、RenderTarget#update時に実際に描画されます。
    描画される前にRenderTarget#discardを実行すると描画予約を消去することができます。
    RenderTarget#decideを実行した場合、実行前の描画予約は消去されません。


  def decide
    RenderTarget#draw系メソッドで描画した絵は描画予約されて、RenderTarget#update時に実際に描画されます。
    RenderTarget#decideを実行すると、その時点での描画予約が確定されます。これはRenderTarget#discardでも消去されません。
    このメソッドはRenderTarget#discardで消去されなくするためだけに存在するので、これを実行しないと描画されないということではありません。


  def resize(x, y)
    サイズを変更します。中身は消去されます。描画予約は残ります。
  
  
  def ox -> Integer
    X軸方向の描画位置補正を取得します。初期値は0です。
    selfに対する描画のすべての座標に-oxを加算します。
    画面をはみ出すような広大な座標系をイメージして、表示される範囲(画面)の左上座標がox/oyになるような感じです。
    この指定はdraw系メソッドと、Sprite#targetにRenderTargetオブジェクトを指定したSpriteの描画、及び、衝突判定に影響します。


  def ox=(x)
    X軸方向の描画位置補正を設定します。初期値は0です。
    selfに対する描画のすべての座標に-oxを加算します。
    画面をはみ出すような広大な座標系をイメージして、表示される範囲(画面)の左上座標がox/oyになるような感じです。
    この指定はdraw系メソッドと、Sprite#targetにRenderTargetオブジェクトを指定したSpriteの描画、及び、衝突判定に影響します。


  def oy -> Integer
    Y軸方向の描画位置補正を取得します。初期値は0です。
    selfに対する描画のすべての座標に-oyを加算します。
    画面をはみ出すような広大な座標系をイメージして、表示される範囲(画面)の左上座標がox/oyになるような感じです。
    この指定はdraw系メソッドと、Sprite#targetにRenderTargetオブジェクトを指定したSpriteの描画、及び、衝突判定に影響します。


  def oy=(y)
    Y軸方向の描画位置補正を設定します。初期値は0です。
    selfに対する描画のすべての座標に-oyを加算します。
    画面をはみ出すような広大な座標系をイメージして、表示される範囲(画面)の左上座標がox/oyになるような感じです。
    この指定はdraw系メソッドと、Sprite#targetにRenderTargetオブジェクトを指定したSpriteの描画、及び、衝突判定に影響します。





