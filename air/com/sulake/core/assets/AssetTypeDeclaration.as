//com.sulake.core.assets.AssetTypeDeclaration

package com.sulake.core.assets{
    public class AssetTypeDeclaration {

        private var _mimeType:String;
        private var _assetClass:Class;
        private var _loaderClass:Class;
        private var _fileTypes:Array;

        public function AssetTypeDeclaration(k:String, _arg_2:Class, _arg_3:Class=null, ... _args);

        public function get mimeType():String;

        public function get assetClass():Class;

        public function get loaderClass():Class;

        public function get fileTypes():Array;


    }
}//package com.sulake.core.assets

