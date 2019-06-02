package com.sulake.core.window.graphics
{
    import flash.display.Sprite;
    import flash.display.DisplayObjectContainer;
    import flash.geom.Rectangle;
    import flash.display.Shape;
    import flash.text.TextField;
    import flash.display.Bitmap;
    import flash.text.TextFieldType;
    import flash.display.MorphShape;
    import flash.geom.Point;
    import flash.display.BitmapData;
    import flash.display.DisplayObject;
    import flash.display.IBitmapDrawable;
    import com.sulake.core.utils.profiler.tracking.TrackedBitmapData;

    public class GraphicContext extends Sprite implements IGraphicContext 
    {
        public static const GC_TYPE_UNKNOWN:uint = 0;
        public static const GC_TYPE_BITMAP:uint = (1 << 0);
        public static const GC_TYPE_TEXTFIELD:uint = (1 << 1);
        public static const GC_TYPE_CONTAINER:uint = (1 << 2);
        public static const GC_TYPE_SHAPE:uint = (1 << 3);
        public static const GC_TYPE_MORPH_SHAPE:uint = (1 << 4);
        public static const _Str_22036:uint = (1 << 6);
        public static const _Str_19868:uint = (1 << 7);
        public static const GC_TYPE_DESKTOP:uint = (1 << 8);
        protected static var _Str_2214:uint = 0;
        protected static var _Str_4712:uint = 0;

        protected var _Str_4059:DisplayObjectContainer;
        protected var _Str_21049:Boolean;
        protected var _Str_7873:Boolean;
        protected var _disposed:Boolean = false;
        protected var _Str_873:Rectangle;
        protected var _Str_3303:Shape;

        public function GraphicContext(k:String, _arg_2:uint, _arg_3:Rectangle)
        {
            var _local_4:TextField;
            super();
            _Str_2214++;
            if (_arg_3 == null)
            {
                _arg_3 = new Rectangle(0, 0, 0, 0);
            }
            this.name = k;
            this.mouseEnabled = false;
            this.doubleClickEnabled = false;
            this.x = _arg_3.x;
            this.y = _arg_3.y;
            this._Str_873 = _arg_3;
            this._Str_21049 = true;
            this._Str_7873 = false;
            switch (_arg_2)
            {
                case GraphicContext.GC_TYPE_BITMAP:
                    this._Str_7873 = true;
                    this.setDisplayObject(new Bitmap());
                    this._Str_20707(_arg_3.width, _arg_3.height);
                    return;
                case GraphicContext.GC_TYPE_TEXTFIELD:
                    _local_4 = new TextField();
                    _local_4.width = _arg_3.width;
                    _local_4.height = _arg_3.height;
                    _local_4.type = TextFieldType.INPUT;
                    this.setDisplayObject(_local_4);
                    return;
                case GraphicContext.GC_TYPE_SHAPE:
                    this.setDisplayObject(new Shape());
                    return;
                case GraphicContext.GC_TYPE_MORPH_SHAPE:
                    this.setDisplayObject(new MorphShape());
                    return;
                case GraphicContext.GC_TYPE_CONTAINER:
                    this.setDisplayObject(new Sprite());
                    return;
                case GraphicContext.GC_TYPE_DESKTOP:
                    return;
                case GraphicContext.GC_TYPE_UNKNOWN:
                    return;
                default:
                    throw (new Error((("Unsupported graphic context type: " + _arg_2) + "!")));
            }
        }

        public static function get _Str_26083():uint
        {
            return _Str_2214;
        }

        public static function get allocatedByteCount():uint
        {
            return _Str_4712;
        }


        public function set parent(k:DisplayObjectContainer):void
        {
            if (parent != null)
            {
                parent.removeChild(this);
            }
            if (k != null)
            {
                k.addChild(this);
            }
        }

        public function _Str_24550(k:Point):void
        {
            this.x = k.x;
            this.y = k.y;
        }

        override public function get filters():Array
        {
            return this.getDisplayObject().filters;
        }

        override public function set filters(k:Array):void
        {
            this.getDisplayObject().filters = k;
        }

        public function get blend():Number
        {
            return this.alpha;
        }

        public function set blend(k:Number):void
        {
            this.alpha = k;
        }

        public function get _Str_10223():Boolean
        {
            return super.mouseEnabled;
        }

        public function set _Str_10223(k:Boolean):void
        {
            super.mouseEnabled = k;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (parent != null)
                {
                    parent.removeChild(this);
                    this.parent = null;
                }
                while (this._Str_13711 > 0)
                {
                    this._Str_19139(0);
                }
                if (this._Str_7873)
                {
                    this._Str_24624();
                }
                if (this._Str_4059 != null)
                {
                    while (this._Str_4059.numChildren > 0)
                    {
                        this._Str_4059.removeChildAt(0);
                    }
                }
                this._Str_4059 = null;
                while (numChildren > 0)
                {
                    removeChildAt(0);
                }
                this._Str_3303 = null;
                this._disposed = true;
                _Str_2214--;
            }
        }

        override public function toString():String
        {
            return ('[object GraphicContext name="' + name) + '"]';
        }

        public function getDrawRegion():Rectangle
        {
            return this._Str_873.clone();
        }

        public function _Str_15334(k:Rectangle, _arg_2:Boolean, _arg_3:Rectangle):BitmapData
        {
            var _local_4:BitmapData;
            if (((this._Str_7873) && (_arg_2)))
            {
                _local_4 = this._Str_20707(k.width, k.height);
            }
            x = k.x;
            y = k.y;
            this._Str_873.x = k.x;
            this._Str_873.y = k.y;
            this._Str_873.width = k.width;
            this._Str_873.height = k.height;
            if (_arg_3)
            {
                if (!this._Str_3303)
                {
                    this._Str_3303 = new Shape();
                    this._Str_3303.visible = false;
                    super.addChild(this._Str_3303);
                }
                this._Str_3303.graphics.clear();
                this._Str_3303.graphics.beginFill(0xFF);
                this._Str_3303.graphics.drawRect(_arg_3.x, _arg_3.y, _arg_3.width, _arg_3.height);
                this._Str_3303.graphics.endFill();
                this.getDisplayObject().mask = this._Str_3303;
            }
            else
            {
                if (this._Str_3303)
                {
                    super.removeChild(this._Str_3303);
                    this._Str_3303.graphics.clear();
                    this._Str_3303 = null;
                    this.getDisplayObject().mask = null;
                }
            }
            return _local_4;
        }

        public function getDisplayObject():DisplayObject
        {
            return getChildAt(0);
        }

        public function setDisplayObject(k:DisplayObject):DisplayObject
        {
            var _local_2:DisplayObject;
            if (numChildren > 0)
            {
                _local_2 = removeChildAt(0);
            }
            addChildAt(k, 0);
            k.mask = this._Str_3303;
            return _local_2;
        }

        public function getAbsoluteMousePosition(k:Point):void
        {
            k.x = stage.mouseX;
            k.y = stage.mouseY;
        }

        public function getRelativeMousePosition(k:Point):void
        {
            var _local_2:DisplayObject = this.getDisplayObject();
            k.x = _local_2.mouseX;
            k.y = _local_2.mouseY;
        }

        public function fetchDrawBuffer():IBitmapDrawable
        {
            var k:Bitmap;
            if (this._Str_7873)
            {
                k = (this.getDisplayObject() as Bitmap);
                if (k)
                {
                    return k.bitmapData;
                }
            }
            return null;
        }

        protected function _Str_20707(k:int, _arg_2:int):BitmapData
        {
            var _local_3:Bitmap;
            var _local_4:BitmapData;
            if (this._Str_7873)
            {
                _local_3 = (this.getDisplayObject() as Bitmap);
                if (_local_3)
                {
                    _local_4 = _local_3.bitmapData;
                    if (_local_4 != null)
                    {
                        if (((!(_local_4.width == k)) || (!(_local_4.height == _arg_2))))
                        {
                            _local_3.bitmapData = null;
                            _Str_4712 = (_Str_4712 - ((_local_4.width * _local_4.height) * 4));
                            _local_4.dispose();
                            _local_4 = null;
                        }
                    }
                    if ((((_local_4 == null) && (k > 0)) && (_arg_2 > 0)))
                    {
                        _local_4 = new TrackedBitmapData(this, k, _arg_2, this._Str_21049, 0xFFFFFF);
                        _Str_4712 = (_Str_4712 + ((_local_4.width * _local_4.height) * 4));
                        _local_3.bitmapData = _local_4;
                    }
                    return _local_4;
                }
            }
            return null;
        }

        protected function _Str_24624():void
        {
            var k:Bitmap;
            var _local_2:BitmapData;
            if (this._Str_7873)
            {
                k = (this.getDisplayObject() as Bitmap);
                if (k)
                {
                    _local_2 = k.bitmapData;
                    if (_local_2 != null)
                    {
                        k.bitmapData = null;
                        _Str_4712 = (_Str_4712 - ((_local_2.width * _local_2.height) * 4));
                        _local_2.dispose();
                    }
                }
            }
        }

        public function _Str_23788(k:Rectangle):void
        {
            graphics.clear();
            graphics.lineStyle(1, 0xFF00FF00);
            graphics.drawRect(0, 0, width, height);
            if (k != null)
            {
                graphics.lineStyle(1, 0xFF0000FF);
                graphics.drawRect(k.x, k.y, k.width, k.height);
            }
        }

        protected function _Str_5255():DisplayObjectContainer
        {
            if (this._Str_4059 == null)
            {
                this._Str_4059 = new Sprite();
                this._Str_4059.name = (this.name + " - Child Container");
                this._Str_4059.mouseEnabled = false;
                addChild(this._Str_4059);
            }
            return this._Str_4059;
        }

        protected function _Str_26244():void
        {
            if (this._Str_4059 != null)
            {
                removeChild(this._Str_4059);
                this._Str_4059 = null;
            }
        }

        public function get _Str_13711():int
        {
            return (this._Str_4059 != null) ? this._Str_4059.numChildren : 0;
        }

        public function _Str_22175(k:IGraphicContext):IGraphicContext
        {
            return this._Str_5255().addChild((k as DisplayObject)) as IGraphicContext;
        }

        public function _Str_16175(k:IGraphicContext, _arg_2:int):IGraphicContext
        {
            return this._Str_5255().addChildAt((k as DisplayObject), _arg_2) as IGraphicContext;
        }

        public function _Str_16021(k:int):IGraphicContext
        {
            return this._Str_5255().getChildAt(k) as IGraphicContext;
        }

        public function _Str_25925(k:String):IGraphicContext
        {
            return this._Str_5255().getChildByName(k) as IGraphicContext;
        }

        public function _Str_24886(k:IGraphicContext):int
        {
            return this._Str_5255().getChildIndex(DisplayObject(k));
        }

        public function _Str_17938(k:IGraphicContext):IGraphicContext
        {
            return this._Str_5255().removeChild(DisplayObject(k)) as IGraphicContext;
        }

        public function _Str_19139(k:int):IGraphicContext
        {
            var _local_2:IGraphicContext = (this._Str_5255().getChildAt(k) as IGraphicContext);
            return (_local_2 == null) ? null : this._Str_17938(_local_2);
        }

        public function _Str_19243(child:IGraphicContext, index:int):void
        {
            var current:int;
            var temp:Array;
            var i:uint;
            var dispObj:DisplayObject = (child as DisplayObject);
            if (dispObj != null)
            {
                try
                {
                    current = this._Str_5255().getChildIndex(dispObj);
                }
                catch(error:ArgumentError)
                {
                    temp = new Array();
                    i = 0;
                    while (i < _Str_13711)
                    {
                        temp.push(_Str_16021(i));
                        i++;
                    }
                    throw (new Error("Provided display object is not a child of this!"));
                }
                if (index != current)
                {
                    this._Str_5255().setChildIndex(dispObj, index);
                }
            }
            else
            {
                throw (new Error("Provided child must implement IGraphicContext!"));
            }
        }

        public function _Str_20742(k:IGraphicContext, _arg_2:IGraphicContext):void
        {
            this._Str_5255().swapChildren((k as DisplayObject), (_arg_2 as DisplayObject));
        }

        public function _Str_21032(k:int, _arg_2:int):void
        {
            this._Str_5255().swapChildrenAt(k, _arg_2);
        }
    }
}
