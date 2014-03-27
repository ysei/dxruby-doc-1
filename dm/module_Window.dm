
module Window
  ウィンドウ生成、グラフィック描画、画面更新を実行します。 
  なお、特段の指示がない限り座標は左上を(0,0)とします。
  
  def loop { } -> bool
    メインループとして渡されたブロックを実行し続けます。
    デフォルト設定ではウィンドウ(640*480pixel)が作られ、閉じられたら終了します。
    このループは秒間60回実行(60FPS)になるよう、待ち時間が自動調整されます。
    
    @code ruby
      Window.loop do
        # ここにゲームの処理を書く
      end


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
    @param option Hash オプション。
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


  def draw_font(x, y, string, font, option={})
    DirectX APIで文字を描画します。
    改行文字が有効となります。
    単純文字描画であるため、描画は高速です。
    @param string String 描画する文字列
    @param font Font フォントオブジェクト
    @option :scale_x
    @option :scale_y
    @option :center_x
    @option :center_y
    @option :alpha
    @option :blend
    @option :color
    @option :angle
    @option :z


  def draw_font_ex(x, y, string, font, option={})
    内部でImageオブジェクトを生成、Image#draw_font_exを呼び出して描画し、
    それを画面にWindow.draw_exで高品質な文字の描画をします。
    改行文字は無視されます。
    @see DXRuby::Window::draw_font
    @see DXRuby::Image::draw_font
    @see DXRuby::Image::draw_font_ex
    @option :scale_x
    @option :scale_y
    @option :center_x
    @option :center_y
    @option :alpha
    @option :blend
    @option :color
    @option :angle
    @option :edge bool false 袋文字を描画するかどうか。
    @option :edge_color Array [0,0,0] 袋文字の枠色を指定します。配列で[R, G, B]、それぞれ0～255、省略すると[0, 0, 0]、黒い枠になります。
    @option :edge_width Integer 2 袋文字の枠の幅を0～の数値で指定します。1で1ピクセルとなります。
    @option :edge_level Integer 4 袋文字の枠の濃さを0～の数値で指定します。大きいほど濃くなりますが、幅が大きいほど薄くなります。値の制限はありませんが、目安としては一桁ぐらいが実用範囲でしょう。
    @option :shadow bool false 影を描画するかどうかをtrue/falseで指定します。
    @option :shadow_edge bool false edgeがtrueの場合に、枠の部分に対して影を付けるかどうかをtrue/falseで指定します。trueで枠の影が描かれます。
    @option :shadow_color Array [0,0,0] 影の色を指定します。配列で[R, G, B]、それぞれ0～255、省略すると[0, 0, 0]、黒い影になります。
    @option :shadow_x Integer font.size/24+1 影の位置を相対座標で指定します。+1は1ピクセル右になります。省略するとフォントサイズ/24+1になります。
    @option :shadow_y Integer font.size/24+1 影の位置を相対座標で指定します。+1は1ピクセル下になります。省略するとフォントサイズ/24+1になります。
    @option :z


  def draw_morph(x1, y1, x2, y2, x3, y3, x4, y4, image, option={})
    4点を自由に指定してimageを描画できます。これを使うと自在に変形した画像を描画することができます。
    ただし、実際にはoptionで指定するdividexとdivideyの数だけ絵を分割して変形しますので、分割数が少ない場合/描画面積が大きい場合に見え方がぎこちなくなることがあります。その場合は分割数を増やしてください。分割数を増やすと描画枚数が増えるのでパフォーマンスは下がります。
    座標はx1から順に右回りで指定してください。順番が違う場合の描画結果は保証されません。
    @param x1 Integer X1座標。
    @param y1 Integer Y1座標。
    @param x2 Integer X2座標。
    @param y2 Integer Y2座標。
    @param x3 Integer X3座標。
    @param y3 Integer Y3座標。
    @param x4 Integer X4座標。
    @param y4 Integer Y4座標。
    @option :alpha
    @option :blend
    @option :dividex Integer 1 横の分割数を指定します。
    @option :dividey Integer 1 縦の分割数を指定します。
    @option :z
    @option :color


  def draw_tile(base_x, base_y, map, image_array, start_x, start_y, size_x, size_y, z=0)
    タイルチップと二次元配列を使ってマップ描画をします。nilが指定できるようになりました。
    画像のサイズはimage_arrの先頭の画像から取得します。すべて同じサイズのImageオブジェクトを使用してください。
    マップ配列の長さが要素によって異なる場合の動作は未定義です。長さはすべて一致させてください。
    描画範囲が上下左右に2次元配列からはみ出した場合、自動的にループされます。1枚絵を無限ループさせるという応用や、basex/baseyをマイナス値にして左方向へのループなどもできます。
    ピクセル単位でスクロールさせることができますが、描画は上下左右に最大1枚分はみ出すので、上に枠をかぶせて隠すように描画するか、RenderTargetに一度描画して範囲を制限するか、ウィンドウのサイズ全体に描画してはみ出した部分を描画されないようにするかしてください。 
    image_arr配列に配列を入れ子にすることができます。Array#flatten的な処理がされて前から連番が振られますので、同じサイズの配列であれば中身を差し替えることで簡単にアニメーションすることができます。
    @param base_x Integer マップを描画する画面上の左上基点X座標を指定します。ピクセル単位スクロールの都合上、実際の描画は左にはみ出すことがあります。マイナスの値も指定できます。nilを指定すると0となります。
    @param base_y Integer マップを描画する画面上の左上基点Y座標を指定します。ピクセル単位スクロールの都合上、実際の描画は上にはみ出すことがあります。マイナスの値も指定できます。nilを指定すると0となります。
    @param map Integer[][] マップの二次元配列を指定します。中の値がimage配列の要素番号になります。
    @param image_array Image[] マップタイルのImageオブジェクト配列を指定します。
    @param start_x Integer マップ内の描画開始位置をピクセル単位で指定します。nilを指定すると0となります。
    @param start_y Integer マップ内の描画開始位置をピクセル単位で指定します。nilを指定すると0となります。
    @param size_x Integer 描画するマップタイルの枚数を縦横の数で指定します。nilを指定すると画面サイズから適切な数が算出されます。
    @param size_y Integer 描画するマップタイルの枚数を縦横の数で指定します。nilを指定すると画面サイズから適切な数が算出されます。
  
  
  def draw_line(x1, y1, x2, y2, color, z=0)
    画面に(x1, y1)～(x2, y2)を結ぶ線を引きます。
    @param x1 Integer 開始X座標。
    @param y1 Integer 開始Y座標。
    @param x2 Integer 終了X座標。
    @param y2 Integer 終了Y座標。
    @param color Array [R, G, B]でそれぞれ0～255
  
  
  def draw_box_fill(x1, y1, x2, y2, color, z=0)
    画面に(x1, y1)～(x2, y2)を塗りつぶす矩形を描画します。
  
  
  def get_screen_shot(path, format=FORMAT_JPG)
    スクリーンショットをファイルに保存します。
    省略するとFORMAT_JPGになります。
    @param path String ファイルパス。
    @param format Constant 保存形式。FORMAT_JPG/FORMAT_PNG/FORMAT_BMP/FORMAT_DDSのいずれかを指定してください。
  
  
  def get_load -> Float
    現在の処理負荷を％で取得します。
    fps=で指定したFPSでの1フレームのうち、どれだけ処理時間を使っているかを表しています。
  
  
  def open_filename(filter, title) -> String|nil
    ファイルオープンダイアログを表示します。
    ファイル名の文字列が返ってきます。文字列の文字コードはRuby1.8の場合はSJISです。
    Ruby1.9以降ではEncoding.default_internalのものに変換されます。nilの場合はSJISです。
    キャンセルされるとnilが返ります。
    filter、titleともに渡す文字コードはRuby1.8ではSJIS、Ruby1.9以降は自動変換されますので好みの文字コードでどうぞ。
    @param filter String[] [["すべてのファイル(*.*)", "*.*"]["JPGファイル(*.jpg)", "*.jpg"]]のような配列を設定します。
    @param title String ダイアログのタイトルバーに表示される文字列を設定します。
  
  
  def save_filename(filter, title) -> String|nil
    ファイルセーブダイアログを表示します。
    ファイル名の文字列が返ってきます。文字列の文字コードはRuby1.8の場合はSJISです。
    Ruby1.9以降ではEncoding.default_internalのものに変換されます。nilの場合はSJISです。
    キャンセルされるとnilが返ります。
    filter、titleともに渡す文字コードはRuby1.8ではSJIS、Ruby1.9以降は自動変換されますので好みの文字コードでどうぞ。
  
  
  def folder_dialog(title, default_dir) -> String|nil
    フォルダダイアログを表示します。
    選択したディレクトリ名の文字列が返ってきます。文字列の文字コードはRuby1.8の場合はSJISです。
    Ruby1.9以降ではEncoding.default_internalのものに変換されます。nilの場合はSJISです。
    キャンセルされるとnilが返ります。
    filter、titleともに渡す文字コードはRuby1.8ではSJIS、Ruby1.9以降は自動変換されますので好みの文字コードでどうぞ。
    @param default_dir String 初期表示時に選択されるディレクトリを設定します。
  
  
  def create
    ウィンドウを作成します。
    Window.loopの初めに同じ処理がされていますので、Window.loopを使わずに自分でゲームループを組み立てるときだけ使ってください。
  
  
  def sync
    Window.fps=で指定されたfpsになるようにウェイトを入れます。
    Window.loopの中で同じ処理がされていますので、Window.loopを使わずに自分でゲームループを組み立てるときだけ使ってください。
  
  
  def update
    画面を更新します。
    Window.loopの中で同じ処理がされていますので、Window.loopを使わずに自分でゲームループを組み立てるときだけ使ってください。
  
  
  def load_icon(path)
    16*16*4bppの画像ファイルを読み込み、ウィンドウ左上のアイコンに設定します。
    指定できるのは拡張子が.icoのファイルです。
  
  
  def hWnd -> Integer
    ウィンドウハンドルを取得します。
    Window.loop、Window.createを実行する前に使用可能です。
  
  
  def x -> Integer
    ウィンドウの表示位置のX座標を取得します。
  
  
  def x=(pos)
    ウィンドウの表示位置のX座標を設定します。
    Window.loop、Window.createメソッドを呼び出す前のみ可能です。
    表示位置設定を行わずにWindow.loop、Window.createメソッドを呼び出した場合、OSデフォルト位置に設定されます。
    @param pos Integer ウィンドウのX座標。
  
  
  def y -> Integer
    ウィンドウの表示位置のY座標を取得します。
  
  
  def y=(pos)
    ウィンドウの表示位置のY座標を設定します。
    Window.loop、Window.createメソッドを呼び出す前のみ可能です。
    表示位置設定を行わずにWindow.loop、Window.createメソッドを呼び出した場合、OSデフォルト位置に設定されます。
    @param pos Integer ウィンドウのY座標。
  
  
  def width -> Integer
    ウィンドウの画面幅を取得します。
  
  
  def width=(size)
    ウィンドウの画面横幅を設定します。
    Window.loop、Window.createメソッドを呼び出す前のみ可能です。
    サイズ設定を行わずにWindow.loop、Window.createメソッドを呼び出した場合、
    幅640ピクセルに設定されます。
    @param size Integer ウィンドウの画面横幅。
    @see resize
  
  
  def height -> Integer
    ウィンドウの画面幅を取得します。
  
  
  def height=(size)
    ウィンドウの画面縦幅を設定します。
    Window.loop、Window.createメソッドを呼び出す前のみ可能です。
    サイズ設定を行わずにWindow.loop、Window.createメソッドを呼び出した場合、
    高さ480ピクセルに設定されます。
    @param size Integer ウィンドウの画面縦幅。
    @see resize
  
  
  def caption -> String
    タイトルバーのキャプションを取得します。
  
  
  def caption=(title)
    タイトルバーのキャプションを設定します。
    設定を行わずにWindow.loop、Window.createメソッドを呼び出した場合、
    "DXRubyApplication"となります。
    設定時の文字コードはSJIS(Ruby1.8の場合、Ruby1.9以降は何でも構わない)で、
    取得時もSJIS(Ruby1.8の場合、1.9以降ではEncoding.default_internalに
    設定されたものに変換される。nilならSJIS)です。
    @param title String タイトルバーのキャプション。

  
  def scale -> Float
    ウィンドウの画面サイズに対する拡大率を取得します。
    @see scale=
  
  
  def scale=(val)
    ウィンドウの画面サイズに対する拡大率を設定します。
    縦横同じ比率が適用されます。
    width、heightで指定した値に、この値を掛けたものが
    実際のウィンドウのサイズとなります。
    設定を行わずにWindow.loop、Window.createメソッドを呼び出した場合、
    1倍になります。
    @see scale
    @param val Float ウィンドウの拡大率。
  
  
  def windowed? -> bool
    ウィンドウモード/フルスクリーンモードを取得します。
    設定を行わずにWindow.loop、Window.createメソッドを呼び出した場合、
    ウィンドウモードになります。
    フルスクリーンモードは60fps固定となります。
  
  
  def windowed=(val)
    ウィンドウモード/フルスクリーンモードを設定します。
    設定を行わずにWindow.loop、Window.createメソッドを呼び出した場合、
    ウィンドウモードになります。
    フルスクリーンモードは60fps固定となります。
    @param val bool trueを指定するとウィンドウモードで、falseでフルスクリーンモードになります。
  
  
  def real_fps -> Integer
    画面の更新頻度(1秒間に何回更新するか)を取得します。
    @see Window.fps
    @see Window.fps=
  
  
  def fps -> Integer
    画面の更新頻度(1秒間に何回更新するか)を取得します。
    @see Window.real_fps
    @see Window.fps=
  
  
  def fps=(val)
    設定を行わずにWindow.loop、Window.createメソッドを呼び出した場合、
    60fpsに設定されます。
    処理が重くて更新頻度が保てない場合、自動的に描画をスキップします。
    nilまたは0を指定するとウェイト無しの最高速動作となります。
    @param val Integer 秒間の画面更新頻度。
  
  
  def frameskip? -> bool
    コマ落ち制御をするかどうかを取得します。
  
  
  def frameskip=(val)
    コマ落ち制御をするかどうかを設定します。
    trueを指定すると、fps=で指定したFPSに処理が間に合わない場合、
    1フレームだけ描画処理を省きます。
    描画を省いてでもfps=の動作間隔を守るモードです。
    falseを指定すると、fps=で指定したFPSに処理が間に合わなくても
    可能な限りの速度で動作し続けます。
    この場合、FPSは高くなりますが、ゲーム全体が遅くなります。
    指定しないとfalseになります。
    @param val bool コマ落ち制御をするかどうか
  
  
  def bgcolor -> Array
    毎フレーム自動的に実行される画面のクリアに使う色を取得します。
  
  
  def bgcolor=(color)
    毎フレーム自動的に実行される画面のクリアに使う色を設定します。
  
  
  def min_filter -> Constant
    draw_scaleやdraw_exのscale_x/yキーで縮小する場合に使用されるフィルタを取得します。
    @see min_filter=
    @see mag_filter
  
  
  def min_filter=(filter)
    draw_scaleやdraw_exのscale_x/yキーで縮小する場合に使用されるフィルタを
    設定します。
    この設定はWindow.scale=には反映されません。
    @param filter Constant 以下のフィルタ定数
      TEXF_POINT 単純拡大・縮小フィルタ
      TEXF_LINEAR 線形補間フィルタ（デフォルト）
      TEXF_GAUSSIANQUAD 4-サンプルガウスフィルタ
    
  def mag_filter -> Constant
    draw_scaleやdraw_exのscale_x/yキーで拡大する場合に使用されるフィルタを
    取得します。
    @see mag_filter=
    @see min_filter
  
  
  def mag_filter=(filter)
    draw_scaleやdraw_exのscale_x/yキーで拡大する場合に使用されるフィルタを
    設定します。
    この設定はWindow.scale=には反映されません。
  
  
  def resize(width, height)
    ウィンドウのサイズを変更します。
    このメソッドはウィンドウ生成後でも実行することができます。
    フルスクリーンで実行する場合、
    ビデオカードが対応していないサイズを指定すると例外が発生します。
    ビデオカードが対応しているサイズはWindow.get_screen_modesで取得できます。
    @param width Integer ウィンドウの横幅。
    @param height Integer ウィンドウの縦幅。
    @see get_screen_modes
  
  
  def active? -> bool
    ウィンドウがアクティブかどうかを返します。
    非アクティブ状態の場合に一時停止するなどの場合に使います。
  

  def running_time -> Integer
    ウィンドウを生成してからの経過時間をミリ秒単位で返します。
    ループ中のどこで何回実行してもそのフレームの開始時点の時間が返ります。


  def get_screen_modes -> [[width, height, refreshrate], ...]
    フルスクリーン時に使用可能な解像度を返します。


  def get_current_modes -> [width, height, refreshrate]
    現在の解像度を返します。
    

  def discard
    Window.draw系メソッドで描画した絵は描画予約され、
    Window.loopを回るときかWindow.update時に実際に描画されますが、
    その描画予約を取り消します。
    @note RenderTarget#decideを実行した場合、実行前の描画予約は消去されません。
    @note Window.decideによって確定された内容は取り消されません。
    @see decide


  def decide
    Window.draw系メソッドで描画した絵は描画予約されて、
    Window.loopを回るときかWindow.update時に実際に描画されますが、
    その時点での描画予約を確定し、Window.discardで取り消されなくします。
    このメソッドはWindow.discardで消去されなくするためだけに存在するので、
    これを実行しないと描画されないということではありません。 


  def before_call -> Hash
    ハッシュオブジェクトを返します。
    このハッシュオブジェクトのキーに識別用オブジェクトを、
    値にProcやMethodオブジェクトを格納しておくと、
    Window.loopの開始時にcallメソッドを呼び出してくれます。
    毎フレーム呼び出す必要がある処理を登録しておくと楽です。
    Proc/Methodに限らず、callメソッドが呼べるオブジェクトであれば
    何を格納しても動作します。
    識別用オブジェクトは他とぶつからなければ何でもよく、
    削除するときに使う程度になります。
    ループ分解している場合、before_callはInput.update時に呼び出されます。
    @see after_call


  def after_call -> Hash
    ハッシュオブジェクトを返します。
    このハッシュオブジェクトのキーに識別用オブジェクトを、
    値にProcやMethodオブジェクトを格納しておくと、
    終了時にcallメソッドを呼び出します。
    毎フレーム呼び出す必要がある処理を登録しておくと楽です。
    Proc/Methodに限らず、callメソッドが呼べるオブジェクトであれば
    何を格納しても動作します。
    識別用オブジェクトは他とぶつからなければ何でもよく、
    削除するときに使う程度になります。
    ループ分解している場合、after_callはWindow.update時に呼び出されます。
    @see before_call


