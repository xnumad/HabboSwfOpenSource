//com.sulake.core.assets.IAsset

package com.sulake.core.assets{
    import com.sulake.core.runtime.IDisposable;

    public /*dynamic*/ interface IAsset extends IDisposable {

        function get url():String;
        function get content():Object;
        function get declaration():AssetTypeDeclaration;
        function setUnknownContent(k:Object):void;
        function setFromOtherAsset(k:IAsset):void;
        function setParamsDesc(k:XMLList):void;

    }
}//package com.sulake.core.assets

