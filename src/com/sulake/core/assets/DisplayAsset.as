package com.sulake.core.assets
{
    import flash.display.DisplayObject;

    public class DisplayAsset implements IAsset 
    {
        protected var _url:String;
        protected var _content:DisplayObject;
        protected var _disposed:Boolean = false;
        protected var _decl:AssetTypeDeclaration;

        public function DisplayAsset(decl:AssetTypeDeclaration, url:String=null)
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
                if (this._content.loaderInfo != null)
                {
                    if (this._content.loaderInfo.loader != null)
                    {
                        this._content.loaderInfo.loader.unload();
                    }
                }
                this._content = null;
                this._decl = null;
                this._disposed = true;
                this._url = null;
            }
        }

        public function setUnknownContent(unknown:Object):void
        {
            if ((unknown is DisplayObject))
            {
                this._content = (unknown as DisplayObject);
                if (this._content != null)
                {
                    return;
                }
                throw (new Error("Failed to convert DisplayObject to DisplayAsset!"));
            }
            if ((unknown is DisplayAsset))
            {
                this._content = DisplayAsset(unknown)._content;
                this._decl = DisplayAsset(unknown)._decl;
                if (this._content == null)
                {
                    throw (new Error("Failed to read content from DisplayAsset!"));
                }
            }
        }

        public function setFromOtherAsset(asset:IAsset):void
        {
            if ((asset is DisplayAsset))
            {
                this._content = DisplayAsset(asset)._content;
                this._decl = DisplayAsset(asset)._decl;
            }
            else
            {
                throw (new Error("Provided asset should be of type DisplayAsset!"));
            }
        }

        public function setParamsDesc(xml:XMLList):void
        {
        }
    }
}
