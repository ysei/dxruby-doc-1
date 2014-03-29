
class Font
  フォントを表すクラスです。
  Window.drawFontの引数として使います。
  
  
  def self.new(size, font_name="", option={})
    @param size Integer 文字のピクセルサイズ
    @param font_name String フォント名。明朝なら"ＭＳ 明朝"と指定します（間は半角スペース）。
      名前が間違っていると"ＭＳ Ｐゴシック"指定になるようです。
      実行するWindowsシステムにインストールされているフォントが使用可能です。
    　等幅フォントの場合、描画される文字のサイズは全角文字で幅・高さともにピクセル数＝size（半角文字は幅がsizeの半分）となります。
    　プロポーショナルフォントの場合は文字ごとに幅が異なりますので、描画される横幅は不明となりますが、Font#getWidthメソッドで事前に取得することができます。
    @param option Hash オプション
    @option :weight bool|Integer false 太字にするかどうか。
      0～1000の数字を100刻みで設定すると、文字の太さが変わります。trueの太さは1000、falseは400です。
    @option :italic bool false イタリック体にするかどうか。
    @note イタリック体にすると右に傾く分だけ幅は広がりますが、getWidthではその増分は取得できません。


  def self.install(path)
    指定されたフォントファイルを、一時的にシステムにインストールします。
    このメソッドを実行すると、ユーザーのシステムにインストールされていないファイルでも、Font.newで使用することができるようになります。
    プログラムを終了すると自動的にアンインストールされた状態になります。
    インストールされたフォントの名称が配列で返ってきます。この名称はFont.newで使うものです。システムに同じフォントがインストール済だった場合、名称が返ってきません。システムの状態に依存した動作となりますので、配布するプログラムでは戻り値は使わないほうがいいでしょう。
    このメソッドで読み込めるのは、拡張子がfon、fnt、ttf、ttc、fot、otf、mmm/pfb/pfm、のフォントファイルです。
    mmm/pfb/pfmはファイル名の文字列に「|」記号で区切って同時に指定してください。
    @param path String フォントファイルのパス
  
  
  def self.default -> Font
    デフォルトフォントを取得します。起動時にはFont.new(24)で生成されたフォントオブジェクトが設定されています。
    @see default=
  
  
  def self.default=(font)
    デフォルトフォントを設定します。
    現在、デフォルトフォントとは言っても描画時にフォントを省略することはできません。
    いちいちフォントを生成せずにFont.defaultと指定できるというだけです。
    @param font Font フォントオブジェクト
    @see default
  
  
  def dispose
    selfのフォントリソースを解放します。
    使わなくなったデータをdisposeしておくと、PCのメインメモリを節約することができ、
    また、GC時の負荷も軽くなります。
    dispose後、そのオブジェクトのメソッドを呼び出すと例外が発生します。
  
  
  def disposed? -> bool
    selfがdisposeされているかどうかをtrue/falseで返します。
  
  
  def get_width(text) -> Integer
    selfのフォントで描画した場合に横幅が何pixelになるかを計算して返します。
    プロポーショナルフォントの場合に描画サイズを計算したい時に使います。
    このメソッドでは改行文字は無視されます。
    @param text String 描画対象の文字列
  
  
  def size -> Integer
    Font.newで指定されたFontオブジェクトのサイズを返します。
  
  
  def fontname -> String
    Font.newで指定されたFontオブジェクトのフォント名を返します。
  
  
  def italic -> bool
    Fontオブジェクトのイタリック指定フラグを返します。
  
  
  def weight -> bool|Integer
     Font.newで指定されたFontオブジェクトの太さを返します。
  
  
  def info(text) -> Struct
    渡された文字列の最初の一文字に対して、グリフパラメータを取得します。パラメータが設定されたStructオブジェクトが返ります。
    プロポーショナルフォントに関して幅を正確に取得するにはこの情報を参照する必要があります。
    返されるStructオブジェクトには以下の項目があり、値がセットされています。
    詳細は「GetGlyphOutline」「GLYPHMETRICS」などでネットを検索してください。わかりやすい画像が出てくると思います。
    gm_blackbox_x・・・文字の線が存在する領域の幅を表します。
    gm_blackbox_y・・・文字の線が存在する領域の高さを表します。
    gm_cellinc_x・・・文字の起点位置から次の文字への移動量を表します。左右の空白を含みます。
    gmpt_glyphorigin_x・・・文字の起点位置から文字の線が存在する領域までの空白の幅を表します。
    gmpt_glyphorigin_y・・・ベースラインから文字の上端までの高さを表します。
    tm_ascent・・・ベースラインから空白を含む上端までの高さを表します。
    tm_descent・・・ベースラインから空白を含む下端までの高さを表します。
