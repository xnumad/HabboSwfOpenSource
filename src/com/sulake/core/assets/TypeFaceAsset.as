package com.sulake.core.assets
{
    import flash.text.Font;
    import com.sulake.core.utils.FontEnum;

    public class TypeFaceAsset implements IAsset 
    {
        protected var _decl:AssetTypeDeclaration;
        protected var _content:Font;
        protected var _disposed:Boolean = false;

        public function TypeFaceAsset(k:AssetTypeDeclaration, _arg_2:String=null)
        {
            this._decl = k;
        }

        public function get url():String
        {
            return null;
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
                this._decl = null;
                this._content = null;
                this._disposed = true;
            }
        }

        public function setUnknownContent(unknown:Object):void
        {
            try
            {
                if ((unknown is Class))
                {
                    this._content = Font(FontEnum.registerFont((unknown as Class)));
                }
            }
            catch(e:Error)
            {
                throw (new Error(("Failed to register font from resource: " + unknown)));
            }
        }

        public function setFromOtherAsset(asset:IAsset):void
        {
            if ((asset is TypeFaceAsset))
            {
                this._content = TypeFaceAsset(asset)._content;
            }
            else
            {
                throw (new Error("Provided asset should be of type FontAsset!"));
            }
        }

        public function setParamsDesc(xml:XMLList):void
        {
        }
    }
}
