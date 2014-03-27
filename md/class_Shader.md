## module Shader
### 要約
Shaderはシェーダ言語であるHLSLを使ってプログラムを記述し、画像の描画時にGPU上で実行することで高速なエフェクトを実現するクラスです。  
扱いやすさの都合上、Shader::CoreクラスとShaderクラスに分かれており、Shader::CoreはHLSLを渡して実行バイナリを生成・保持するクラス、ShaderはHLSLに渡すパラメータを保持し描画時に指定するデータとなります。ShaderオブジェクトをWindow.draw_shaderやWindow.draw_ex(共にRenderTargetも可)、Sprite#shaderに渡すことでシェーダを使った描画が可能になります。  
HLSLはRubyとは違い、むしろCに近い言語となっています。Cなどが扱える人には習得は容易ですが、すでにHLSLを書ける人か、HLSLを勉強する意思のある人以外は既存のHLSLコードをコピーして使うとよいでしょう。

----

### 特異メソッド
#### new 
* Shaderオブジェクトを生成します。
  * **core** *Shader*
    * Shader::Coreオブジェクト
  * **technique_name** *String*
    * HLSL内にtechniqueが複数ある場合にどれを使うかを選択します。  
      省略すると1つ目に定義されたtechniqueになります。


----

### インスタンスメソッド
#### technigue  -> String
* technique名を取得します。


----

#### technigue= 
* technique名を設定します。
  * **name** *String*
    * technique名


----

#### setter/getter 
* Shader::Coreクラスに定義したパラメータ名のSetter/Getterが特異メソッドとして自動で追加されます。  
  これらのメソッドで設定されたパラメータの値が描画時にHLSLに渡されます。



