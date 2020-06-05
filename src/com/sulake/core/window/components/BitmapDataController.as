package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.utils.IBitmapDataContainer;
    import flash.display.BitmapData;
    import flash.geom.Point;
    import com.sulake.core.window.theme.IPropertyMap;
    import com.sulake.core.window.enum.PivotPoint;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.utils.PropertyStruct;

    public class BitmapDataController extends WindowController implements IBitmapDataContainer 
    {
        protected var _bitmapData:BitmapData;
        protected var _pivot:uint;
        protected var _stretchedX:Boolean;
        protected var _stretchedY:Boolean;
        protected var _zoomX:Number;
        protected var _zoomY:Number;
        protected var _greyscale:Boolean;
        protected var _etchingColor:uint;
        protected var _etchingPoint:Point;
        protected var _fitSizeToContents:Boolean;
        private var _wrapX:Boolean;
        private var _wrapY:Boolean;

        public function BitmapDataController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            this._etchingPoint = new Point(0, -1);
            var _local_12:IPropertyMap = _arg_5.getWindowFactory().getThemeManager().getPropertyDefaults(_arg_3);
            this._pivot = PivotPoint.pivotFromName(String(_local_12.get(PropertyKeys.PIVOT_POINT).value));
            this._stretchedX = Boolean(_local_12.get(PropertyKeys.STRETCHED_X).value);
            this._stretchedY = Boolean(_local_12.get(PropertyKeys.STRETCHED_Y).value);
            this._zoomX = Number(_local_12.get(PropertyKeys.ZOOM_X).value);
            this._zoomY = Number(_local_12.get(PropertyKeys.ZOOM_Y).value);
            this._wrapX = Boolean(_local_12.get(PropertyKeys.WRAP_X).value);
            this._wrapY = Boolean(_local_12.get(PropertyKeys.WRAP_Y).value);
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        override public function dispose():void
        {
            this._bitmapData = null;
            super.dispose();
        }

        public function get bitmapData():BitmapData
        {
            return this._bitmapData;
        }

        public function get pivotPoint():uint
        {
            return this._pivot;
        }

        public function set pivotPoint(k:uint):void
        {
            this._pivot = k;
        }

        public function get stretchedX():Boolean
        {
            return this._stretchedX;
        }

        public function set stretchedX(k:Boolean):void
        {
            this._stretchedX = k;
        }

        public function get stretchedY():Boolean
        {
            return this._stretchedY;
        }

        public function set stretchedY(k:Boolean):void
        {
            this._stretchedY = k;
        }

        public function get zoomX():Number
        {
            return this._zoomX;
        }

        public function set zoomX(k:Number):void
        {
            this._zoomX = k;
            this.fitSize();
        }

        public function get zoomY():Number
        {
            return this._zoomY;
        }

        public function set zoomY(k:Number):void
        {
            this._zoomY = k;
            this.fitSize();
        }

        public function get greyscale():Boolean
        {
            return this._greyscale;
        }

        public function set greyscale(k:Boolean):void
        {
            this._greyscale = k;
        }

        public function get etchingColor():uint
        {
            return this._etchingColor;
        }

        public function set etchingColor(k:uint):void
        {
            this._etchingColor = k;
        }

        public function get fitSizeToContents():Boolean
        {
            return this._fitSizeToContents;
        }

        public function set fitSizeToContents(k:Boolean):void
        {
            this._fitSizeToContents = k;
            this.fitSize();
        }

        override public function get etchingPoint():Point
        {
            return this._etchingPoint;
        }

        override public function set etching(k:Array):void
        {
            this.etchingColor = k[0];
            this._etchingPoint = new Point(k[1], k[2]);
        }

        public function get wrapX():Boolean
        {
            return this._wrapX;
        }

        public function set wrapX(k:Boolean):void
        {
            this._wrapX = k;
        }

        public function get wrapY():Boolean
        {
            return this._wrapY;
        }

        public function set wrapY(k:Boolean):void
        {
            this._wrapY = k;
        }

        protected function fitSize():void
        {
            if (((this._fitSizeToContents) && (!(this._bitmapData == null))))
            {
                width = Math.abs((this._bitmapData.width * this._zoomX));
                height = Math.abs((this._bitmapData.height * this._zoomY));
            }
        }

        override public function get properties():Array
        {
            var k:Array = super.properties;
            k.push(createProperty(PropertyKeys.PIVOT_POINT, PivotPoint.PIVOT_NAMES[this._pivot]));
            k.push(createProperty(PropertyKeys.STRETCHED_X, this._stretchedX));
            k.push(createProperty(PropertyKeys.STRETCHED_Y, this._stretchedY));
            k.push(createProperty(PropertyKeys.WRAP_X, this._wrapX));
            k.push(createProperty(PropertyKeys.WRAP_Y, this._wrapY));
            k.push(createProperty(PropertyKeys.ZOOM_X, this._zoomX));
            k.push(createProperty(PropertyKeys.ZOOM_Y, this._zoomY));
            k.push(createProperty(PropertyKeys.GREYSCALE, this._greyscale));
            k.push(createProperty(PropertyKeys.ETCHING_COLOR, this._etchingColor));
            k.push(createProperty(PropertyKeys.FIT_SIZE_TO_CONTENTS, this._fitSizeToContents));
            return k;
        }

        override public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            for each (_local_2 in k)
            {
                switch (_local_2.key)
                {
                    case PropertyKeys.PIVOT_POINT:
                        this._pivot = PivotPoint.pivotFromName(String(_local_2.value));
                        break;
                    case PropertyKeys.STRETCHED_X:
                        this._stretchedX = Boolean(_local_2.value);
                        break;
                    case PropertyKeys.STRETCHED_Y:
                        this._stretchedY = Boolean(_local_2.value);
                        break;
                    case PropertyKeys.ZOOM_X:
                        this._zoomX = Number(_local_2.value);
                        break;
                    case PropertyKeys.ZOOM_Y:
                        this._zoomY = Number(_local_2.value);
                        break;
                    case PropertyKeys.WRAP_X:
                        this._wrapX = Boolean(_local_2.value);
                        break;
                    case PropertyKeys.WRAP_Y:
                        this._wrapY = Boolean(_local_2.value);
                        break;
                    case PropertyKeys.GREYSCALE:
                        this._greyscale = Boolean(_local_2.value);
                        break;
                    case PropertyKeys.ETCHING_COLOR:
                        this._etchingColor = uint(_local_2.value);
                        break;
                    case PropertyKeys.FIT_SIZE_TO_CONTENTS:
                        this.fitSizeToContents = (_local_2.value as Boolean);
                        break;
                }
            }
            super.properties = k;
        }
    }
}
