## class Sound
### 要約

音を表すクラスです。

### 目次

<a href='#Sound.new'>new</a>
<a href='#Sound_23dispose'>dispose</a>
<a href='#Sound_23disposed_3F'>disposed?</a>
<a href='#Sound_23play'>play</a>
<a href='#Sound_23start_3D'>start=</a>
<a href='#Sound_23loop_start_3D'>loop_start=</a>
<a href='#Sound_23loop_end_3D'>loop_end=</a>
<a href='#Sound_23loop_count_3D'>loop_count=</a>
<a href='#Sound_23stop'>stop</a>
<a href='#Sound_23set_volume'>set_volume</a>

----

### 特異メソッド

<a name='Sound.new'></a>
#### new(path)
* ファイルを読み込み、Soundオブジェクトを生成して返します。  
  ファイル形式は.mid（BGM用）と.wav（効果音用）に対応しています。
  * **path** *String*
    * ファイルパス


----

### インスタンスメソッド

<a name='Sound_23dispose'></a>
#### dispose
* selfのサウンドリソースを解放します。  
  使わなくなったデータをdisposeしておくと、PCのメインメモリやサウンドメモリを節約することができ、  
  また、GC時の負荷も軽くなります。  
  dispose後、そのオブジェクトのメソッドを呼び出すと例外が発生します。




<a name='Sound_23disposed_3F'></a>
#### disposed? -> bool
* selfがdisposeされているかどうかをtrue/falseで返します。




<a name='Sound_23play'></a>
#### play
* 音を再生します。  
  start、loopstart、loopend、loopcountをあらかじめ設定しておくと、部分ループなども可能となっています。  
  同時にいくつでも再生できます。  
  Sound#loopCount=で設定しない限り、midファイルは無限ループ、wavファイルは1回の再生となります。




<a name='Sound_23start_3D'></a>
#### start=(pos)
* 再生開始位置を設定します。
  * **pos** *Integer*
    * 再生開始位置。初期値は0で、4分音符１個分で768です。




<a name='Sound_23loop_start_3D'></a>
#### loop_start=(pos)
* ループ時の開始位置を設定します。
  * **pos** *Integer*
    * ループ時の開始位置。  
      初期値は0で、4分音符１個分で768です。
* SEE ALSO
  * <a href='#Sound_23loop_end_3D'>Sound#loop_end=</a>
  * <a href='#Sound_23loop_count_3D'>Sound#loop_count=</a>





<a name='Sound_23loop_end_3D'></a>
#### loop_end=(pos)
* ループ時の終了位置を設定します。
  * **pos** *Integer*
    * ループ時の終了位置。  
      初期値は0で、4分音符１個分で768です。
* SEE ALSO
  * <a href='#Sound_23loop_start_3D'>Sound#loop_start=</a>
  * <a href='#Sound_23loop_count_3D'>Sound#loop_count=</a>





<a name='Sound_23loop_count_3D'></a>
#### loop_count=(n)
* ループの再生回数を設定します。
  * **n** *Integer*
    * ループ回数。  
      -1を設定すると無限ループになります。
* SEE ALSO
  * <a href='#Sound_23loop_start_3D'>Sound#loop_start=</a>
  * <a href='#Sound_23loop_end_3D'>Sound#loop_end=</a>





<a name='Sound_23stop'></a>
#### stop
* 音の再生を止めます。




<a name='Sound_23set_volume'></a>
#### set_volume(volume, time=0)
* ボリュームを設定します。
  * **volume** *Integer*
    * 0～255で、255が最大で、255は減衰0dBを表します。  
      0にすると-96dBになります。  
      初期値は230となっています。
  * **time** *Integer*
    * 現在の値から設定値までの変化にかける時間で、ミリ秒単位で指定します。  
      省略すると0（即時に変更）となります。




