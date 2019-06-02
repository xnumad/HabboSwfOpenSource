//com.sulake.core.assets.UnknownAsset

package com.sulake.core.assets{
    public class UnknownAsset implements IAsset {

        private var _disposed:Boolean;
        private var _content:Object;
        private var _decl:AssetTypeDeclaration;
        private var _url:String;

        public function UnknownAsset(k:AssetTypeDeclaration, _arg_2:String=null);

        public function get url():String;

        public function get content():Object;

        public function get disposed():Boolean;

        public function get declaration():AssetTypeDeclaration;

        public function dispose():void;

        public function setUnknownContent(k:Object):void;

        public function setFromOtherAsset(k:IAsset):void;

        public function setParamsDesc(k:XMLList):void;

        public function toString():String;


    }
}//package com.sulake.core.assets

