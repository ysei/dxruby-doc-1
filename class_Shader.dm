

class Shader
  Shaderはシェーダ言語であるHLSLを使ってプログラムを記述し、画像の描画時にGPU上で実行することで高速なエフェクトを実現するクラスです。
  扱いやすさの都合上、Shader::CoreクラスとShaderクラスに分かれており、Shader::CoreはHLSLを渡して実行バイナリを生成・保持するクラス、ShaderはHLSLに渡すパラメータを保持し描画時に指定するデータとなります。ShaderオブジェクトをWindow.draw_shaderやWindow.draw_ex(共にRenderTargetも可)、Sprite#shaderに渡すことでシェーダを使った描画が可能になります。
  HLSLはRubyとは違い、むしろCに近い言語となっています。Cなどが扱える人には習得は容易ですが、すでにHLSLを書ける人か、HLSLを勉強する意思のある人以外は既存のHLSLコードをコピーして使うとよいでしょう。


  def self.new(core, technique_name=nil)
    Shaderオブジェクトを生成します。
    @param core Shader Shader::Coreオブジェクト
    @param technique_name String HLSL内にtechniqueが複数ある場合にどれを使うかを選択します。
      省略すると1つ目に定義されたtechniqueになります。
  
  
  def technigue -> String
    technique名を取得します。
  
  
  def technigue=(name)
    technique名を設定します。
    @param name String technique名
  
  
  def setter/getter
    Shader::Coreクラスに定義したパラメータ名のSetter/Getterが特異メソッドとして自動で追加されます。
    これらのメソッドで設定されたパラメータの値が描画時にHLSLに渡されます。


  class Core
    HLSLを渡して実行バイナリを生成・保持するクラス
    
    def self.new(hlsl, option={})
      hlslで指定されたHLSLプログラムのテキストをコンパイルし、バイナリを保持します。
      optionに指定されたパラメータをHLSLで受け取ることができます。
      実際に渡す値はShaderオブジェクトのSetter/Getterで設定し、ここではパラメータ名と型のみを指定します。
      optionに設定する値はパラメータ名をキーに、型を値に持たせたHashオブジェクトとなります。
      どちらもシンボルで指定してください。
      型に使えるシンボルは以下の3つです。
      :int
      :float
      :texture
      HLSL側の変数の型と一致させてください。
      また、float4などのベクトル型の場合は:floatと指定して、パラメータに渡す値は同じ要素数の配列とします。
      @param option Hash オプション
    
    
    def dispose
      HLSLプログラムのバイナリデータを解放します。
      dispose後、そのオブジェクトのメソッドを呼び出したり描画時に指定したりすると例外が発生します。


