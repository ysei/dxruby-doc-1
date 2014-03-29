## class Sprite
### 要約

Spriteクラスはゲームのキャラを扱う場合の基本となるクラスです。  
描画位置、描画パラメータ、画像データを保持し、自分自身を描画する機能を持ちます。  
つまり、従来であれば位置やパラメータ、画像を別々に持ってWindow.draw系メソッドで描画していたのを、Spriteオブジェクトにまとめて管理することができます。  
また、矩形・円・三角といった形状の衝突判定範囲を設定することができ、Spriteオブジェクト同士の高速な衝突判定を行うことができます。  
この衝突判定範囲は描画パラメータの回転やスケーリングが反映されるので、画像の見た目と一致した判定が可能です。

### 目次

<a href='#Sprite.new'>new</a>
<a href='#Sprite.check'>check</a>
<a href='#Sprite.update'>update</a>
<a href='#Sprite.draw'>draw</a>
<a href='#Sprite.clean'>clean</a>
<a href='#Sprite_23draw'>draw</a>
<a href='#Sprite_23_3D_3D_3D'>===</a>
<a href='#Sprite_23check'>check</a>
<a href='#Sprite_23x'>x</a>
<a href='#Sprite_23x_3D'>x=</a>
<a href='#Sprite_23y'>y</a>
<a href='#Sprite_23y_3D'>y=</a>
<a href='#Sprite_23z'>z</a>
<a href='#Sprite_23z_3D'>z=</a>
<a href='#Sprite_23angle'>angle</a>
<a href='#Sprite_23angle_3D'>angle=</a>
<a href='#Sprite_23scale_x'>scale_x</a>
<a href='#Sprite_23scale_x_3D'>scale_x=</a>
<a href='#Sprite_23scale_y'>scale_y</a>
<a href='#Sprite_23scale_y_3D'>scale_y=</a>
<a href='#Sprite_23center_x'>center_x</a>
<a href='#Sprite_23center_x_3D'>center_x=</a>
<a href='#Sprite_23center_y'>center_y</a>
<a href='#Sprite_23center_y_3D'>center_y=</a>
<a href='#Sprite_23alpha'>alpha</a>
<a href='#Sprite_23alpha_3D'>alpha=</a>
<a href='#Sprite_23blend'>blend</a>
<a href='#Sprite_23blend_3D'>blend=</a>
<a href='#Sprite_23shader'>shader</a>
<a href='#Sprite_23shader_3D'>shader=</a>
<a href='#Sprite_23image'>image</a>
<a href='#Sprite_23image_3D'>image=</a>
<a href='#Sprite_23target'>target</a>
<a href='#Sprite_23target_3D'>target=</a>
<a href='#Sprite_23collision'>collision</a>
<a href='#Sprite_23collision_3D'>collision=</a>
<a href='#Sprite_23collision_enable'>collision_enable</a>
<a href='#Sprite_23collision_enable_3D'>collision_enable=</a>
<a href='#Sprite_23collision_sync'>collision_sync</a>
<a href='#Sprite_23collision_sync_3D'>collision_sync=</a>
<a href='#Sprite_23visible'>visible</a>
<a href='#Sprite_23visible_3D'>visible=</a>
<a href='#Sprite_23vanish'>vanish</a>
<a href='#Sprite_23vanished_3F'>vanished?</a>
<a href='#Sprite_23param_hash'>param_hash</a>
<a href='#Sprite_23offset_sync'>offset_sync</a>
<a href='#Sprite_23offset_sync_3D'>offset_sync=</a>

----

### 特異メソッド

<a name='Sprite.new'></a>
#### new(x=0, y=0, image=nil) -> Sprite
* Spriteオブジェクトを生成します。x/y/imageはそれぞれ座標と画像データです。  
  imageがnilのままでSprite#drawを呼び出すと例外が発生します。  
  また、imageがnilでもcollisionが設定されていれば描画はできなくても衝突判定は可能です。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * X座標
  * **image** *Image|RenderTarget*
    * 描画元の画像オブジェクト




<a name='Sprite.check'></a>
#### check(o, d, shot=:shot, hit=:hit) -> bool
* 衝突判定を行います。  
  判定範囲はSprite#collision=による指定、それが無い場合はSprite#image=で設定された画像サイズの矩形でなされます。  
  どちらも指定されていないと例外が生じます。  
  衝突が検出された場合、o側のSpriteオブジェクトのshotメソッド、d側のhitメソッドが順に呼ばれます。  
  衝突判定範囲にはSpriteオブジェクトのangle/scale_x/scale_y/center_x/center_yが反映されます。  
  Sprite#collision_sync=falseで反映されなくなります。  
  shot/hitメソッドの戻り値としてシンボルの:discardを返すと、そのcheck呼び出し内のそれ以後はオブジェクトのshot/hitが呼ばれなくなります。  
  衝突相手のshot/hitも呼ばれません。  
  どれかひとつでも衝突していればtrue、どれも衝突していなければfalseを返します。
  * **o** *Sprite|Array*
    * SpriteオブジェクトもしくはSpriteオブジェクトの配列。  
      配列内にSprite以外のオブジェクトがあった場合、無視されます。
  * **d** *Sprite|Array*
    * SpriteオブジェクトもしくはSpriteオブジェクトの配列。  
      配列内にSprite以外のオブジェクトがあった場合、無視されます。
  * **shot** *Symbol*
    * 衝突が検出された場合に呼び出されるメソッド名のシンボル。  
      nilを指定すると呼ばれません。  
      oとdが同じ配列である場合は呼び出されません。
  * **hit** *Symbol*
    * 衝突が検出された場合に呼び出されるメソッド名のシンボル。  
      nilを指定すると呼ばれません。  
      oとdが同じ配列である場合は双方のhitメソッドが呼ばれます。
* SEE ALSO
  * <a href='#Sprite_23collision'>Sprite#collision</a>
  * <a href='#Sprite_23collision_sync'>Sprite#collision_sync</a>





<a name='Sprite.update'></a>
#### update(ary)
* 配列内のすべてのオブジェクトのupdateメソッドを呼び出します。  
  updateメソッドがないオブジェクトは無視します。  
  vanished?がある場合は呼び出して、trueのオブジェクトも無視します。  
  配列の配列を渡すとネストして処理します。
  * **ary** *Array*
    * オブジェクトの配列




<a name='Sprite.draw'></a>
#### draw(ary)
* 配列内のすべてのオブジェクトのdrawメソッドを呼び出します。  
  drawメソッドがないオブジェクトの場合は単に無視します。  
  vanished?がある場合は呼び出して、trueのオブジェクトも無視します。  
  配列の配列を渡すとネストして処理します。
  * **ary** *Array*
    * オブジェクトの配列




<a name='Sprite.clean'></a>
#### clean(ary)
* 配列内のすべてのオブジェクトのvanished?メソッドを呼び出し、trueが返ってきた要素と、もともとnilだった要素を削除します。  
  配列の配列を渡すとネストして処理します。
  * **ary** *Array*
    * オブジェクトの配列


----

### インスタンスメソッド

<a name='Sprite_23draw'></a>
#### draw
* selfを描画します。




<a name='Sprite_23_3D_3D_3D'></a>
#### ===(sprite) -> bool
* 渡されたspriteとselfとの衝突チェックを行います。  
  衝突していた場合にtrueを、衝突していなかった場合はfalseを返します。
  * **sprite** *Sprite|Array*
    * SpriteオブジェクトもしくはSpriteオブジェクトの配列
* SEE ALSO
  * <a href='#Sprite_23check'>Sprite#check</a>





<a name='Sprite_23check'></a>
#### check(sprite) -> Array
* 衝突しているSpriteオブジェクトの配列を返します。  
  衝突していなかった場合は空の配列になります。
  * **sprite** *Sprite|Array*
    * SpriteオブジェクトもしくはSpriteオブジェクトの配列
* SEE ALSO
  * <a href='#Sprite_23_3D_3D_3D'>Sprite#===</a>





<a name='Sprite_23x'></a>
#### x -> Integer
* X座標を返します。




<a name='Sprite_23x_3D'></a>
#### x=(pos)
* X座標を変更します。
  * **pos** *Integer*
    * X座標




<a name='Sprite_23y'></a>
#### y -> Integer
* Y座標を返します。




<a name='Sprite_23y_3D'></a>
#### y=(pos)
* Y座標を変更します。
  * **pos** *Integer*
    * Y座標




<a name='Sprite_23z'></a>
#### z -> Integer|Float
* 描画順序を返します。




<a name='Sprite_23z_3D'></a>
#### z=(val)
* 描画順序。小さいほど奥になり、同じ値の場合は最初にdrawしたものが一番奥になります。
  * **val** *Integer*
    * 描画順序




<a name='Sprite_23angle'></a>
#### angle -> Integer
* 描画時の回転角度を返します。デフォルト値はnilです。




<a name='Sprite_23angle_3D'></a>
#### angle=(val)
* 描画時の回転角度を変更します。デフォルト値はnilです。
  * **val** *Integer*
    * 360度系で画像の回転角度を指定します。




<a name='Sprite_23scale_x'></a>
#### scale_x -> Float
* 描画時のX軸方向の拡大率を返します。デフォルト値はnilです。




<a name='Sprite_23scale_x_3D'></a>
#### scale_x=(val)
* 描画時のX軸方向の拡大率を変更します。1が等倍、-1で左右反転します。デフォルト値はnilです。
  * **val** *Float*
    * X軸方向の拡大率




<a name='Sprite_23scale_y'></a>
#### scale_y -> Float
* 描画時のY軸方向の拡大率を返します。デフォルト値はnilです。




<a name='Sprite_23scale_y_3D'></a>
#### scale_y=(val)
* 描画時のY軸方向の拡大率を変更します。1が等倍、-1で上下反転します。デフォルト値はnilです。
  * **val** *Float*
    * Y軸方向の拡大率




<a name='Sprite_23center_x'></a>
#### center_x -> Integer
* 描画時の画像の拡大、回転中心とするX座標を返します。  
  デフォルト値はSprite#image=で設定された画像の中心となるX座標です。




<a name='Sprite_23center_x_3D'></a>
#### center_x=(pos)
* 描画時の画像の拡大、回転中心とするX座標を変更します。
  * **pos** *Integer*
    * X座標




<a name='Sprite_23center_y'></a>
#### center_y -> Integer
* 描画時の画像の拡大、回転中心とするY座標を返します。  
  デフォルト値はSprite#image=で設定された画像の中心となるY座標です。




<a name='Sprite_23center_y_3D'></a>
#### center_y=(pos)
* 描画時の画像の拡大、回転中心とするY座標を変更します。
  * **pos** *Integer*
    * Y座標




<a name='Sprite_23alpha'></a>
#### alpha -> Integer
* 描画時のアルファ値を返します。デフォルト値はnilです。




<a name='Sprite_23alpha_3D'></a>
#### alpha=(val)
* 描画時のアルファ値を変更します。デフォルト値はnilです。  
  範囲は0(完全に透明)から255(完全に不透明)までです。
  * **val** *Integer*
    * アルファ値




<a name='Sprite_23blend'></a>
#### blend -> Symbol
* 描画時の合成方法を返します。デフォルト値はnilです。




<a name='Sprite_23blend_3D'></a>
#### blend=(val)
* 描画時の合成方法を変更します。
  * **val** *Symbol*
    * :alpha :blend :alpha、:none、:add、:add2、:subのいずれかを指定します。  
      :noneは透明色、半透明色もそのまま上書き描画します。  
      :addはソースにアルファ値を、:add2は背景に255-アルファ値を適用します。  
      :subはアルファ値を全ての色の合成に、:sub2はRGBの色をそれぞれ別々に合成に適用します。




<a name='Sprite_23shader'></a>
#### shader -> Shader
* 描画時に適用するShaderオブジェクトを返します。デフォルト値はnilです。




<a name='Sprite_23shader_3D'></a>
#### shader=(val)
* 描画時に適用するShaderオブジェクトを変更します。
  * **val** *Shader*
    * 適用するShaderオブジェクト




<a name='Sprite_23image'></a>
#### image -> Image|RenderTarget
* Sprite#drawで描画される画像を返します。




<a name='Sprite_23image_3D'></a>
#### image=(image)
* Sprite#drawで描画される画像を変更します。
  * **image** *Image|RenderTarget*
    * 描画元の画像オブジェクト




<a name='Sprite_23target'></a>
#### target -> RenderTarget|nil
* Sprite#drawで描画する先を返します。  
  デフォルト値はnilです。




<a name='Sprite_23target_3D'></a>
#### target=(val)
* Sprite#drawで描画する先をスクリーンではなくRenderTargetオブジェクトにする場合に指定します。  
  デフォルト値はnilで、nilの場合はスクリーンに描画されます。
  * **val** *RenderTarget*
    * drawで描画する先となるRenderTargetオブジェクト




<a name='Sprite_23collision'></a>
#### collision
* 衝突判定範囲を返します。  
  デフォルト値はnilで、nilの場合にはimageで設定された画像サイズの矩形が判定に使われます。  
  衝突判定範囲をさらに配列に入れて設定すると、それらのどれかが衝突していた場合にこのオブジェクトが衝突したと判定されます。  
  画像の回転・スケーリングに連動して座標は変わりますが、点の場合のみスケーリングしても1ピクセルサイズのままとなります。




<a name='Sprite_23collision_3D'></a>
#### collision=(val)
* 衝突判定範囲を設定します。  
  設定するのは配列で、要素の数で形状が決まります。  
  座標はSprite#x, Sprite#yの値からの相対位置です。
  * **val** *Array*
    * 配列要素数によって意味が変わります。  
      要素2つの配列は[x, y]として1ピクセルの点を表します。  
      要素3つの配列は[x, y, r]として中心(x, y)から半径rのサイズの円を表します。  
      要素4つの配列は[x1, y1, x2, y2]として左上(x1, y1)と右下(x2, y2)を結ぶ矩形を表します。  
      要素6つの配列は[x1, y1, x2, y2, x3, y3]として(x1, y1)～(x2, y2)～(x3, y3)を結ぶ三角形を表します。




<a name='Sprite_23collision_enable'></a>
#### collision_enable -> bool
* 衝突判定の有効、無効を返します。  
  デフォルト値はtrueです。




<a name='Sprite_23collision_enable_3D'></a>
#### collision_enable=(val)
* 衝突判定の有効、無効を返します。
  * **val** *bool*
    * trueの場合に衝突判定が有効、falseで無効となります。




<a name='Sprite_23collision_sync'></a>
#### collision_sync -> bool
* 衝突判定範囲に回転/スケーリングを加味するかを返します。  
  デフォルト値はtrueです。  
  falseにすると衝突判定の計算負荷が減ります。




<a name='Sprite_23collision_sync_3D'></a>
#### collision_sync=(val)
* 衝突判定範囲に回転/スケーリングを加味するかを変更します。  
  デフォルト値はtrueです。
  * **val** *bool*
    * 回転/スケーリングを加味する場合はtrue




<a name='Sprite_23visible'></a>
#### visible -> bool
* Sprite#drawにおいて実際に描画するかを返します。デフォルト値はtrueです。




<a name='Sprite_23visible_3D'></a>
#### visible=(val)
* Sprite#drawにおいて実際に描画するかを変更します。  
  デフォルト値はtrueです。flaseにするとSprite#draw実行時に描画されません。
  * **val** *bool*
    * draw時に描画する場合はtrue




<a name='Sprite_23vanish'></a>
#### vanish
* vanishメソッドはSpriteを無効化します。  
  デフォルトは有効状態で、一度無効化すると有効状態に戻す手段はありません。




<a name='Sprite_23vanished_3F'></a>
#### vanished? -> bool
* Sprite#vanishによって無効化されている場合にtrueを返します。  
  無効状態のSpriteオブジェクトは描画、衝突判定されません。  
  Sprite.cleanで配列から削除されます。




<a name='Sprite_23param_hash'></a>
#### param_hash -> Hash
* Window.draw_exに渡すことのできるHashオブジェクトを返します。




<a name='Sprite_23offset_sync'></a>
#### offset_sync -> bool
* オフセット同期モードを返します。デフォルト値はfalseです。




<a name='Sprite_23offset_sync_3D'></a>
#### offset_sync=(val)
* trueの場合オフセット同期モードとなり、  
  Sprite#center_x, Sprite#center_yに設定した位置がx/yの位置にくるように補正されます。  
  デフォルト値はfalseです。
  * **val** *bool*
    * オフセット同期モード




