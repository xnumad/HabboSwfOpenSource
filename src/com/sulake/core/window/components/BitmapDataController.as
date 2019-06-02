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
        protected var _Str_5534:uint;
        protected var _Str_10541:Boolean;
        protected var _Str_12317:Boolean;
        protected var _Str_8672:Number;
        protected var _Str_8540:Number;
        protected var _Str_14793:Boolean;
        protected var _Str_3778:uint;
        protected var _Str_18939:Point;
        protected var _Str_13795:Boolean;
        private var _Str_10479:Boolean;
        private var _Str_12136:Boolean;

        public function BitmapDataController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            this._Str_18939 = new Point(0, -1);
            var _local_12:IPropertyMap = _arg_5.getWindowFactory().getThemeManager().getPropertyDefaults(_arg_3);
            this._Str_5534 = PivotPoint.pivotFromName(String(_local_12.get(PropertyKeys.PIVOT_POINT).value));
            this._Str_10541 = Boolean(_local_12.get(PropertyKeys.STRETCHED_X).value);
            this._Str_12317 = Boolean(_local_12.get(PropertyKeys.STRETCHED_Y).value);
            this._Str_8672 = Number(_local_12.get(PropertyKeys.ZOOM_X).value);
            this._Str_8540 = Number(_local_12.get(PropertyKeys.ZOOM_Y).value);
            this._Str_10479 = Boolean(_local_12.get(PropertyKeys.WRAP_X).value);
            this._Str_12136 = Boolean(_local_12.get(PropertyKeys.WRAP_Y).value);
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
            return this._Str_5534;
        }

        public function set pivotPoint(k:uint):void
        {
            this._Str_5534 = k;
        }

        public function get stretchedX():Boolean
        {
            return this._Str_10541;
        }

        public function set stretchedX(k:Boolean):void
        {
            this._Str_10541 = k;
        }

        public function get stretchedY():Boolean
        {
            return this._Str_12317;
        }

        public function set stretchedY(k:Boolean):void
        {
            this._Str_12317 = k;
        }

        public function get zoomX():Number
        {
            return this._Str_8672;
        }

        public function set zoomX(k:Number):void
        {
            this._Str_8672 = k;
            this._Str_8020();
        }

        public function get zoomY():Number
        {
            return this._Str_8540;
        }

        public function set zoomY(k:Number):void
        {
            this._Str_8540 = k;
            this._Str_8020();
        }

        public function get greyscale():Boolean
        {
            return this._Str_14793;
        }

        public function set greyscale(k:Boolean):void
        {
            this._Str_14793 = k;
        }

        public function get etchingColor():uint
        {
            return this._Str_3778;
        }

        public function set etchingColor(k:uint):void
        {
            this._Str_3778 = k;
        }

        public function get fitSizeToContents():Boolean
        {
            return this._Str_13795;
        }

        public function set fitSizeToContents(k:Boolean):void
        {
            this._Str_13795 = k;
            this._Str_8020();
        }

        override public function get etchingPoint():Point
        {
            return this._Str_18939;
        }

        override public function set etching(k:Array):void
        {
            this.etchingColor = k[0];
            this._Str_18939 = new Point(k[1], k[2]);
        }

        public function get wrapX():Boolean
        {
            return this._Str_10479;
        }

        public function set wrapX(k:Boolean):void
        {
            this._Str_10479 = k;
        }

        public function get wrapY():Boolean
        {
            return this._Str_12136;
        }

        public function set wrapY(k:Boolean):void
        {
            this._Str_12136 = k;
        }

        protected function _Str_8020():void
        {
            if (((this._Str_13795) && (!(this._bitmapData == null))))
            {
                width = Math.abs((this._bitmapData.width * this._Str_8672));
                height = Math.abs((this._bitmapData.height * this._Str_8540));
            }
        }

        override public function get properties():Array
        {
            var k:Array = super.properties;
            k.push(createProperty(PropertyKeys.PIVOT_POINT, PivotPoint.PIVOT_NAMES[this._Str_5534]));
            k.push(createProperty(PropertyKeys.STRETCHED_X, this._Str_10541));
            k.push(createProperty(PropertyKeys.STRETCHED_Y, this._Str_12317));
            k.push(createProperty(PropertyKeys.WRAP_X, this._Str_10479));
            k.push(createProperty(PropertyKeys.WRAP_Y, this._Str_12136));
            k.push(createProperty(PropertyKeys.ZOOM_X, this._Str_8672));
            k.push(createProperty(PropertyKeys.ZOOM_Y, this._Str_8540));
            k.push(createProperty(PropertyKeys.GREYSCALE, this._Str_14793));
            k.push(createProperty(PropertyKeys.ETCHING_COLOR, this._Str_3778));
            k.push(createProperty(PropertyKeys.FIT_SIZE_TO_CONTENTS, this._Str_13795));
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
                        this._Str_5534 = PivotPoint.pivotFromName(String(_local_2.value));
                        break;
                    case PropertyKeys.STRETCHED_X:
                        this._Str_10541 = Boolean(_local_2.value);
                        break;
                    case PropertyKeys.STRETCHED_Y:
                        this._Str_12317 = Boolean(_local_2.value);
                        break;
                    case PropertyKeys.ZOOM_X:
                        this._Str_8672 = Number(_local_2.value);
                        break;
                    case PropertyKeys.ZOOM_Y:
                        this._Str_8540 = Number(_local_2.value);
                        break;
                    case PropertyKeys.WRAP_X:
                        this._Str_10479 = Boolean(_local_2.value);
                        break;
                    case PropertyKeys.WRAP_Y:
                        this._Str_12136 = Boolean(_local_2.value);
                        break;
                    case PropertyKeys.GREYSCALE:
                        this._Str_14793 = Boolean(_local_2.value);
                        break;
                    case PropertyKeys.ETCHING_COLOR:
                        this._Str_3778 = uint(_local_2.value);
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
