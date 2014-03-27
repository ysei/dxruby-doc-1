
class Image
  画像を表すクラスです。
  
  
  def self.new(width, height, color=[0,0,0,0]) -> Image
    Imageオブジェクトを生成して返します。
    @param width  Integer 横幅
    @param height Integer 高さ
    @param color Array ARGB順（それぞれ0～255）の配列。指定すると生成時に全体が指定色に塗られます。
      省略すると[0,0,0,0]の透明色になります。update時、描画処理前にcolor指定色でクリアされます。
  
  def self.load(path, x=nil, y=nil, width=nil, height=nil) -> Image
    画像を読み込み、Imageオブジェクトを生成して返します。
    x/y/width/heightを指定するとその部分のみ切り出してImageオブジェクトを生成します。
    サポートするファイル形式はjpgとpng、bmpその他ですが、カラーキーは対応していないので透明色のある絵はpngにしてください。
    @param path String ファイルパス
    @param x Integer X座標
    @param y Integer Y座標
  

  def self.load_tiles(path, xcount, ycount, share_switch=true) -> Array
    画像を読み込み、横・縦がそれぞれxcount個、ycount個であると仮定して自動で分割し、
    左上から右に向かう順序でImageオブジェクトの配列を生成して返します。
    サポートするファイル形式はjpgとpng、bmpその他ですが、カラーキーは対応していないので透明色のある絵はpngにしてください。
    share_switchはtrueにすると全てのImageのテクスチャが共有されます。
    描画は速くなりますが、Shaderを使って描画する際にテクスチャ座標が(0.0, 0.0)～(1.0, 1.0)にならなくなります。
    @param xcount Integer X軸分割数
    @param ycount Integer Y軸分割数
    @param share_switch bool Imageのテクスチャ共有の有無
  
  
  def self.create_from_array(width, height, array) -> Image
    色情報を格納した配列からImageオブジェクトを生成して返します。
    配列はalpha, red, green, blueの４つをピクセル数分並べたものです。
    例)32×32ピクセルの白い四角は[255, 255, 255, 255] * 32 * 32と指定します。
    @param array Array 色情報(ARGB)を格納した配列
  
  
  def self.load_from_file_in_memory(binary_data) -> Image
    メモリ上のデータからImageオブジェクトを生成します。
    @param binary_data String 画像ファイルのバイナリ
    
  
  def dispose
    selfの画像リソースを解放します。
    使わなくなったデータをdisposeしておくと、PCのメインメモリやビデオメモリを節約することができ、また、GC時の負荷も軽くなります。
    dispose後、そのオブジェクトのメソッドを呼び出すと例外が発生します。
  
  
  def delayed_dispose
    selfの画像リソースを、delayed_disposeが呼ばれたフレームの描画処理が終わった後に解放します。
    あるフレームで生成し、そのフレームの描画のみで使うImageがあった場合に、次フレームでdisposeするのは面倒ですが、このメソッドでdispose予約ができます。
    次のフレーム以降、そのオブジェクトのメソッドを呼び出すと例外が発生します。
  
  
  def disposed? -> bool
    selfがdisposeされているかどうかをtrue/falseで返します。
  
  
  def [](x, y) -> Array
    Imageオブジェクトの該当ピクセルの色を配列で取得します。
    配列はARGB順となります。
    それぞれ0～255の範囲です。
  
  
  def []=(x, y, color)
    Imageオブジェクトの該当ピクセルに色を設定します。
    colorは配列で、ARGB順（0～255）で指定します。
    [r, g, b]で渡すとaは255になります。
  
    
  def compare(x, y, color)
    Imageオブジェクトの該当ピクセルの色がcolorと一致するかどうかをtrue/falseで返します。
    colorは配列で、[a, r, g, b]と指定します。
    それぞれ0～255の範囲です。
    [r, g, b]で渡すとaは比較されません。  
  
  
  def line(x1, y1, x2, y2, color)
    Imageオブジェクトの(x1,y1)-(x2,y2)に線を描画します。
    @param x1 Integer X座標1
    @param y1 Integer Y座標1
    @param x2 Integer X座標2
    @param y2 Integer Y座標2
  

  def box(x1, y1, x2, y2, color)
    (x1,y1)-(x2,y2)の中を塗りつぶさない四角形を描画します。
  
  
  def box_fill(x1, y1, x2, y2, color)
    Imageオブジェクトの(x1,y1)-(x2,y2)の範囲を塗りつぶします。
  
  
  def circle(x, y, r, color)
    Imageオブジェクトの(x,y)を中心とした半径rの円を描きます。
    DXRuby1.2.2で円の描画アルゴリズムが変更され、
    Image.new(10,10).circle(5,5,5,[255,255,255])で上下左右ぴったりの円が描画できるようになりました。
    @param r Integer 円の半径
  
  
  def circle_fill(x, y, r, color)
    Imageオブジェクトの(x,y)を中心とした半径rの円を描き、塗りつぶします。


  def triangle(x1, y1, x2, y2, x3, y3, color)
    Imageオブジェクトの(x1, y1)-(x2, y2)-(x3, y3)を結ぶ三角形を描画します。
    @param x3 Integer X座標3
    @param y3 Integer Y座標3
    

  def triangle_fill(x1, y1, x2, y2, x3, y3, color)
    Imageオブジェクトの(x1, y1)-(x2, y2)-(x3, y3)を結ぶ三角形を描画し、塗りつぶします。


  def fill(color)
    Imageオブジェクトの全体をcolorで塗りつぶします。
  
  
  def clear
    Imageオブジェクトの全体を[0,0,0,0]で塗りつぶします。
  
  
  def copy_rect(x, y, image, x1=0, y1=0, width=image.width, height=image.height)
    selfのオブジェクトのx/yの位置に、imageで指定したオブジェクトのx1/y1/width/heightで指定した部分をコピーします。
    α値を無視した単純コピーです。
    自分自身にコピーすることはできません。
    @param image Image Imageオブジェクト


  def draw(x, y, image, x1=0, y1=0, width=image.width, height=image.height)
    selfのオブジェクトのx/yの位置に、imageで指定したオブジェクトのx1/y1/width/heightで指定した部分をコピーします。
    α値を考慮して半透明演算されます。
    自分自身にコピーすることはできません。


  def draw_font(x, y, text, font, color=[255,255,255])
    selfのオブジェクトのx/yの位置に、fontで指定したフォントオブジェクトでstringを書き込みます。
    colorは色配列で[r, g, b]を指定してください。
    省略すると[255, 255, 255]の白文字となります。
    [a, r, g, b]の形式でも指定は可能ですが、現在のバージョンではaは無視されます。
    このメソッドでは文字列に"\n"を入れても改行することはできません。
    文字コードはSJIS(Ruby1.8の場合)です。
    @param font Font フォントオブジェクト
    @param text String 書き込む文字列
    @param color Array RGB色配列


  def draw_font_ex(x, y, text, font, option={})
    高品質な文字の描画をします。
    selfのオブジェクトのx/yの位置に、fontで指定したフォントオブジェクトでtextを書き込みます。
    このメソッドでは文字列に"\n"を入れても改行することはできません。
    文字コードはSJIS(Ruby1.8の場合)です。
    @param option Hash オプション
    @option :color Array [255,255,255] RGB色配列でそれぞれ0～255、省略すると白文字になります。
    @option :edge bool false 袋文字を描画するかどうか。
    @option :edge_color Array [0,0,0] 袋文字の枠色を指定します。配列で[R, G, B]、それぞれ0～255、省略すると[0, 0, 0]、黒い枠になります。
    @option :edge_width Integer 2 袋文字の枠の幅を0～の数値で指定します。1で1ピクセルとなります。
    @option :edge_level Integer 4 袋文字の枠の濃さを0～の数値で指定します。大きいほど濃くなりますが、幅が大きいほど薄くなります。値の制限はありませんが、目安としては一桁ぐらいが実用範囲でしょう。
    @option :shadow bool false 影を描画するかどうかをtrue/falseで指定します。
    @option :shadow_edge bool false edgeがtrueの場合に、枠の部分に対して影を付けるかどうかをtrue/falseで指定します。trueで枠の影が描かれます。
    @option :shadow_color Array [0,0,0] 影の色を指定します。配列で[R, G, B]、それぞれ0～255、省略すると[0, 0, 0]、黒い影になります。
    @option :shadow_x Integer font.size/24+1 影の位置を相対座標で指定します。+1は1ピクセル右になります。省略するとフォントサイズ/24+1になります。
    @option :shadow_y Integer font.size/24+1 影の位置を相対座標で指定します。+1は1ピクセル下になります。省略するとフォントサイズ/24+1になります。
    @option :aa bool true アンチエイリアスの有無
    

  def save(path, format=nil)
    selfの画像を指定のフォーマットで画像ファイルとして保存します。
    省略するとファイル名の拡張子から自動判別されます。判別に失敗するとPNGになります。
    @param format Constant 保存形式（FORMAT_JPG/FORMAT_PNG/FORMAT_BMP/FORMAT_DDS）。


  def slice(x, y, width, height) -> Image
    selfの画像から、x/y/width/heightで表される部分を切り出して新たなImageオブジェクトを生成します。
    DXRuby1.2.2で新しいテクスチャが作成されるようになりました。


  def slice_tiles(xcount, ycount) -> Array
    selfの画像を横・縦それぞれxcount個、ycount個に分割し、
    左上から右に向かう順序でImageオブジェクトの配列を生成して返します。
    DXRuby1.2.2で新しいテクスチャが作成されるようになりました。


  def dup -> Image
    selfをコピーして新たなImageオブジェクトを生成します。

  def clone -> Image
    selfをコピーして新たなImageオブジェクトを生成します。

  def set_color_key(color)
    selfの画像で、colorで指定された色と同じ色のα値を0にします。
    colorは3要素色配列の[r, g, b]で指定してください。
    [a, r, g, b]で指定するとaは無視してRGBのみ比較されます。  


  def width -> Integer
    画像の幅を取得します。
  
  
  def height -> Integer
    画像の高さを取得します。
  
  
  def flush(color)
    selfの透明じゃないピクセルをすべてcolorで指定した色に置き換えたImageオブジェクトを生成して返します。
    colorが3要素配列の場合、元のピクセルのα値が保持されます。
    半透明がある絵のフラッシュ後に半透明状態を残したい時にどうぞ。
    4要素配列を指定するとα値も置き換えます。
    @note 遅いのでリアルタイムで毎フレーム実行することはお勧めしません。


  def effect_image_font(option={}) -> Image
    selfの赤成分とα成分を合成し、それをグリフ情報として使ってdraw_font_exと同じエフェクトをかけたImageオブジェクトを生成して返します。hashはdraw_font_exのhashと同じです。
    赤成分とα成分を合成するので例えばα255で白と黒のモノクロ画像や、αでアンチエイリアシングされた白黒モノクロ画像などを扱うことができます。白を赤に置き換えても同様です。
    @note 遅いのでリアルタイムで毎フレーム実行することはお勧めしません。
    @option :color Array [255,255,255] RGB色配列でそれぞれ0～255、省略すると白文字になります。
    @option :edge bool false 袋文字を描画するかどうか。
    @option :edge_color Array [0,0,0] 袋文字の枠色を指定します。配列で[R, G, B]、それぞれ0～255、省略すると[0, 0, 0]、黒い枠になります。
    @option :edge_width Integer 2 袋文字の枠の幅を0～の数値で指定します。1で1ピクセルとなります。
    @option :edge_level Integer 4 袋文字の枠の濃さを0～の数値で指定します。大きいほど濃くなりますが、幅が大きいほど薄くなります。値の制限はありませんが、目安としては一桁ぐらいが実用範囲でしょう。
    @option :shadow bool false 影を描画するかどうかをtrue/falseで指定します。
    @option :shadow_edge bool false edgeがtrueの場合に、枠の部分に対して影を付けるかどうかをtrue/falseで指定します。trueで枠の影が描かれます。
    @option :shadow_color Array [0,0,0] 影の色を指定します。配列で[R, G, B]、それぞれ0～255、省略すると[0, 0, 0]、黒い影になります。
    @option :shadow_x Integer font.size/24+1 影の位置を相対座標で指定します。+1は1ピクセル右になります。省略するとフォントサイズ/24+1になります。
    @option :shadow_y Integer font.size/24+1 影の位置を相対座標で指定します。+1は1ピクセル下になります。省略するとフォントサイズ/24+1になります。
    @option :aa bool true アンチエイリアスの有無


  def change_hls(hue, luminance, saturation) -> Image
    selfに対して色相、輝度、彩度それぞれの差分を加えたImageオブジェクトを生成して返します。
    引数はすべて整数です。
    @param hue Integer 色相。360度系なので、-360もしくは+360すると一周して同じ色になります。
    @param luminance Integer 輝度で、-100すると真っ黒、+100すると真っ白になります。
    @param saturation Integer 彩度で、-100するとモノクロ、+100すると最も鮮やかになります。
    @note 遅いのでリアルタイムで毎フレーム実行することはお勧めしません。




