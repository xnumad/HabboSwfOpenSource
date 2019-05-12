package com.sulake.core.assets
{
    import com.sulake.core.runtime.IDisposable;

    public interface IAsset extends IDisposable 
    {
        function get url():String;
        function get content():Object;
        function get declaration():AssetTypeDeclaration;
        function setUnknownContent(unknown:Object):void;
        function setFromOtherAsset(asset:IAsset):void;
        function setParamsDesc(xml:XMLList):void;
    }
}
