package com.sulake.core.window
{
    import com.sulake.core.runtime.IDisposable;
    import flash.geom.Rectangle;
    import flash.geom.ColorTransform;
    import com.sulake.core.window.enum.WindowState;
    import flash.geom.Point;

    public class WindowModel implements IDisposable 
    {
        protected var _offsetX:int;
        protected var _offsetY:int;
        protected var _x:int;
        protected var _y:int;
        protected var _w:int;
        protected var _h:int;
        protected var _initialRect:Rectangle;
        protected var _previousRect:Rectangle;
        protected var _minimizedRect:Rectangle;
        protected var _maximizedRect:Rectangle;
        protected var _context:WindowContext;
        protected var _background:Boolean = false;
        protected var _fillColor:uint = 0xFFFFFF;
        protected var _dynamicStyleColorTransform:ColorTransform;
        protected var _alphaColor:uint;
        protected var _mouseThreshold:uint = 10;
        protected var _clipping:Boolean = true;
        protected var _visible:Boolean = true;
        protected var _blend:Number = 1;
        protected var _param:uint;
        protected var _state:uint;
        protected var _style:uint;
        protected var _type:uint;
        protected var _caption:String = "";
        protected var _name:String;
        protected var _id:uint;
        protected var _tags:Array;
        protected var _disposed:Boolean = false;
        protected var _dynamicStyle:String = "";

        public function WindowModel(k:uint, _arg_2:String, _arg_3:uint, _arg_4:uint, _arg_5:uint, _arg_6:WindowContext, _arg_7:Rectangle, _arg_8:Array=null, _arg_9:String="")
        {
            this._id = k;
            this._name = _arg_2;
            this._type = _arg_3;
            this._param = _arg_5;
            this._state = WindowState.DEFAULT;
            this._style = _arg_4;
            this._tags = _arg_8;
            this._context = _arg_6;
            this._dynamicStyle = _arg_9;
            this._x = _arg_7.x;
            this._y = _arg_7.y;
            this._w = _arg_7.width;
            this._h = _arg_7.height;
            this._initialRect = _arg_7.clone();
            this._previousRect = _arg_7.clone();
        }

        public function get x():int
        {
            return this._x;
        }

        public function get y():int
        {
            return this._y;
        }

        public function get width():int
        {
            return this._w;
        }

        public function get height():int
        {
            return this._h;
        }

        public function get position():Point
        {
            return new Point(this._x, this._y);
        }

        public function get rectangle():Rectangle
        {
            return new Rectangle(this._x, this._y, this._w, this._h);
        }

        public function get context():IWindowContext
        {
            return this._context;
        }

        public function get mouseThreshold():uint
        {
            return this._mouseThreshold;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get background():Boolean
        {
            return this._background;
        }

        public function get clipping():Boolean
        {
            return this._clipping;
        }

        public function get visible():Boolean
        {
            return this._visible;
        }

        public function get color():uint
        {
            return this._fillColor;
        }

        public function get alpha():uint
        {
            return this._alphaColor >>> 24;
        }

        public function get blend():Number
        {
            return this._blend;
        }

        public function get param():uint
        {
            return this._param;
        }

        public function get state():uint
        {
            return this._state;
        }

        public function get style():uint
        {
            return this._style;
        }

        public function get type():uint
        {
            return this._type;
        }

        public function get caption():String
        {
            return this._caption;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get tags():Array
        {
            return (this._tags) ? this._tags : this._tags = [];
        }

        public function get left():int
        {
            return this._x;
        }

        public function get top():int
        {
            return this._y;
        }

        public function get right():int
        {
            return this._x + this._w;
        }

        public function get bottom():int
        {
            return this._y + this._h;
        }

        public function get renderingX():int
        {
            return this._offsetX + this._x;
        }

        public function get renderingY():int
        {
            return this._offsetY + this._y;
        }

        public function get renderingWidth():int
        {
            return this._w + Math.abs(this.etchingPoint.x);
        }

        public function get renderingHeight():int
        {
            return this._h + Math.abs(this.etchingPoint.y);
        }

        public function get renderingRectangle():Rectangle
        {
            return new Rectangle(this.renderingX, this.renderingY, this.renderingWidth, this.renderingHeight);
        }

        public function get etchingPoint():Point
        {
            return new Point(0, 0);
        }

        public function get dynamicStyle():String
        {
            return this._dynamicStyle;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._disposed = true;
                this._context = null;
                this._state = WindowState.DISPOSED;
                this._tags = null;
                this._x = (this._y = (this._w = (this._h = 0)));
            }
        }

        public function invalidate(k:Rectangle=null):void
        {
        }

        public function getInitialWidth():int
        {
            return this._initialRect.width;
        }

        public function getInitialHeight():int
        {
            return this._initialRect.height;
        }

        public function getPreviousWidth():int
        {
            return this._previousRect.width;
        }

        public function getPreviousHeight():int
        {
            return this._previousRect.height;
        }

        public function getMinimizedWidth():int
        {
            return (this._minimizedRect) ? this._minimizedRect.width : 0;
        }

        public function getMinimizedHeight():int
        {
            return (this._minimizedRect) ? this._minimizedRect.height : 0;
        }

        public function getMaximizedWidth():int
        {
            return (this._maximizedRect) ? this._maximizedRect.width : int.MAX_VALUE;
        }

        public function getMaximizedHeight():int
        {
            return (this._maximizedRect) ? this._maximizedRect.height : int.MAX_VALUE;
        }

        public function testTypeFlag(k:uint, _arg_2:uint=0):Boolean
        {
            if (_arg_2 > 0)
            {
                return ((this._type & _arg_2) ^ k) == 0;
            }
            return (this._type & k) == k;
        }

        public function testStateFlag(k:uint, _arg_2:uint=0):Boolean
        {
            if (_arg_2 > 0)
            {
                return ((this._state & _arg_2) ^ k) == 0;
            }
            return (this._state & k) == k;
        }

        public function testStyleFlag(k:uint, _arg_2:uint=0):Boolean
        {
            if (_arg_2 > 0)
            {
                return ((this._style & _arg_2) ^ k) == 0;
            }
            return (this._style & k) == k;
        }

        public function testParamFlag(k:uint, _arg_2:uint=0):Boolean
        {
            if (_arg_2 > 0)
            {
                return ((this._param & _arg_2) ^ k) == 0;
            }
            return (this._param & k) == k;
        }
    }
}
