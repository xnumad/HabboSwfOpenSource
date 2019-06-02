//com.sulake.core.assets.TypeFaceAsset

package com.sulake.core.assets{
    import flash.text.Font;

    public class TypeFaceAsset implements IAsset {

        protected var _decl:AssetTypeDeclaration;
        protected var _content:Font;
        protected var _disposed:Boolean;

        public function TypeFaceAsset(k:AssetTypeDeclaration, _arg_2:String=null);

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

