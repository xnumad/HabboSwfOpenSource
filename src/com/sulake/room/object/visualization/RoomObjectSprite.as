package com.sulake.room.object.visualization
{
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.room.object.enum.AlphaTolerance;
    import com.sulake.room.object.enum.RoomObjectSpriteType;

    public final class RoomObjectSprite implements IRoomObjectSprite 
    {
        private static var _Str_3822:int = 0;

        private var _asset:BitmapData = null;
        private var _assetName:String = "";
        private var _libraryAssetName:String = "";
        private var _Str_20770:String = null;
        private var _Str_20092:String = null;
        private var _visible:Boolean = true;
        private var _tag:String = "";
        private var _alpha:int = 0xFF;
        private var _color:int = 0xFFFFFF;
        private var _blendMode:String = "normal";
        private var _flipH:Boolean = false;
        private var _flipV:Boolean = false;
        private var _direction:int = 0;
        private var _Str_588:Point;
        private var _width:int = 0;
        private var _height:int = 0;
        private var _relativeDepth:Number = 0;
        private var _Str_19048:int = 0;
        private var _Str_8253:Boolean = false;
        private var _Str_13928:int;
        private var _clickHandling:Boolean = false;
        private var _updateID:int = 0;
        private var _instanceId:int = 0;
        private var _filters:Array = null;
        protected var _Str_17033:int;
        private var _Str_3796:String;

        public function RoomObjectSprite()
        {
            this._Str_588 = new Point(0, 0);
            this._Str_13928 = AlphaTolerance.MATCH_OPAQUE_PIXELS;
            this._Str_17033 = RoomObjectSpriteType.DEFAULT;
            super();
            this._instanceId = _Str_3822++;
        }

        public function dispose():void
        {
            this._asset = null;
            this._width = 0;
            this._height = 0;
        }

        public function get asset():BitmapData
        {
            return this._asset;
        }

        public function get assetName():String
        {
            return this._assetName;
        }

        public function get _Str_8401():String
        {
            return this._Str_20770;
        }

        public function set _Str_8401(k:String):void
        {
            this._Str_20770 = k;
        }

        public function get _Str_22618():String
        {
            return this._Str_20092;
        }

        public function set _Str_22618(k:String):void
        {
            this._Str_20092 = k;
        }

        public function get visible():Boolean
        {
            return this._visible;
        }

        public function get tag():String
        {
            return this._tag;
        }

        public function get alpha():int
        {
            return this._alpha;
        }

        public function get color():int
        {
            return this._color;
        }

        public function get blendMode():String
        {
            return this._blendMode;
        }

        public function get flipV():Boolean
        {
            return this._flipV;
        }

        public function get flipH():Boolean
        {
            return this._flipH;
        }

        public function get direction():int
        {
            return this._direction;
        }

        public function get offsetX():int
        {
            return this._Str_588.x;
        }

        public function get offsetY():int
        {
            return this._Str_588.y;
        }

        public function get width():int
        {
            return this._width;
        }

        public function get height():int
        {
            return this._height;
        }

        public function get relativeDepth():Number
        {
            return this._relativeDepth;
        }

        public function get _Str_4593():Boolean
        {
            return this._Str_8253;
        }

        public function get _Str_4530():Boolean
        {
            return this._clickHandling;
        }

        public function get _Str_12289():int
        {
            return this._instanceId;
        }

        public function get updateId():int
        {
            return this._updateID;
        }

        public function get filters():Array
        {
            return this._filters;
        }

        public function get _Str_4918():int
        {
            return this._Str_17033;
        }

        public function get objectType():String
        {
            return this._Str_3796;
        }

        public function set objectType(k:String):void
        {
            this._Str_3796 = k;
        }

        public function get spriteType():int
        {
            return this._Str_19048;
        }

        public function set spriteType(k:int):void
        {
            this._Str_19048 = k;
        }

        public function set _Str_4918(k:int):void
        {
            this._Str_17033 = k;
        }

        public function set asset(k:BitmapData):void
        {
            if (k == this._asset)
            {
                return;
            }
            if (k != null)
            {
                this._width = k.width;
                this._height = k.height;
            }
            this._asset = k;
            this._updateID++;
        }

        public function set assetName(k:String):void
        {
            if (k == this._assetName)
            {
                return;
            }
            this._assetName = k;
            this._updateID++;
        }

        public function set visible(k:Boolean):void
        {
            if (k == this._visible)
            {
                return;
            }
            this._visible = k;
            this._updateID++;
        }

        public function set tag(k:String):void
        {
            if (k == this._tag)
            {
                return;
            }
            this._tag = k;
            this._updateID++;
        }

        public function set alpha(k:int):void
        {
            k = (k & 0xFF);
            if (k == this._alpha)
            {
                return;
            }
            this._alpha = k;
            this._updateID++;
        }

        public function set color(k:int):void
        {
            k = (k & 0xFFFFFF);
            if (k == this._color)
            {
                return;
            }
            this._color = k;
            this._updateID++;
        }

        public function set blendMode(k:String):void
        {
            if (k == this._blendMode)
            {
                return;
            }
            this._blendMode = k;
            this._updateID++;
        }

        public function set filters(k:Array):void
        {
            if (k == this._filters)
            {
                return;
            }
            this._filters = k;
            this._updateID++;
        }

        public function set flipH(k:Boolean):void
        {
            if (k == this._flipH)
            {
                return;
            }
            this._flipH = k;
            this._updateID++;
        }

        public function set flipV(k:Boolean):void
        {
            if (k == this._flipV)
            {
                return;
            }
            this._flipV = k;
            this._updateID++;
        }

        public function set direction(k:int):void
        {
            this._direction = k;
        }

        public function set offsetX(k:int):void
        {
            if (k == this._Str_588.x)
            {
                return;
            }
            this._Str_588.x = k;
            this._updateID++;
        }

        public function set offsetY(k:int):void
        {
            if (k == this._Str_588.y)
            {
                return;
            }
            this._Str_588.y = k;
            this._updateID++;
        }

        public function set relativeDepth(k:Number):void
        {
            if (k == this._relativeDepth)
            {
                return;
            }
            this._relativeDepth = k;
            this._updateID++;
        }

        public function set _Str_4593(k:Boolean):void
        {
            if (k == this._Str_8253)
            {
                return;
            }
            this._Str_8253 = k;
            this._updateID++;
        }

        public function set _Str_4530(k:Boolean):void
        {
            if (this._clickHandling == k)
            {
                return;
            }
            this._clickHandling = k;
            this._updateID++;
        }

        public function get _Str_4023():int
        {
            return this._Str_13928;
        }

        public function set _Str_4023(k:int):void
        {
            if (this._Str_13928 == k)
            {
                return;
            }
            this._Str_13928 = k;
            this._updateID++;
        }

        public function get _Str_3582():String
        {
            return this._libraryAssetName;
        }

        public function set _Str_3582(k:String):void
        {
            this._libraryAssetName = k;
        }
    }
}
