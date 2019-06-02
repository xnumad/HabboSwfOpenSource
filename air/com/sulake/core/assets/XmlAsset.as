//com.sulake.core.assets.XmlAsset

package com.sulake.core.assets{
    public class XmlAsset implements ILazyAsset {

        private var _disposed:Boolean;
        private var _unknown:Object;
        private var _content:XML;
        private var _decl:AssetTypeDeclaration;
        private var _url:String;

        public function XmlAsset(k:AssetTypeDeclaration, _arg_2:String=null);

        public function get url():String;

        public function get content():Object;

        public function get disposed():Boolean;

        public function get declaration():AssetTypeDeclaration;

        public function dispose():void;

        public function setUnknownContent(k:Object):void;

        public function prepareLazyContent():void;

        public function setFromOtherAsset(k:IAsset):void;

        public function setParamsDesc(k:XMLList):void;

        public function toString():String;


    }
}//package com.sulake.core.assets

