package com.sulake.core.assets
{
    import com.sulake.core.runtime.IDisposable;

    public interface IAssetReceiver extends IDisposable 
    {
        function receiveAsset(_arg_1:IAsset, _arg_2:String):void;
    }
}
