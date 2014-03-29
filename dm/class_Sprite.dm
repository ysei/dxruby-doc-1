
class Sprite
  Spriteクラスはゲームのキャラを扱う場合の基本となるクラスです。
  描画位置、描画パラメータ、画像データを保持し、自分自身を描画する機能を持ちます。
  つまり、従来であれば位置やパラメータ、画像を別々に持ってWindow.draw系メソッドで描画していたのを、Spriteオブジェクトにまとめて管理することができます。
  また、矩形・円・三角といった形状の衝突判定範囲を設定することができ、Spriteオブジェクト同士の高速な衝突判定を行うことができます。
  この衝突判定範囲は描画パラメータの回転やスケーリングが反映されるので、画像の見た目と一致した判定が可能です。

  def self.new(x=0, y=0, image=nil) -> Sprite
    Spriteオブジェクトを生成します。x/y/imageはそれぞれ座標と画像データです。
    imageがnilのままでSprite#drawを呼び出すと例外が発生します。
    また、imageがnilでもcollisionが設定されていれば描画はできなくても衝突判定は可能です。
    @param x Integer X座標
    @param y Integer X座標
    @param image Image|RenderTarget 描画元の画像オブジェクト
    

  def self.check(o, d, shot=:shot, hit=:hit) -> bool
    衝突判定を行います。
    判定範囲はSprite#collision=による指定、それが無い場合はSprite#image=で設定された画像サイズの矩形でなされます。
    どちらも指定されていないと例外が生じます。
    衝突が検出された場合、o側のSpriteオブジェクトのshotメソッド、d側のhitメソッドが順に呼ばれます。
    衝突判定範囲にはSpriteオブジェクトのangle/scale_x/scale_y/center_x/center_yが反映されます。
    Sprite#collision_sync=falseで反映されなくなります。
    shot/hitメソッドの戻り値としてシンボルの:discardを返すと、そのcheck呼び出し内のそれ以後はオブジェクトのshot/hitが呼ばれなくなります。
    衝突相手のshot/hitも呼ばれません。
    どれかひとつでも衝突していればtrue、どれも衝突していなければfalseを返します。
    @param o Sprite|Array SpriteオブジェクトもしくはSpriteオブジェクトの配列。
      配列内にSprite以外のオブジェクトがあった場合、無視されます。
    @param d Sprite|Array SpriteオブジェクトもしくはSpriteオブジェクトの配列。
      配列内にSprite以外のオブジェクトがあった場合、無視されます。
    @param shot Symbol 衝突が検出された場合に呼び出されるメソッド名のシンボル。
      nilを指定すると呼ばれません。
      oとdが同じ配列である場合は呼び出されません。
    @param hit Symbol 衝突が検出された場合に呼び出されるメソッド名のシンボル。
      nilを指定すると呼ばれません。
      oとdが同じ配列である場合は双方のhitメソッドが呼ばれます。
    @see collision
    @see collision_sync
    
    
  def self.update(ary)
    配列内のすべてのオブジェクトのupdateメソッドを呼び出します。
    updateメソッドがないオブジェクトは無視します。
    vanished?がある場合は呼び出して、trueのオブジェクトも無視します。
    配列の配列を渡すとネストして処理します。
    @param ary Array オブジェクトの配列
  
  
  def self.draw(ary)
    配列内のすべてのオブジェクトのdrawメソッドを呼び出します。
    drawメソッドがないオブジェクトの場合は単に無視します。
    vanished?がある場合は呼び出して、trueのオブジェクトも無視します。
    配列の配列を渡すとネストして処理します。

  def self.clean(ary)
    配列内のすべてのオブジェクトのvanished?メソッドを呼び出し、trueが返ってきた要素と、もともとnilだった要素を削除します。
    配列の配列を渡すとネストして処理します。


  def draw
    selfを描画します。


  def ===(sprite) -> bool
    渡されたspriteとselfとの衝突チェックを行います。
    衝突していた場合にtrueを、衝突していなかった場合はfalseを返します。
    @param sprite Sprite|Array SpriteオブジェクトもしくはSpriteオブジェクトの配列
    @see check
    

  def check(sprite) -> Array
    衝突しているSpriteオブジェクトの配列を返します。
    衝突していなかった場合は空の配列になります。
    @see ===


  def x -> Integer
    X座標を返します。
  
  
  def x=(pos)
    X座標を変更します。
    @param pos Integer X座標
  
  
  def y -> Integer
    Y座標を返します。
  
  
  def y=(pos)
    Y座標を変更します。
    @param pos Integer Y座標
  
  
  def z -> Integer|Float
    描画順序を返します。
  
  
  def z=(val)
    描画順序。小さいほど奥になり、同じ値の場合は最初にdrawしたものが一番奥になります。
    @param val Integer 描画順序
  
      
  def angle -> Integer
    描画時の回転角度を返します。デフォルト値はnilです。
  
  
  def angle=(val)
    描画時の回転角度を変更します。デフォルト値はnilです。
    @param val Integer 360度系で画像の回転角度を指定します。
    
    
  def scale_x -> Float
    描画時のX軸方向の拡大率を返します。デフォルト値はnilです。
    
    
  def scale_x=(val)
    描画時のX軸方向の拡大率を変更します。1が等倍、-1で左右反転します。デフォルト値はnilです。
    @param val Float X軸方向の拡大率
    
    
  def scale_y -> Float
    描画時のY軸方向の拡大率を返します。デフォルト値はnilです。
    
    
  def scale_y=(val)
    描画時のY軸方向の拡大率を変更します。1が等倍、-1で上下反転します。デフォルト値はnilです。
    @param val Float Y軸方向の拡大率
  
  
  def center_x -> Integer
    描画時の画像の拡大、回転中心とするX座標を返します。
    デフォルト値はSprite#image=で設定された画像の中心となるX座標です。
    
    
  def center_x=(pos)
    描画時の画像の拡大、回転中心とするX座標を変更します。
    @param pos Integer X座標
    
    
  def center_y -> Integer
    描画時の画像の拡大、回転中心とするY座標を返します。
    デフォルト値はSprite#image=で設定された画像の中心となるY座標です。
    
    
  def center_y=(pos)
    描画時の画像の拡大、回転中心とするY座標を変更します。
    @param pos Integer Y座標
    
    
  def alpha -> Integer
    描画時のアルファ値を返します。デフォルト値はnilです。
    
    
  def alpha=(val)
    描画時のアルファ値を変更します。デフォルト値はnilです。
    範囲は0(完全に透明)から255(完全に不透明)までです。
    @param val Integer アルファ値
    
    
  def blend -> Symbol
    描画時の合成方法を返します。デフォルト値はnilです。
  
  
  def blend=(val)
    描画時の合成方法を変更します。
    @param val Symbol :alpha :blend :alpha、:none、:add、:add2、:subのいずれかを指定します。
      :noneは透明色、半透明色もそのまま上書き描画します。
      :addはソースにアルファ値を、:add2は背景に255-アルファ値を適用します。
      :subはアルファ値を全ての色の合成に、:sub2はRGBの色をそれぞれ別々に合成に適用します。
    
    
  def shader -> Shader
    描画時に適用するShaderオブジェクトを返します。デフォルト値はnilです。
    
    
  def shader=(val)
    描画時に適用するShaderオブジェクトを変更します。
    @param val Shader 適用するShaderオブジェクト
    
    
  def image -> Image|RenderTarget
    Sprite#drawで描画される画像を返します。
    
    
  def image=(image)
    Sprite#drawで描画される画像を変更します。


  def target -> RenderTarget|nil
    Sprite#drawで描画する先を返します。
    デフォルト値はnilです。
    

  def target=(val)
    Sprite#drawで描画する先をスクリーンではなくRenderTargetオブジェクトにする場合に指定します。
    デフォルト値はnilで、nilの場合はスクリーンに描画されます。
    @param val RenderTarget drawで描画する先となるRenderTargetオブジェクト


  def collision
    衝突判定範囲を返します。
    デフォルト値はnilで、nilの場合にはimageで設定された画像サイズの矩形が判定に使われます。
    衝突判定範囲をさらに配列に入れて設定すると、それらのどれかが衝突していた場合にこのオブジェクトが衝突したと判定されます。
    画像の回転・スケーリングに連動して座標は変わりますが、点の場合のみスケーリングしても1ピクセルサイズのままとなります。
    
    
  def collision=(val)
    衝突判定範囲を設定します。
    設定するのは配列で、要素の数で形状が決まります。
    座標はSprite#x, Sprite#yの値からの相対位置です。
    @param val Array 配列要素数によって意味が変わります。
      要素2つの配列は[x, y]として1ピクセルの点を表します。
      要素3つの配列は[x, y, r]として中心(x, y)から半径rのサイズの円を表します。
      要素4つの配列は[x1, y1, x2, y2]として左上(x1, y1)と右下(x2, y2)を結ぶ矩形を表します。
      要素6つの配列は[x1, y1, x2, y2, x3, y3]として(x1, y1)～(x2, y2)～(x3, y3)を結ぶ三角形を表します。
  
  
  def collision_enable -> bool
    衝突判定の有効、無効を返します。
    デフォルト値はtrueです。
  
  
  def collision_enable=(val)
    衝突判定の有効、無効を返します。
    @param val bool trueの場合に衝突判定が有効、falseで無効となります。
  

  def collision_sync -> bool
    衝突判定範囲に回転/スケーリングを加味するかを返します。
    デフォルト値はtrueです。
    falseにすると衝突判定の計算負荷が減ります。
    
    
  def collision_sync=(val)
    衝突判定範囲に回転/スケーリングを加味するかを変更します。
    デフォルト値はtrueです。
    @param val bool 回転/スケーリングを加味する場合はtrue


  def visible -> bool
    Sprite#drawにおいて実際に描画するかを返します。デフォルト値はtrueです。
    
    
  def visible=(val)
    Sprite#drawにおいて実際に描画するかを変更します。
    デフォルト値はtrueです。flaseにするとSprite#draw実行時に描画されません。
    @param val bool draw時に描画する場合はtrue
  
  
  def vanish
    vanishメソッドはSpriteを無効化します。
    デフォルトは有効状態で、一度無効化すると有効状態に戻す手段はありません。
  
  
  def vanished? -> bool
    Sprite#vanishによって無効化されている場合にtrueを返します。
    無効状態のSpriteオブジェクトは描画、衝突判定されません。
    Sprite.cleanで配列から削除されます。

  
  def param_hash -> Hash
    Window.draw_exに渡すことのできるHashオブジェクトを返します。

  
  def offset_sync -> bool
    オフセット同期モードを返します。デフォルト値はfalseです。
  
  
  def offset_sync=(val)
    trueの場合オフセット同期モードとなり、
    Sprite#center_x, Sprite#center_yに設定した位置がx/yの位置にくるように補正されます。
    デフォルト値はfalseです。
    @param val bool オフセット同期モード
    @version 1.4.1

