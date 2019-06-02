package com.sulake.habbo.window.widgets
{
    import com.sulake.core.runtime.IUpdateReceiver;
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.components.ITextWindow;

    public class RunningNumberWidget implements _Str_5046, IUpdateReceiver 
    {
        public static const RUNNING_NUMBER:String = "running_number";
        private static const _Str_15087:String = (RUNNING_NUMBER + ":number");
        private static const _Str_5874:String = (RUNNING_NUMBER + ":digits");
        private static const _Str_5847:String = (RUNNING_NUMBER + ":color_style");
        private static const _Str_15674:String = (RUNNING_NUMBER + ":update_frequency");
        private static const _Str_14856:PropertyStruct = new PropertyStruct(_Str_15087, 0, PropertyStruct.INT);
        private static const _Str_5707:PropertyStruct = new PropertyStruct(_Str_5874, 8, PropertyStruct.UINT);
        private static const _Str_6446:PropertyStruct = new PropertyStruct(_Str_5847, 0, PropertyStruct.INT);
        private static const _Str_14116:PropertyStruct = new PropertyStruct(_Str_15674, 50, PropertyStruct.INT);

        private var _disposed:Boolean;
        private var _widgetWindow:IWidgetWindow;
        private var _windowManager:HabboWindowManagerComponent;
        private var _root:IWindowContainer;
        private var _colorStyle:int;
        private var _digits:uint;
        private var _updateFrequency:int;
        private var _newNumber:int;
        private var _displayedNumber:Number = 0;
        private var _millisSinceLastUpdate:uint = 0;

        public function RunningNumberWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            this._colorStyle = int(_Str_6446.value);
            this._digits = uint(_Str_5707.value);
            this._updateFrequency = int(_Str_14116.value);
            this._newNumber = int(_Str_14856.value);
            super();
            this._widgetWindow = k;
            this._windowManager = _arg_2;
            this._root = (this._windowManager.buildFromXML((this._windowManager.assets.getAssetByName("running_number_xml").content as XML)) as IWindowContainer);
            this._windowManager.registerUpdateReceiver(this, this._updateFrequency);
            this._widgetWindow.setParamFlag(WindowParam.WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN);
            this._widgetWindow._Str_2429 = this._root;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._root != null)
                {
                    this._root.dispose();
                    this._root = null;
                }
                if (this._widgetWindow != null)
                {
                    this._widgetWindow._Str_2429 = null;
                    this._widgetWindow = null;
                }
                this._windowManager.removeUpdateReceiver(this);
                this._windowManager = null;
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get properties():Array
        {
            var k:Array = [];
            if (this._disposed)
            {
                return k;
            }
            k.push(_Str_14856.withValue(this._Str_4157));
            k.push(_Str_6446.withValue(this._Str_4157));
            k.push(_Str_5707.withValue(this._Str_4056));
            k.push(_Str_14116.withValue(this._Str_9087));
            return k;
        }

        public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            if (this._disposed)
            {
                return;
            }
            for each (_local_2 in k)
            {
                switch (_local_2.key)
                {
                    case _Str_15087:
                        this.number = int(_local_2.value);
                        break;
                    case _Str_5874:
                        this._Str_4056 = uint(_local_2.value);
                        break;
                    case _Str_5847:
                        this._Str_4157 = int(_local_2.value);
                        break;
                    case _Str_15674:
                        this._Str_9087 = int(_local_2.value);
                        break;
                }
            }
        }

        public function get iterator():IIterator
        {
            return EmptyIterator.INSTANCE;
        }

        public function update(k:uint):void
        {
            if (this._displayedNumber < this.number)
            {
                this._millisSinceLastUpdate = (this._millisSinceLastUpdate + k);
                if (this._millisSinceLastUpdate > this._updateFrequency)
                {
                    this._displayedNumber = Math.min(this._newNumber, (this._displayedNumber + (this._millisSinceLastUpdate / this._updateFrequency)));
                    this._millisSinceLastUpdate = (this._millisSinceLastUpdate - this._updateFrequency);
                }
                this._Str_20057 = this._displayedNumber;
            }
        }

        private function set _Str_20057(k:uint):void
        {
            var _local_2:String = k.toString();
            while (_local_2.length < this._digits)
            {
                _local_2 = ("0" + _local_2);
            }
            var _local_3:ITextWindow = ITextWindow(this._root.findChildByName("number_field"));
            _local_3.text = _local_2;
            _local_3.invalidate();
        }

        public function get _Str_4056():uint
        {
            return this._digits;
        }

        public function set _Str_4056(k:uint):void
        {
            this._digits = k;
        }

        public function get _Str_4157():int
        {
            return this._colorStyle;
        }

        public function set _Str_4157(k:int):void
        {
            this._colorStyle = k;
        }

        public function get _Str_9087():int
        {
            return this._updateFrequency;
        }

        public function set _Str_9087(k:int):void
        {
            this._updateFrequency = k;
        }

        public function get number():int
        {
            return this._newNumber;
        }

        public function set number(k:int):void
        {
            this._newNumber = k;
        }

        public function set _Str_19520(k:int):void
        {
            this._displayedNumber = k;
            this._newNumber = k;
            this._Str_20057 = this._displayedNumber;
        }
    }
}
