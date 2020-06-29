package com.sulake.room.object.visualization
{
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.room.object.enum.AlphaTolerance;
    import com.sulake.room.object.enum.RoomObjectSpriteType;

    public final class RoomObjectSprite implements IRoomObjectSprite 
    {
        private static var _globalInstanceId:int = 0;

        private var _asset:BitmapData = null;
        private var _assetName:String = "";
        private var _libraryAssetName:String = "";
        private var _assetPosture:String = null;
        private var _assetGesture:String = null;
        private var _visible:Boolean = true;
        private var _tag:String = "";
        private var _alpha:int = 0xFF;
        private var _color:int = 0xFFFFFF;
        private var _blendMode:String = "normal";
        private var _flipH:Boolean = false;
        private var _flipV:Boolean = false;
        private var _direction:int = 0;
        private var _offset:Point;
        private var _width:int = 0;
        private var _height:int = 0;
        private var _relativeDepth:Number = 0;
        private var _planeId:int = 0;
        private var _varyingDepth:Boolean = false;
        private var _alphaTolerance:int;
        private var _clickHandling:Boolean = false;
        private var _updateID:int = 0;
        private var _instanceId:int = 0;
        private var _filters:Array = null;
        protected var _spriteType:int;
        private var _objectType:String;

        public function RoomObjectSprite()
        {
            this._offset = new Point(0, 0);
            this._alphaTolerance = AlphaTolerance.MATCH_OPAQUE_PIXELS;
            this._spriteType = RoomObjectSpriteType.DEFAULT;
            super();
            this._instanceId = _globalInstanceId++;
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

        public function get assetPosture():String
        {
            return this._assetPosture;
        }

        public function set assetPosture(k:String):void
        {
            this._assetPosture = k;
        }

        public function get _Str_22618():String
        {
            return this._assetGesture;
        }

        public function set _Str_22618(k:String):void
        {
            this._assetGesture = k;
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
            return this._offset.x;
        }

        public function get offsetY():int
        {
            return this._offset.y;
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

        public function get varyingDepth():Boolean
        {
            return this._varyingDepth;
        }

        public function get clickHandling():Boolean
        {
            return this._clickHandling;
        }

        public function get instanceId():int
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

        public function get spriteType():int
        {
            return this._spriteType;
        }

        public function get objectType():String
        {
            return this._objectType;
        }

        public function set objectType(k:String):void
        {
            this._objectType = k;
        }

        public function get planeId():int
        {
            return this._planeId;
        }

        public function set planeId(k:int):void
        {
            this._planeId = k;
        }

        public function set spriteType(k:int):void
        {
            this._spriteType = k;
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
            if (k == this._offset.x)
            {
                return;
            }
            this._offset.x = k;
            this._updateID++;
        }

        public function set offsetY(k:int):void
        {
            if (k == this._offset.y)
            {
                return;
            }
            this._offset.y = k;
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

        public function set varyingDepth(k:Boolean):void
        {
            if (k == this._varyingDepth)
            {
                return;
            }
            this._varyingDepth = k;
            this._updateID++;
        }

        public function set clickHandling(k:Boolean):void
        {
            if (this._clickHandling == k)
            {
                return;
            }
            this._clickHandling = k;
            this._updateID++;
        }

        public function get alphaTolerance():int
        {
            return this._alphaTolerance;
        }

        public function set alphaTolerance(k:int):void
        {
            if (this._alphaTolerance == k)
            {
                return;
            }
            this._alphaTolerance = k;
            this._updateID++;
        }

        public function get libraryAssetName():String
        {
            return this._libraryAssetName;
        }

        public function set libraryAssetName(k:String):void
        {
            this._libraryAssetName = k;
        }
    }
}
