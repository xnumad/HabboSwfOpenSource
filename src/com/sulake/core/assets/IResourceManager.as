package com.sulake.core.assets
{
    import com.sulake.core.runtime.IDisposable;

    public interface IResourceManager extends IDisposable 
    {
        function createAsset(_arg_1:String, _arg_2:Class, _arg_3:Object):IAsset;
        function retrieveAsset(_arg_1:String, _arg_2:IAssetReceiver):void;
        function isSameAsset(_arg_1:String, _arg_2:String):Boolean;
        function removeAsset(_arg_1:String):void;
    }
}
