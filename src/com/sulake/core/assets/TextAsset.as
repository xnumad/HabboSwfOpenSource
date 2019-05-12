package com.sulake.core.assets
{
    import flash.utils.ByteArray;

    public class TextAsset implements IAsset 
    {
        private var _disposed:Boolean = false;
        private var _content:String = "";
        private var _decl:AssetTypeDeclaration;
        private var _url:String;

        public function TextAsset(k:AssetTypeDeclaration, _arg_2:String=null)
        {
            this._decl = k;
            this._url = _arg_2;
        }

        public function get url():String
        {
            return this._url;
        }

        public function get content():Object
        {
            return this._content;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get declaration():AssetTypeDeclaration
        {
            return this._decl;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._disposed = true;
                this._content = null;
                this._decl = null;
                this._url = null;
            }
        }

        public function setUnknownContent(unknown:Object):void
        {
            var data:ByteArray;
            if ((unknown is String))
            {
                this._content = (unknown as String);
                return;
            }
            if ((unknown is Class))
            {
                data = (new ((unknown as Class))() as ByteArray);
                this._content = data.readUTFBytes(data.length);
                return;
            }
            if ((unknown is ByteArray))
            {
                data = (unknown as ByteArray);
                this._content = data.readUTFBytes(data.length);
                return;
            }
            if ((unknown is TextAsset))
            {
                this._content = TextAsset(unknown)._content;
                return;
            }
            this._content = ((unknown) ? unknown.toString() : "");
        }

        public function setFromOtherAsset(asset:IAsset):void
        {
            if ((asset is TextAsset))
            {
                this._content = TextAsset(asset)._content;
            }
            else
            {
                throw (Error("Provided asset is not of type TextAsset!"));
            }
        }

        public function setParamsDesc(xml:XMLList):void
        {
        }
    }
}
