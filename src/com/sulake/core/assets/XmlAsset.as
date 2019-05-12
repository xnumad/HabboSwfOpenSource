package com.sulake.core.assets
{
    import flash.utils.ByteArray;

    public class XmlAsset implements ILazyAsset 
    {
        private var _disposed:Boolean = false;
        private var _unknown:Object;
        private var _content:XML;
        private var _decl:AssetTypeDeclaration;
        private var _url:String;

        public function XmlAsset(decl:AssetTypeDeclaration, url:String=null)
        {
            this._decl = decl;
            this._url = url;
        }

        public function get url():String
        {
            return this._url;
        }

        public function get content():Object
        {
            if (!this._content)
            {
                this.prepareLazyContent();
            }
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
                this._unknown = null;
                this._decl = null;
                this._url = null;
            }
        }

        public function setUnknownContent(unknown:Object):void
        {
            this._content = null;
            this._unknown = unknown;
        }

        public function prepareLazyContent():void
        {
            var content:ByteArray;
            if ((this._unknown is Class))
            {
                content = (new ((this._unknown as Class))() as ByteArray);
                this._content = new XML(content.readUTFBytes(content.length));
                return;
            }
            if ((this._unknown is ByteArray))
            {
                content = (this._unknown as ByteArray);
                this._content = new XML(content.readUTFBytes(content.length));
                return;
            }
            if ((this._unknown is String))
            {
                this._content = new XML((this._unknown as String));
                return;
            }
            if ((this._unknown is XML))
            {
                this._content = (this._unknown as XML);
                return;
            }
            if ((this._unknown is XmlAsset))
            {
                this._content = XmlAsset(this._unknown)._content;
                return;
            }
        }

        public function setFromOtherAsset(asset:IAsset):void
        {
            if ((asset is XmlAsset))
            {
                this._content = XmlAsset(asset)._content;
            }
            else
            {
                throw (Error("Provided asset is not of type XmlAsset!"));
            }
        }

        public function setParamsDesc(xml:XMLList):void
        {
        }

        public function toString():String
        {
            var k:String = "XmlAsset";
            k = (k + (" _url:" + this._url));
            k = (k + (" _content:" + this._content));
            k = (k + (" _unknown:" + this._unknown));
            return k;
        }
    }
}
