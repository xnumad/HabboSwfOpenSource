package com.sulake.core.assets
{
    import flash.geom.Rectangle;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import flash.display.Loader;
    import flash.display.Bitmap;
    import flash.utils.ByteArray;
    import flash.events.Event;

    public class BitmapDataAsset implements ILazyAsset 
    {
        protected static var _instances:uint = 0;
        protected static var _allocatedByteCount:uint = 0;
        private static const CLONE_BITMAP_DATA:Boolean = false;
        private static const USE_ASYNC_LOADER:Boolean = false;
        private static const IMMEDIATE_PREPARE:Boolean = false;

        public var name:String;
        private var _disposed:Boolean = false;
        private var _rectangle:Rectangle;
        private var _unknown:Object;
        private var _bitmap:BitmapData;
        private var _offset:Point;
        private var _flipH:Boolean = false;
        private var _flipV:Boolean = false;
        private var _decl:AssetTypeDeclaration;
        private var _url:String;
        private var _loader:Loader;
        private var _swapId:int = -1;
        private var _ownsData:Boolean = true;

        public function BitmapDataAsset(_decl:AssetTypeDeclaration, _url:String=null)
        {
            this._offset = new Point(0, 0);
            super();
            this._decl = _decl;
            this._url = _url;
            _instances++;
        }

        public static function get instances():uint
        {
            return _instances;
        }

        public static function get allocatedByteCount():uint
        {
            return _allocatedByteCount;
        }


        public function get url():String
        {
            return this._url;
        }

        public function get flipH():Boolean
        {
            return this._flipH;
        }

        public function get flipV():Boolean
        {
            return this._flipV;
        }

        public function get offset():Point
        {
            return this._offset;
        }

        public function get content():Object
        {
            if (!this._bitmap)
            {
                this.prepareLazyContent();
            }
            return this._bitmap;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get rectangle():Rectangle
        {
            var k:BitmapData;
            if (!this._rectangle)
            {
                k = BitmapData(this.content);
                if (k)
                {
                    this._rectangle = k.rect;
                }
            }
            return this._rectangle;
        }

        public function get declaration():AssetTypeDeclaration
        {
            return this._decl;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                _instances--;
                if (this._bitmap)
                {
                    try
                    {
                        _allocatedByteCount = (_allocatedByteCount - ((this._bitmap.width * this._bitmap.height) * 4));
                        if (this._ownsData)
                        {
                            this._bitmap.dispose();
                        }
                    }
                    catch(e:Error)
                    {
                    }
                }
                if ((this._unknown is BitmapData))
                {
                    if (this._ownsData)
                    {
                        (this._unknown as BitmapData).dispose();
                    }
                }
                else
                {
                    if ((this._unknown is Bitmap))
                    {
                        (this._unknown as Bitmap).bitmapData.dispose();
                    }
                    else
                    {
                        if ((this._unknown is ByteArray))
                        {
                            (this._unknown as ByteArray).clear();
                        }
                    }
                }
                this._unknown = null;
                this._bitmap = null;
                this._offset = null;
                this._decl = null;
                this._url = null;
                this._rectangle = null;
                this._disposed = true;
            }
        }

        public function setUnknownContent(unknownContent:Object):void
        {
            if (unknownContent == null)
            {
            }
            if (this._bitmap)
            {
                if (this._bitmap == (unknownContent as BitmapData))
                {
                    return;
                }
                if (this._ownsData)
                {
                    this._bitmap.dispose();
                }
            }
            this._unknown = unknownContent;
            this._bitmap = null;
            if (IMMEDIATE_PREPARE)
            {
                this.prepareLazyContent();
            }
        }

        public function prepareLazyContent():void
        {
            if (this._swapId != -1)
            {
                this._swapId = -1;
            }
            if (this._unknown == null)
            {
                return;
            }
            if ((this._unknown is Class))
            {
                var unknownContent:Object = new ((this._unknown as Class))();
                var bitmapContent:Bitmap = (unknownContent as Bitmap);
                if (bitmapContent != null)
                {
                    if (CLONE_BITMAP_DATA)
                    {
                        this._bitmap = bitmapContent.bitmapData.clone();
                        bitmapContent.bitmapData.dispose();
                    }
                    else
                    {
                        this._bitmap = bitmapContent.bitmapData;
                        bitmapContent.bitmapData = null;
                    }
                    if (this._bitmap != null)
                    {
                        _allocatedByteCount = (_allocatedByteCount + ((this._bitmap.width * this._bitmap.height) * 4));
                        this._unknown = null;
                        return;
                    }
                    unknownContent = new BitmapData(20, 20, true, 0xFF0000);
                }
                this._bitmap = (unknownContent as BitmapData);
                if (this._bitmap != null)
                {
                    this._unknown = null;
                    return;
                }
            }
			
            if ((this._unknown is Bitmap))
            {
                var unknownBitmap:Bitmap = Bitmap(this._unknown);
                this._bitmap = unknownBitmap.bitmapData;
                if (this._bitmap != null)
                {
                    this._unknown = null;
                }
                else
                {
                    throw (new Error("Failed to convert Bitmap to BitmapDataAsset!"));
                }
            }
			
            if ((this._unknown is BitmapData))
            {
                this._bitmap = (this._unknown as BitmapData);
                if (this._bitmap != null)
                {
                    this._unknown = null;
                    return;
                }
                throw (new Error("Failed to convert BitmapData to BitmapDataAsset!"));
            }
			
            if ((this._unknown is BitmapDataAsset))
            {
                this._bitmap = BitmapDataAsset(this._unknown)._bitmap;
                this._offset = BitmapDataAsset(this._unknown)._offset;
                this._flipH = BitmapDataAsset(this._unknown)._flipH;
                this._flipV = BitmapDataAsset(this._unknown)._flipV;
                if (this._bitmap != null)
                {
                    this._unknown = null;
                    return;
                }
                throw (new Error("Failed to read content from BitmapDataAsset!"));
            }
			
            if ((this._unknown is ByteArray))
            {
                if (USE_ASYNC_LOADER)
                {
                    this._loader = new Loader();
                    this._loader.loadBytes((this._unknown as ByteArray));
                    this._loader.contentLoaderInfo.addEventListener(Event.COMPLETE, this.onLoaderComplete);
                }
                this._unknown = null;
            }
        }

        private function onLoaderComplete(event:Event):void
        {
            var loader:Loader = (event.currentTarget.loader as Loader);
            var bitmap:Bitmap = (loader.content as Bitmap);
            this._bitmap = bitmap.bitmapData;
            if (((this._loader) && (this._loader.contentLoaderInfo)))
            {
                this._loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, this.onLoaderComplete);
            }
            this._loader = null;
        }

        public function setFromOtherAsset(asset:IAsset):void
        {
            if ((asset is BitmapDataAsset))
            {
                this._bitmap = BitmapDataAsset(asset)._bitmap;
                this._offset = BitmapDataAsset(asset)._offset;
            }
            else
            {
                throw (new Error("Provided asset should be of type BitmapDataAsset!"));
            }
        }

        public function setParamsDesc(xml:XMLList):void
        {
            
            for each (var xmlEntry:XML in xml)
            {
                var key:String = xmlEntry.attribute("key");
                var value:String = xmlEntry.attribute("value");
				var values:Array;
                switch (key)
                {
                    case "offset":
                        values = value.split(",");
                        this._offset.x = parseInt(values[0]);
                        this._offset.y = parseInt(values[1]);
                        break;
                    case "region":
                        values = value.split(",");
                        if (!this._rectangle)
                        {
                            this._rectangle = new Rectangle();
                        }
                        this._rectangle.x = parseInt(values[0]);
                        this._rectangle.y = parseInt(values[1]);
                        this._rectangle.width = parseInt(values[2]);
                        this._rectangle.height = parseInt(values[3]);
                        break;
                    case "flipH":
                        this._flipH = ((value == "1") || (value == "true"));
                        break;
                    case "flipV":
                        this._flipV = ((value == "1") || (value == "true"));
                        break;
                }
            }
        }

        public function compress():void
        {
            if (((this._bitmap) && (this._ownsData)))
            {
            }
        }

        public function swapToDisk():void
        {
        }

        public function set ownsData(ownsData:Boolean):void
        {
            this._ownsData = ownsData;
        }
    }
}
