//com.sulake.core.assets.IResourceManager

package com.sulake.core.assets{
    import com.sulake.core.runtime.IDisposable;

    public /*dynamic*/ interface IResourceManager extends IDisposable {

        function createAsset(k:String, _arg_2:Class, _arg_3:Object):IAsset;
        function retrieveAsset(k:String, _arg_2:IAssetReceiver):void;
        function isSameAsset(k:String, _arg_2:String):Boolean;
        function removeAsset(k:String):void;

    }
}//package com.sulake.core.assets

