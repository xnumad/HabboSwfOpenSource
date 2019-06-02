//com.sulake.core.assets.SoundAsset

package com.sulake.core.assets{
    import flash.media.Sound;

    public class SoundAsset implements IAsset {

        private var _disposed:Boolean;
        private var _content:Sound;
        private var _decl:AssetTypeDeclaration;
        private var _url:String;

        public function SoundAsset(k:AssetTypeDeclaration, _arg_2:String=null);

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

