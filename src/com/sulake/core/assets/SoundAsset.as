package com.sulake.core.assets
{
    import flash.media.Sound;
    import flash.utils.ByteArray;

    public class SoundAsset implements IAsset 
    {
        private var _disposed:Boolean = false;
        private var _content:Sound = null;
        private var _decl:AssetTypeDeclaration;
        private var _url:String;

        public function SoundAsset(k:AssetTypeDeclaration, _arg_2:String=null)
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
            return this._content as Object;
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
            if ((unknown is Sound))
            {
                if (this._content)
                {
                    this._content.close();
                }
                this._content = (unknown as Sound);
                return;
            }
            if ((unknown is ByteArray))
            {
            }
            if ((unknown is Class))
            {
                if (this._content)
                {
                    this._content.close();
                }
                this._content = (new ((unknown as Class))() as Sound);
                return;
            }
            if ((unknown is SoundAsset))
            {
                if (this._content)
                {
                    this._content.close();
                }
                this._content = SoundAsset(unknown)._content;
                return;
            }
        }

        public function setFromOtherAsset(asset:IAsset):void
        {
            if ((asset is SoundAsset))
            {
                this._content = SoundAsset(asset)._content;
            }
        }

        public function setParamsDesc(xml:XMLList):void
        {
        }
    }
}
