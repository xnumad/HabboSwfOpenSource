package com.sulake.core.window.components
{
    import com.sulake.core.window.WindowController;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.theme.IThemeManager;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.enum.WindowState;
    import com.sulake.core.window.enum.MouseCursorType;

    public class InteractiveController extends WindowController implements IInteractiveWindow 
    {
        protected var _Str_3681:uint;
        protected var _Str_3422:String;
        protected var _Str_4476:Boolean;
        protected var _Str_3280:Map;

        public function InteractiveController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            _arg_4 = (_arg_4 | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR);
            var _local_12:IThemeManager = _arg_5.getWindowFactory().getThemeManager();
            this._Str_3681 = int(_local_12.getPropertyDefaults(_arg_3).get(PropertyKeys.TOOL_TIP_DELAY).value);
            this._Str_3422 = String(_local_12.getPropertyDefaults(_arg_3).get(PropertyKeys.TOOL_TIP_CAPTION).value);
            this._Str_4476 = _local_12.getPropertyDefaults(_arg_3).get(PropertyKeys.TOOL_TIP_IS_DYNAMIC).value;
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
        }

        public static function _Str_10773(k:IInteractiveWindow, _arg_2:WindowEvent):void
        {
            if (k._Str_4074)
            {
                if (_arg_2.type == WindowMouseEvent.OVER)
                {
                    k.context.getWindowServices().getToolTipAgentService().begin(k);
                }
                else
                {
                    if (_arg_2.type == WindowMouseEvent.MOVE)
                    {
                        k.context.getWindowServices().getToolTipAgentService().updateCaption(k);
                    }
                    else
                    {
                        if (_arg_2.type == WindowMouseEvent.OUT)
                        {
                            k.context.getWindowServices().getToolTipAgentService().end(k);
                        }
                    }
                }
            }
            else
            {
                if (((!(k._Str_2613 == null)) && (k._Str_2613.length > 0)))
                {
                    if (_arg_2.type == WindowMouseEvent.OVER)
                    {
                        k.context.getWindowServices().getToolTipAgentService().begin(k);
                    }
                    else
                    {
                        if (_arg_2.type == WindowMouseEvent.OUT)
                        {
                            k.context.getWindowServices().getToolTipAgentService().end(k);
                        }
                    }
                }
            }
        }

        public static function _Str_11019(k:IInteractiveWindow, _arg_2:Array):void
        {
            var _local_3:PropertyStruct;
            for each (_local_3 in _arg_2)
            {
                switch (_local_3.key)
                {
                    case PropertyKeys.TOOL_TIP_CAPTION:
                        if (_local_3.value != k._Str_2613)
                        {
                            k._Str_2613 = (_local_3.value as String);
                        }
                        break;
                    case PropertyKeys.TOOL_TIP_DELAY:
                        if (_local_3.value != k._Str_3099)
                        {
                            k._Str_3099 = (_local_3.value as uint);
                        }
                        break;
                    case PropertyKeys.TOOL_TIP_IS_DYNAMIC:
                        if (_local_3.value != k._Str_4074)
                        {
                            k._Str_4074 = (_local_3.value as Boolean);
                        }
                        break;
                }
            }
        }

        public static function _Str_8987(k:IInteractiveWindow, _arg_2:Array):Array
        {
            _arg_2.push(k.createProperty(PropertyKeys.TOOL_TIP_CAPTION, k._Str_2613));
            _arg_2.push(k.createProperty(PropertyKeys.TOOL_TIP_DELAY, k._Str_3099));
            _arg_2.push(k.createProperty(PropertyKeys.TOOL_TIP_IS_DYNAMIC, k._Str_4074));
            return _arg_2;
        }


        public function set _Str_2613(k:String):void
        {
            this._Str_3422 = ((k == null) ? String(getDefaultProperty(PropertyKeys.TOOL_TIP_CAPTION).value) : k);
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
            if (testStateFlag(WindowState.DISABLED))
            {
                return MouseCursorType.ARROW;
            }
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

        override public function update(k:WindowController, _arg_2:WindowEvent):Boolean
        {
            if (k == this)
            {
                _Str_10773(this, _arg_2);
            }
            return super.update(k, _arg_2);
        }

        public function showToolTip(k:IToolTipWindow):void
        {
        }

        public function hideToolTip():void
        {
        }

        override public function get properties():Array
        {
            return _Str_8987(this, super.properties);
        }

        override public function set properties(k:Array):void
        {
            _Str_11019(this, k);
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
