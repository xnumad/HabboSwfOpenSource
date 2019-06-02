//com.sulake.core.assets.DisplayAsset

package com.sulake.core.assets{
    import flash.display.DisplayObject;

    public class DisplayAsset implements IAsset {

        protected var _url:String;
        protected var _content:DisplayObject;
        protected var _disposed:Boolean;
        protected var _declaration:AssetTypeDeclaration;

        public function DisplayAsset(k:AssetTypeDeclaration, _arg_2:String=null);

        public function get url():String;

        public function get content():Object;

        public function get disposed():Boolean;

        public function get declaration():AssetTypeDeclaration;

        public function dispose():void;

        public function setUnknownContent(k:Object):void;

        public function setFromOtherAsset(k:IAsset):void;

        public function setParamsDesc(k:XMLList):void;


    }
}//package com.sulake.core.assets

