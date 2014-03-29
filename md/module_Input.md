## module Input
### 要約

キーボード・ゲームパッド・マウスの入力を扱います。

### 目次

<a href='#Input_23x'>x</a>
<a href='#Input_23y'>y</a>
<a href='#Input_23key_down_3F'>key_down?</a>
<a href='#Input_23key_push_3F'>key_push?</a>
<a href='#Input_23key_release_3F'>key_release?</a>
<a href='#Input_23pad_down_3F'>pad_down?</a>
<a href='#Input_23pad_push_3F'>pad_push?</a>
<a href='#Input_23pad_release_3F'>pad_release?</a>
<a href='#Input_23set_repeat'>set_repeat</a>
<a href='#Input_23set_key_repeat'>set_key_repeat</a>
<a href='#Input_23set_pad_repeat'>set_pad_repeat</a>
<a href='#Input_23set_config'>set_config</a>
<a href='#Input_23mouse_pos_x'>mouse_pos_x</a>
<a href='#Input_23mouse_pos_y'>mouse_pos_y</a>
<a href='#Input_23set_mouse_pos'>set_mouse_pos</a>
<a href='#Input_23mouse_down_3F'>mouse_down?</a>
<a href='#Input_23mouse_push_3F'>mouse_push?</a>
<a href='#Input_23mouse_release_3F'>mouse_release?</a>
<a href='#Input_23mouse_wheel_pos'>mouse_wheel_pos</a>
<a href='#Input_23mouse_wheel_pos_3D'>mouse_wheel_pos=</a>
<a href='#Input_23mouse_enable_3D'>mouse_enable=</a>
<a href='#Input_23keys'>keys</a>
<a href='#Input_23pads'>pads</a>
<a href='#Input_23update'>update</a>
<a href='#Input_23pad_num'>pad_num</a>
<a href='#Input_23pad_axis'>pad_axis</a>
<a href='#Input_23pad_lstick'>pad_lstick</a>
<a href='#Input_23pad_rstick'>pad_rstick</a>
<a href='#Input_23pad_pov'>pad_pov</a>
<a href='#Input_23pad_lx'>pad_lx</a>
<a href='#Input_23pad_ly'>pad_ly</a>
<a href='#Input_23pad_rx'>pad_rx</a>
<a href='#Input_23pad_ry'>pad_ry</a>
<a href='#Input_23pad_pov_x'>pad_pov_x</a>
<a href='#Input_23pad_pov_y'>pad_pov_y</a>
<a href='#Input_23set_cursor'>set_cursor</a>

----

### 特異メソッド

<a name='Input_23x'></a>
#### x(pad_number=0) -> Integer
* カーソルキー・パッドの方向キーの入力をX座標の増分(-1, 0, 1のいずれか)で返します。  
  pad_numberは省略すると0(パッド０もしくはキーボード）になります。
  * **pad_number** *Integer*
    * パッド番号




<a name='Input_23y'></a>
#### y(pad_number=0) -> Integer
* カーソルキー・パッドの方向キーの入力をY座標の増分(-1, 0, 1のいずれか)で返します。  
  pad_numberは省略すると0(パッド０もしくはキーボード）になります。
  * **pad_number** *Integer*
    * パッド番号




<a name='Input_23key_down_3F'></a>
#### key_down?(key_code) -> bool
* キーボードのキーの押下状態として押されているあいだtrueを返します。
  * **key_code** *Constant*
    * キーコード定数  
      K_ESCAPE  
      K_TAB  
      K_RETURN（フルキーのEnter）  
      K_LCONTROL  
      K_LSHIFT  
      K_LMENU（ALTキー）  
      K_SPACE  
      K_A（アルファベットいろいろ）  
      K_1（フルキーの数字いろいろ）  
      K_F1（ファンクションキーいろいろ）  
      K_NUMPAD0（テンキーの数字いろいろ）  
      K_NUMPADENTER（テンキーのEnter）  
      K_PGUP（PageUp）  
      K_PGDN（PageDown）  
      K_UP  
      K_LEFT  
      K_RIGHT  
      K_DOWN  
      これらの他はキーコード定数表を参照してください
* SEE ALSO
  * <a href='#Input_23key_push_3F'>Input#key_push?</a>
  * <a href='#Input_23key_release_3F'>Input#key_release?</a>





<a name='Input_23key_push_3F'></a>
#### key_push?(key_code) -> bool
* キーボードのキーの押下状態として押した瞬間のみtrueを返します。
  * **key_code** *Constant*
    * キーコード定数  
      K_ESCAPE  
      K_TAB  
      K_RETURN（フルキーのEnter）  
      K_LCONTROL  
      K_LSHIFT  
      K_LMENU（ALTキー）  
      K_SPACE  
      K_A（アルファベットいろいろ）  
      K_1（フルキーの数字いろいろ）  
      K_F1（ファンクションキーいろいろ）  
      K_NUMPAD0（テンキーの数字いろいろ）  
      K_NUMPADENTER（テンキーのEnter）  
      K_PGUP（PageUp）  
      K_PGDN（PageDown）  
      K_UP  
      K_LEFT  
      K_RIGHT  
      K_DOWN  
      これらの他はキーコード定数表を参照してください
* SEE ALSO
  * <a href='#Input_23key_down_3F'>Input#key_down?</a>
  * <a href='#Input_23key_release_3F'>Input#key_release?</a>





<a name='Input_23key_release_3F'></a>
#### key_release?(key_code) -> bool
* キーボードのキーの押下状態として離した瞬間のみtrueを返します。
  * **key_code** *Constant*
    * キーコード定数  
      K_ESCAPE  
      K_TAB  
      K_RETURN（フルキーのEnter）  
      K_LCONTROL  
      K_LSHIFT  
      K_LMENU（ALTキー）  
      K_SPACE  
      K_A（アルファベットいろいろ）  
      K_1（フルキーの数字いろいろ）  
      K_F1（ファンクションキーいろいろ）  
      K_NUMPAD0（テンキーの数字いろいろ）  
      K_NUMPADENTER（テンキーのEnter）  
      K_PGUP（PageUp）  
      K_PGDN（PageDown）  
      K_UP  
      K_LEFT  
      K_RIGHT  
      K_DOWN  
      これらの他はキーコード定数表を参照してください
* SEE ALSO
  * <a href='#Input_23key_down_3F'>Input#key_down?</a>
  * <a href='#Input_23key_push_3F'>Input#key_push?</a>





<a name='Input_23pad_down_3F'></a>
#### pad_down?(pad_code, pad_number=0) -> bool
* パッドのボタン状態として押されているあいだtrueを返します。  
  pad_numberが0の場合、デフォルトでは十字ボタンとカーソルキー、  
  P_BUTTON0とZ、P_BUTTON1とX、P_BUTTON2とCが割り当てられています。
  * **pad_code** *Constant*
    * ボタン定数  
      P_UP  
      P_LEFT  
      P_RIGHT  
      P_DOWN  
      P_BUTTON0（ボタン１５まで）  
      P_L_UP(アナログ左スティックのデジタル入力)  
      P_L_LEFT  
      P_L_RIGHT  
      P_L_DOWN  
      P_R_UP(アナログ右スティックのデジタル入力)  
      P_R_LEFT  
      P_R_RIGHT  
      P_R_DOWN  
      P_D_UP(アナログPOVのデジタル入力)  
      P_D_LEFT  
      P_D_RIGHT  
      P_D_DOWN
  * **pad_number** *Integer*
    * パッド番号
* SEE ALSO
  * <a href='#Input_23pad_push_3F'>Input#pad_push?</a>
  * <a href='#Input_23pad_release_3F'>Input#pad_release?</a>





<a name='Input_23pad_push_3F'></a>
#### pad_push?(pad_code, pad_number=0) -> bool
* パッドのボタン状態として押した瞬間のみtrueを返します。  
  pad_numberが0の場合、デフォルトでは十字ボタンとカーソルキー、  
  P_BUTTON0とZ、P_BUTTON1とX、P_BUTTON2とCが割り当てられています。
  * **pad_code** *Constant*
    * ボタン定数  
      P_UP  
      P_LEFT  
      P_RIGHT  
      P_DOWN  
      P_BUTTON0（ボタン１５まで）  
      P_L_UP(アナログ左スティックのデジタル入力)  
      P_L_LEFT  
      P_L_RIGHT  
      P_L_DOWN  
      P_R_UP(アナログ右スティックのデジタル入力)  
      P_R_LEFT  
      P_R_RIGHT  
      P_R_DOWN  
      P_D_UP(アナログPOVのデジタル入力)  
      P_D_LEFT  
      P_D_RIGHT  
      P_D_DOWN
  * **pad_number** *Integer*
    * パッド番号
* SEE ALSO
  * <a href='#Input_23pad_down_3F'>Input#pad_down?</a>
  * <a href='#Input_23pad_release_3F'>Input#pad_release?</a>





<a name='Input_23pad_release_3F'></a>
#### pad_release?(pad_code, pad_number=0) -> bool
* パッドのボタン状態として離した瞬間のみtrueを返します。  
  pad_numberが0の場合、デフォルトでは十字ボタンとカーソルキー、  
  P_BUTTON0とZ、P_BUTTON1とX、P_BUTTON2とCが割り当てられています。
  * **pad_code** *Constant*
    * ボタン定数  
      P_UP  
      P_LEFT  
      P_RIGHT  
      P_DOWN  
      P_BUTTON0（ボタン１５まで）  
      P_L_UP(アナログ左スティックのデジタル入力)  
      P_L_LEFT  
      P_L_RIGHT  
      P_L_DOWN  
      P_R_UP(アナログ右スティックのデジタル入力)  
      P_R_LEFT  
      P_R_RIGHT  
      P_R_DOWN  
      P_D_UP(アナログPOVのデジタル入力)  
      P_D_LEFT  
      P_D_RIGHT  
      P_D_DOWN
  * **pad_number** *Integer*
    * パッド番号
* SEE ALSO
  * <a href='#Input_23pad_down_3F'>Input#pad_down?</a>
  * <a href='#Input_23pad_push_3F'>Input#pad_push?</a>





<a name='Input_23set_repeat'></a>
#### set_repeat(wait, interval)
* key_push?、pad_push?メソッドを、オートリピートモードにします。  
  両方を1にすると毎フレーム入力、つまりkeyDown?/padDown?と同じ動作になります。  
  両方を0にすると解除です。
  * **wait** *Integer*
    * 初めの入力があってからリピートを開始するまでの時間（フレーム数）です。
  * **interval** *Integer*
    * リピート開始してからの、入力がONになる間隔（フレーム数）です。




<a name='Input_23set_key_repeat'></a>
#### set_key_repeat(key_code, wait, interval)
* 特定のキーのみkeyPush?メソッドをオートリピートモードにします。
  * **key_code** *Constant*
    * キーコード定数  
      K_ESCAPE  
      K_TAB  
      K_RETURN（フルキーのEnter）  
      K_LCONTROL  
      K_LSHIFT  
      K_LMENU（ALTキー）  
      K_SPACE  
      K_A（アルファベットいろいろ）  
      K_1（フルキーの数字いろいろ）  
      K_F1（ファンクションキーいろいろ）  
      K_NUMPAD0（テンキーの数字いろいろ）  
      K_NUMPADENTER（テンキーのEnter）  
      K_PGUP（PageUp）  
      K_PGDN（PageDown）  
      K_UP  
      K_LEFT  
      K_RIGHT  
      K_DOWN  
      これらの他はキーコード定数表を参照してください
  * **wait** *Integer*
    * 初めの入力があってからリピートを開始するまでの時間（フレーム数）です。
  * **interval** *Integer*
    * リピート開始してからの、入力がONになる間隔（フレーム数）です。
* SEE ALSO
  * <a href='#Input_23set_repeat'>Input#set_repeat</a>





<a name='Input_23set_pad_repeat'></a>
#### set_pad_repeat(pad_code, wait, interval, pad_number=0)
* 特定のパットボタンのみkeyPush?メソッドをオートリピートモードにします。
  * **pad_code** *Constant*
    * ボタン定数  
      P_UP  
      P_LEFT  
      P_RIGHT  
      P_DOWN  
      P_BUTTON0（ボタン１５まで）  
      P_L_UP(アナログ左スティックのデジタル入力)  
      P_L_LEFT  
      P_L_RIGHT  
      P_L_DOWN  
      P_R_UP(アナログ右スティックのデジタル入力)  
      P_R_LEFT  
      P_R_RIGHT  
      P_R_DOWN  
      P_D_UP(アナログPOVのデジタル入力)  
      P_D_LEFT  
      P_D_RIGHT  
      P_D_DOWN
  * **wait** *Integer*
    * 初めの入力があってからリピートを開始するまでの時間（フレーム数）です。
  * **interval** *Integer*
    * リピート開始してからの、入力がONになる間隔（フレーム数）です。
  * **pad_number** *Integer*
    * パッド番号
* SEE ALSO
  * <a href='#Input_23set_repeat'>Input#set_repeat</a>





<a name='Input_23set_config'></a>
#### set_config(pad_code, key_code, pad_number=0)
* パッドとキーの割り当てを設定します。  
  この設定の効果はkeyPush?/keyDown?/padPush?/padDown?メソッドを使った場合に有効で、  
  どちらかを押すと対応したもう一方のボタンも押されたものとして扱われます。  
  pad_codeもしくはkey_codeにnilを指定すると、  
  そのpad_codeやkey_codeに割り当てられたもの全てが解除されます。  
  デフォルトではパッド番号0の十字ボタンとカーソルキー、  
  P_BUTTON0とZ、P_BUTTON1とX、P_BUTTON2とCが割り当てられています。
  * **pad_code** *Constant*
    * ボタン定数  
      P_UP  
      P_LEFT  
      P_RIGHT  
      P_DOWN  
      P_BUTTON0（ボタン１５まで）  
      P_L_UP(アナログ左スティックのデジタル入力)  
      P_L_LEFT  
      P_L_RIGHT  
      P_L_DOWN  
      P_R_UP(アナログ右スティックのデジタル入力)  
      P_R_LEFT  
      P_R_RIGHT  
      P_R_DOWN  
      P_D_UP(アナログPOVのデジタル入力)  
      P_D_LEFT  
      P_D_RIGHT  
      P_D_DOWN
  * **key_code** *Constant*
    * キーコード定数  
      K_ESCAPE  
      K_TAB  
      K_RETURN（フルキーのEnter）  
      K_LCONTROL  
      K_LSHIFT  
      K_LMENU（ALTキー）  
      K_SPACE  
      K_A（アルファベットいろいろ）  
      K_1（フルキーの数字いろいろ）  
      K_F1（ファンクションキーいろいろ）  
      K_NUMPAD0（テンキーの数字いろいろ）  
      K_NUMPADENTER（テンキーのEnter）  
      K_PGUP（PageUp）  
      K_PGDN（PageDown）  
      K_UP  
      K_LEFT  
      K_RIGHT  
      K_DOWN  
      これらの他はキーコード定数表を参照してください
  * **pad_number** *Integer*
    * パッド番号




<a name='Input_23mouse_pos_x'></a>
#### mouse_pos_x -> Integer
* マウスのX座標を返します。  
  座標はウィンドウの左上を(0,0)としたスクリーン座標です。
* SEE ALSO
  * <a href='#Input_23mouse_pos_y'>Input#mouse_pos_y</a>
  * <a href='#Input_23set_mouse_pos'>Input#set_mouse_pos</a>





<a name='Input_23mouse_pos_y'></a>
#### mouse_pos_y -> Integer
* マウスのY座標を返します。  
  座標はウィンドウの左上を(0,0)としたスクリーン座標です。
* SEE ALSO
  * <a href='#Input_23mouse_pos_x'>Input#mouse_pos_x</a>
  * <a href='#Input_23set_mouse_pos'>Input#set_mouse_pos</a>





<a name='Input_23set_mouse_pos'></a>
#### set_mouse_pos(x, y)
* マウスの座標を設定します。  
  座標はウィンドウの左上を(0,0)としたスクリーン座標です。
  * **x** *Integer*
    * X座標
  * **y** *Integer*
    * Y座標
* SEE ALSO
  * <a href='#Input_23mouse_pos_x'>Input#mouse_pos_x</a>
  * <a href='#Input_23mouse_pos_y'>Input#mouse_pos_y</a>





<a name='Input_23mouse_down_3F'></a>
#### mouse_down?(mouse_code) -> bool
* マウスのボタン状態として、押されているあいだtrueを返します。
  * **mouse_code** *Constant*
    * マウスボタン定数  
      M_LBUTTON 左ボタン  
      M_MBUTTON 中ボタン  
      M_RBUTTON 右ボタン
* SEE ALSO
  * <a href='#Input_23mouse_push_3F'>Input#mouse_push?</a>
  * <a href='#Input_23mouse_release_3F'>Input#mouse_release?</a>





<a name='Input_23mouse_push_3F'></a>
#### mouse_push?(mouse_code) -> bool
* マウスのボタン状態として、押した瞬間のみtrueを返します。
  * **mouse_code** *Constant*
    * マウスボタン定数  
      M_LBUTTON 左ボタン  
      M_MBUTTON 中ボタン  
      M_RBUTTON 右ボタン
* SEE ALSO
  * <a href='#Input_23mouse_down_3F'>Input#mouse_down?</a>
  * <a href='#Input_23mouse_release_3F'>Input#mouse_release?</a>





<a name='Input_23mouse_release_3F'></a>
#### mouse_release?(mouse_code) -> bool
* マウスのボタン状態として、離した瞬間のみtrueを返します。
  * **mouse_code** *Constant*
    * マウスボタン定数  
      M_LBUTTON 左ボタン  
      M_MBUTTON 中ボタン  
      M_RBUTTON 右ボタン
* SEE ALSO
  * <a href='#Input_23mouse_down_3F'>Input#mouse_down?</a>
  * <a href='#Input_23mouse_push_3F'>Input#mouse_push?</a>





<a name='Input_23mouse_wheel_pos'></a>
#### mouse_wheel_pos -> Integer
* マウスのホイール位置を取得します。
* SEE ALSO
  * <a href='#Input_23mouse_wheel_pos_3D'>Input#mouse_wheel_pos=</a>





<a name='Input_23mouse_wheel_pos_3D'></a>
#### mouse_wheel_pos=(pos)
* マウスのホイール位置を設定します。
  * **pos** *Integer*
    * ホイール位置




<a name='Input_23mouse_enable_3D'></a>
#### mouse_enable=(val)
* マウスカーソルがウィンドウ上にある場合にカーソルを描画するどうかを指定します。
  * **val** *bool*
    * trueで描画、falseで描画しません。初期値はtrueです。




<a name='Input_23keys'></a>
#### keys -> Array
* 現在押されているキーのキー定数を配列にして返します。




<a name='Input_23pads'></a>
#### pads(pad_number=0) -> Array
* 現在押されているパッドのボタン定数を配列にして返します。
  * **pad_number** *Integer*
    * パッド番号




<a name='Input_23update'></a>
#### update -> bool
* 入力情報を更新します。  
  Window.loopの中で同じ処理がされていますので、Window.loopを使わずに  
  自分でゲームループを組み立てるときにだけ使ってください。  
  通常はfalseを返しますが、ウィンドウを閉じる操作がされたときにtrueを返します。  
  これを無視するとウィンドウを閉じる操作（右上のxボタンやALT+F4）が無視されるようになります。




<a name='Input_23pad_num'></a>
#### pad_num -> Integer
* 現在接続されているパッドの数を返します。




<a name='Input_23pad_axis'></a>
#### pad_axis(pad_number=0) -> Array
* アナログパッドの軸の入力を[x, y, z, rx, ry, rz]の配列で返します。  
  値はそれぞれ0.0～1.0のFloatオブジェクトです。  
  存在しない軸については0.0固定となります。  
  DirectInputデバイスの場合、デフォルトでは左スティックがxとy、右スティックがzとrzに入ります。
  * **pad_number** *Integer*
    * パッド番号




<a name='Input_23pad_lstick'></a>
#### pad_lstick(pad_number=0) -> Float
* アナログパッドの左スティックの入力を-1.0～1.0に補正して返します。  
  デバイスの定義により中心はきっかり0にはならない場合があります。
  * **pad_number** *Integer*
    * パッド番号




<a name='Input_23pad_rstick'></a>
#### pad_rstick(pad_number=0) -> Float
* アナログパッドの右スティックの入力を-1.0～1.0に補正して返します。  
  デバイスの定義により中心はきっかり0にはならない場合があります。
  * **pad_number** *Integer*
    * パッド番号




<a name='Input_23pad_pov'></a>
#### pad_pov(pad_number=0) -> Integer
* アナログパッドのPOV(ハットスイッチ、通常のスティック付パッドの場合は十字ボタン)の入力を角度の100倍の値(0～335999)で返します。  
  十字ボタンの場合は4500ごとの値になります。
  * **pad_number** *Integer*
    * パッド番号




<a name='Input_23pad_lx'></a>
#### pad_lx(pad_number=0) -> Integer
* アナログ入力デバイスのデジタル入力用です。  
  アナログパッドの左スティックのX軸入力を-1、0、1の値で返します。
  * **pad_number** *Integer*
    * パッド番号




<a name='Input_23pad_ly'></a>
#### pad_ly(pad_number=0) -> Integer
* アナログ入力デバイスのデジタル入力用です。  
  アナログパッドの左スティックのY軸入力を-1、0、1の値で返します。
  * **pad_number** *Integer*
    * パッド番号




<a name='Input_23pad_rx'></a>
#### pad_rx(pad_number=0) -> Integer
* アナログ入力デバイスのデジタル入力用です。  
  アナログパッドの右スティックのX軸入力を-1、0、1の値で返します。
  * **pad_number** *Integer*
    * パッド番号




<a name='Input_23pad_ry'></a>
#### pad_ry(pad_number=0) -> Integer
* アナログ入力デバイスのデジタル入力用です。  
  アナログパッドの右スティックのY軸入力を-1、0、1の値で返します。
  * **pad_number** *Integer*
    * パッド番号




<a name='Input_23pad_pov_x'></a>
#### pad_pov_x(pad_number=0) -> Integer
* アナログ入力デバイスのデジタル入力用です。  
  POVのX軸入力を-1、0、1の値で返します。
  * **pad_number** *Integer*
    * パッド番号




<a name='Input_23pad_pov_y'></a>
#### pad_pov_y(pad_number=0) -> Integer
* アナログ入力デバイスのデジタル入力用です。  
  POVのY軸入力を-1、0、1の値で返します。
  * **pad_number** *Integer*
    * パッド番号




<a name='Input_23set_cursor'></a>
#### set_cursor(cursor_type)
* マウスカーソルの形状を変更します。以下の値が使用できます。
  * **cursor_type** *Constant*
    * マウスカーソル定数  
      IDC_APPSTARTING 標準の矢印カーソルと小さい砂時計カーソル  
      IDC_ARROW 標準の矢印カーソル  
      IDC_CROSS 十字カーソル  
      IDC_HAND ハンドカーソル  
      IDC_HELP 矢印と疑問符  
      IDC_IBEAM アイビーム（ 縦線）カーソル  
      IDC_NO 禁止カーソル（ 円に左上から右下への斜線）  
      IDC_SIZEALL 4 方向の矢印カーソル  
      IDC_SIZENESW 右上と左下を指す両方向矢印カーソル  
      IDC_SIZENS 上下を指す両方向矢印カーソル  
      IDC_SIZENWSE 左上と右下を指す両方向矢印カーソル  
      IDC_SIZEWE 左右を指す両方向矢印カーソル  
      IDC_UPARROW 上を指す垂直の矢印カーソル  
      IDC_WAIT 砂時計カーソル



