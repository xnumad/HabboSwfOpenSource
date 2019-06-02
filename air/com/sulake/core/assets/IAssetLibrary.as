//com.sulake.core.assets.IAssetLibrary

package com.sulake.core.assets{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.utils.LibraryLoader;
    import flash.net.URLRequest;

    public /*dynamic*/ interface IAssetLibrary extends IDisposable {

        function get url():String;
        function get name():String;
        function get isReady():Boolean;
        function get numAssets():uint;
        function get manifest():XML;
        function get nameArray():Array;
        function loadFromFile(k:LibraryLoader, _arg_2:Boolean=true):void;
        function loadFromResource(k:XML, _arg_2:Class):Boolean;
        function unload():void;
        function loadAssetFromFile(k:String, _arg_2:URLRequest, _arg_3:String=null, _arg_4:String=null, _arg_5:int=-1, _arg_6:int=-1):AssetLoaderStruct;
        function getAssetByName(k:String):IAsset;
        function getAssetByContent(k:Object):IAsset;
        function getAssetByIndex(k:uint):IAsset;
        function getAssetIndex(k:IAsset):int;
        function hasAsset(k:String):Boolean;
        function setAsset(k:String, _arg_2:IAsset, _arg_3:Boolean=true):Boolean;
        function createAsset(k:String, _arg_2:AssetTypeDeclaration):IAsset;
        function removeAsset(k:IAsset):IAsset;
        function registerAssetTypeDeclaration(k:AssetTypeDeclaration, _arg_2:Boolean=true):Boolean;
        function getAssetTypeDeclarationByMimeType(k:String, _arg_2:Boolean=true):AssetTypeDeclaration;
        function getAssetTypeDeclarationByClass(k:Class, _arg_2:Boolean=true):AssetTypeDeclaration;
        function getAssetTypeDeclarationByFileName(k:String, _arg_2:Boolean=true):AssetTypeDeclaration;

    }
}//package com.sulake.core.assets

