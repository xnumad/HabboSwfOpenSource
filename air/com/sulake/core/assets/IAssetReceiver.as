//com.sulake.core.assets.IAssetReceiver

package com.sulake.core.assets{
    import com.sulake.core.runtime.IDisposable;

    public /*dynamic*/ interface IAssetReceiver extends IDisposable {

        function receiveAsset(k:IAsset, _arg_2:String):void;

    }
}//package com.sulake.core.assets

