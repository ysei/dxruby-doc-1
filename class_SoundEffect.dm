
class SoundEffect
  効果音を生成するクラスです。
  矩形波で、周波数とボリュームを1ms単位で変化させることができます。
  
  
  def self.new(time, wave_type=WAVE_RECT, resolution=1000) { }
    効果音を生成します。
    ブロックは、1ミリ秒ごとの周波数とボリュームの変化を返す式を書きます。
    timeの数だけ呼ばれます。
    ブロックが返す値は配列で、[周波数, ボリューム]としてください。
    周波数は44.1kHzまで、ボリュームは0が無音で最大255までです。
    @param time Integer ミリ秒単位の時間
    @param wave_type Constant 基本波形の形状を示す定数。省略すると矩形波になります。
      WAVE_SIN(サイン波)
      WAVE_SAW(ノコギリ波)
      WAVE_TRI(三角波)
      WAVE_RECT(矩形波)  
    @param resolution Integer 分解能。省略値は1000(1秒あたり1000回呼び出される)です。
      最大44100まで指定できます。
   
   
   
   def dispose
    selfのサウンドリソースを解放します。
  使わなくなったデータをdisposeしておくと、PCのメインメモリやサウンドメモリを節約することができ、
  また、GC時の負荷も軽くなります。
  dispose後、そのオブジェクトのメソッドを呼び出すと例外が発生します。
  
  
  def disposed? -> bool
    selfがdisposeされているかどうかをtrue/falseで返します。
  
  
  def add(wave_type=WAVE_RECT, resolution=1000) { }
    生成済みの効果音に、別の効果音を重ねます。
    結果として、波形が単純に合成されます。
  
  
  def play
    効果音を再生します。
    同時にいくつでも再生できますが、1つのSoundEffectオブジェクトは同時に1つしか再生できません。
    1回再生したら終わります。
  
  
  def stop
    音の再生を止めます。
  
  
  def save(path)
    音のデータをwav形式で保存します。
    @param path String データ保存先のファイルパス
