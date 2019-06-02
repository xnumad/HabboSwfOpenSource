package com.sulake.core.window.components
{
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.theme.IThemeManager;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.enum.MouseCursorType;

    public class TextLinkController extends TextController implements ITextLinkWindow 
    {
        private var _Str_3681:uint;
        private var _Str_3422:String;
        private var _Str_4476:Boolean;
        protected var _Str_3280:Map;

        public function TextLinkController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            var _local_12:IThemeManager = _arg_5.getWindowFactory().getThemeManager();
            this._Str_3681 = int(_local_12.getPropertyDefaults(_arg_3).get(PropertyKeys.TOOL_TIP_DELAY).value);
            this._Str_3422 = String(_local_12.getPropertyDefaults(_arg_3).get(PropertyKeys.TOOL_TIP_CAPTION).value);
            this._Str_4476 = _local_12.getPropertyDefaults(_arg_3).get(PropertyKeys.TOOL_TIP_IS_DYNAMIC).value;
            super(k, _arg_2, _arg_3, ((_arg_4 | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR) & (~(WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT))), _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            immediateClickMode = true;
            mouseThreshold = 0;
        }

        override public function update(k:WindowController, _arg_2:WindowEvent):Boolean
        {
            var _local_3:Boolean = super.update(k, _arg_2);
            if (k == this)
            {
                InteractiveController._Str_10773(this, _arg_2);
            }
            return _local_3;
        }

        public function set mouseCursorType(k:uint):void
        {
        }

        public function get mouseCursorType():uint
        {
            return 0;
        }

        public function set _Str_2613(k:String):void
        {
            this._Str_3422 = ((k == null) ? "" : k);
        }

        public function get _Str_2613():String
        {
            return this._Str_3422;
        }

        public function set _Str_3099(k:uint):void
        {
            this._Str_3681 = k;
        }

        public function get _Str_3099():uint
        {
            return this._Str_3681;
        }

        public function setMouseCursorForState(k:uint, _arg_2:uint):uint
        {
            if (!this._Str_3280)
            {
                this._Str_3280 = new Map();
            }
            var _local_3:uint = this._Str_3280[k];
            if (((_arg_2 == MouseCursorType.DEFAULT) || (_arg_2 == -1)))
            {
                this._Str_3280.remove(k);
            }
            else
            {
                this._Str_3280[k] = _arg_2;
            }
            return _local_3;
        }

        public function getMouseCursorByState(k:uint):uint
        {
            if (!this._Str_3280)
            {
                return MouseCursorType.DEFAULT;
            }
            return this._Str_3280.getValue(k);
        }

        public function showToolTip(k:IToolTipWindow):void
        {
            throw (new Error("Unimplemented method!"));
        }

        public function hideToolTip():void
        {
            throw (new Error("Unimplemented method!"));
        }

        override public function get properties():Array
        {
            var k:Array = InteractiveController._Str_8987(this, super.properties);
            return k;
        }

        override public function set properties(k:Array):void
        {
            InteractiveController._Str_11019(this, k);
            super.properties = k;
        }

        public function set _Str_4074(k:Boolean):void
        {
            this._Str_4476 = k;
        }

        public function get _Str_4074():Boolean
        {
            return this._Str_4476;
        }
    }
}
