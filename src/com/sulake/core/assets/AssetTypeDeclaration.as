package com.sulake.core.assets
{
    public class AssetTypeDeclaration 
    {
        private var _mimeType:String;
        private var _assetClass:Class;
        private var _loaderClass:Class;
        private var _fileTypes:Array;

        public function AssetTypeDeclaration(mimeType:String, assetClass:Class, loaderClass:Class=null, ... fileTypes)
        {
            this._mimeType = mimeType;
            this._assetClass = assetClass;
            this._loaderClass = loaderClass;
            if (fileTypes == null)
            {
                this._fileTypes = new Array();
            }
            else
            {
                this._fileTypes = fileTypes;
            }
        }

        public function get mimeType():String
        {
            return this._mimeType;
        }

        public function get assetClass():Class
        {
            return this._assetClass;
        }

        public function get loaderClass():Class
        {
            return this._loaderClass;
        }

        public function get fileTypes():Array
        {
            return this._fileTypes;
        }
    }
}
