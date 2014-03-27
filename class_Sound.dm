
class Sound
  音を表すクラスです。
  
  
  def self.new(path)
    ファイルを読み込み、Soundオブジェクトを生成して返します。
    ファイル形式は.mid（BGM用）と.wav（効果音用）に対応しています。
    @param path String ファイルパス
  
  
  def dispose
    selfのサウンドリソースを解放します。
    使わなくなったデータをdisposeしておくと、PCのメインメモリやサウンドメモリを節約することができ、
    また、GC時の負荷も軽くなります。
    dispose後、そのオブジェクトのメソッドを呼び出すと例外が発生します。
  
  
  def disposed? -> bool
    selfがdisposeされているかどうかをtrue/falseで返します。
  
  
  def play
    音を再生します。
    start、loopstart、loopend、loopcountをあらかじめ設定しておくと、部分ループなども可能となっています。
    同時にいくつでも再生できます。
    Sound#loopCount=で設定しない限り、midファイルは無限ループ、wavファイルは1回の再生となります。
  
  
  def start=(pos)
    再生開始位置を設定します。
    @param pos Integer 再生開始位置。初期値は0で、4分音符１個分で768です。


  def loop_start=(pos)
    ループ時の開始位置を設定します。
    @param pos Integer ループ時の開始位置。
      初期値は0で、4分音符１個分で768です。
    @see loop_end=
    @see loop_count=
  
  
  def loop_end=(pos)
    ループ時の終了位置を設定します。
    @param pos Integer ループ時の終了位置。
      初期値は0で、4分音符１個分で768です。
    @see loop_start=
    @see loop_count=
    

  def loop_count=(n)
    ループの再生回数を設定します。
    @param n Integer ループ回数。
      -1を設定すると無限ループになります。
    @see loop_start=
    @see loop_end=
    

  def stop
    音の再生を止めます。
  
  
  def set_volume(volume, time=0)
    ボリュームを設定します。
    @param volume Integer 0～255で、255が最大で、255は減衰0dBを表します。
      0にすると-96dBになります。
      初期値は230となっています。
    @param time Integer 現在の値から設定値までの変化にかける時間で、ミリ秒単位で指定します。
      省略すると0（即時に変更）となります。

