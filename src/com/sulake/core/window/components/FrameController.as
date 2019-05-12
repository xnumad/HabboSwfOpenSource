package com.sulake.core.window.components
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.utils.IMargins;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.utils.TextMargins;
    import com.sulake.core.window.iterators.ContainerIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.utils.Map;
    import com.sulake.core.window.WindowController;
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.theme.PropertyKeys;

    public class FrameController extends ContainerController implements IFrameWindow 
    {
        private static const _TITLE:String = "_TITLE";
        private static const _HEADER:String = "_HEADER";
        private static const _CONTENT:String = "_CONTENT";
        private static const _SCALER:String = "_SCALER";

        private var _title:ILabelWindow;
        private var _header:IHeaderWindow;
        private var _content:IWindowContainer;
        private var _margins:IMargins;
        private var _ready:Boolean = false;
        private var _helpPage:String = "";
        private var _helpButtonAction:Function = null;

        public function FrameController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function=null, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            _arg_4 = (_arg_4 | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR);
            _arg_4 = (_arg_4 & (~(WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT)));
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            this._ready = true;
            activate();
            this._Str_21397();
            var _local_12:IWindow = findChildByName("header_button_help");
            if (_local_12 != null)
            {
                _local_12.procedure = this._Str_22906;
            }
            this._Str_7032 = this._helpPage;
        }

        public function get title():ILabelWindow
        {
            return (this._title) ? this._title : this._title = ILabelWindow(findChildByTag(_TITLE));
        }

        public function get header():IHeaderWindow
        {
            return (this._header) ? this._header : this._header = IHeaderWindow(findChildByTag(_HEADER));
        }

        public function get content():IWindowContainer
        {
            return (this._content) ? this._content : this._content = IWindowContainer(findChildByTag(_CONTENT));
        }

        public function get scaler():IScalerWindow
        {
            return findChildByTag(_SCALER) as IScalerWindow;
        }

        public function get margins():IMargins
        {
            if (!this._margins)
            {
                this._margins = new TextMargins(this.content.left, this.content.top, this.content.right, this.content.bottom, this._Str_24678);
            }
            return this._margins;
        }

        override public function set caption(k:String):void
        {
            super.caption = k;
            try
            {
                this.title.text = k;
            }
            catch(e:Error)
            {
            }
        }

        override public function set color(k:uint):void
        {
            var _local_3:IWindow;
            super.color = k;
            var _local_2:Array = new Array();
            groupChildrenWithTag(WindowController._COLORIZE, _local_2);
            for each (_local_3 in _local_2)
            {
                _local_3.color = k;
            }
        }

        override public function get iterator():IIterator
        {
            return ((!(this.content == null)) && (this._ready)) ? this.content.iterator : new ContainerIterator(this);
        }

        private function _Str_22906(k:WindowEvent, _arg_2:IWindow):void
        {
            if ((((k.type == WindowMouseEvent.CLICK) && (!(this._helpPage == ""))) && (!(this._helpButtonAction == null))))
            {
                this._helpButtonAction(this._helpPage);
            }
        }

        public function set _Str_21008(k:Function):void
        {
            this._helpButtonAction = k;
        }

        override public function buildFromXML(k:XML, _arg_2:Map=null):Boolean
        {
            return !(context.getWindowParser().parseAndConstruct(k, this.content, _arg_2) == null);
        }

        override public function setParamFlag(k:uint, _arg_2:Boolean=true):void
        {
            super.setParamFlag(k, _arg_2);
            this._Str_21397();
        }

        private function _Str_21397():void
        {
            var k:IWindow = this.scaler;
            var _local_2:Boolean = testParamFlag(WindowParam.WINDOW_PARAM_MOUSE_SCALING_TARGET);
            var _local_3:Boolean = testParamFlag(WindowParam.WINDOW_PARAM_VERTICAL_MOUSE_SCALING_TRIGGER);
            var _local_4:Boolean = testParamFlag(WindowParam.WINDOW_PARAM_HORIZONTAL_MOUSE_SCALING_TRIGGER);
            if (k)
            {
                if (((_local_3) || (_local_2)))
                {
                    k.setParamFlag(WindowParam.WINDOW_PARAM_VERTICAL_MOUSE_SCALING_TRIGGER, true);
                }
                else
                {
                    k.setParamFlag(WindowParam.WINDOW_PARAM_VERTICAL_MOUSE_SCALING_TRIGGER, false);
                }
                if (((_local_4) || (_local_2)))
                {
                    k.setParamFlag(WindowParam.WINDOW_PARAM_HORIZONTAL_MOUSE_SCALING_TRIGGER, true);
                }
                else
                {
                    k.setParamFlag(WindowParam.WINDOW_PARAM_HORIZONTAL_MOUSE_SCALING_TRIGGER, false);
                }
                k.visible = (((_local_3) || (_local_4)) || (_local_2));
            }
        }

        public function _Str_5665():void
        {
            resizeToAccommodateChildren((this.content as WindowController));
        }

        private function _Str_24678(k:IMargins):void
        {
            var _local_2:IWindow = this.content;
            var _local_3:uint = _local_2.param;
            var _local_4:uint = (_local_2.param & (WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_CENTER | WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_CENTER));
            if (_local_4)
            {
                _local_2.setParamFlag((WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_CENTER | WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_CENTER), false);
            }
            var _local_5:uint = (_local_2.param & WindowParam.WINDOW_PARAM_REFLECT_RESIZE_TO_PARENT);
            if (_local_5)
            {
                _local_2.setParamFlag(WindowParam.WINDOW_PARAM_REFLECT_RESIZE_TO_PARENT, false);
            }
            _local_2.rectangle = new Rectangle(k.left, k.top, (k.right - k.left), (k.bottom - k.top));
            if (((_local_4) || (_local_5)))
            {
                _local_2.setParamFlag(0xFFFFFFFF, false);
                _local_2.setParamFlag(_local_3, true);
            }
        }

        override public function get properties():Array
        {
            var k:Array = super.properties;
            var _local_2:* = (!(this._margins == null));
            k.push(new PropertyStruct(PropertyKeys.HELP_PAGE, this._helpPage, PropertyStruct.STRING, (!(this._helpPage == ""))));
            k.push(new PropertyStruct(PropertyKeys.MARGIN_LEFT, this.content.left, PropertyStruct.INT, _local_2));
            k.push(new PropertyStruct(PropertyKeys.MARGIN_TOP, this.content.top, PropertyStruct.INT, _local_2));
            k.push(new PropertyStruct(PropertyKeys.MARGIN_RIGHT, (_w - this.content.right), PropertyStruct.INT, _local_2));
            k.push(new PropertyStruct(PropertyKeys.MARGIN_BOTTOM, (_h - this.content.bottom), PropertyStruct.INT, _local_2));
            return k;
        }

        override public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            for each (_local_2 in k)
            {
                switch (_local_2.key)
                {
                    case PropertyKeys.HELP_PAGE:
                        this._Str_7032 = (_local_2.value as String);
                        break;
                    case PropertyKeys.MARGIN_LEFT:
                        this.margins.left = (_local_2.value as int);
                        break;
                    case PropertyKeys.MARGIN_TOP:
                        this.margins.top = (_local_2.value as int);
                        break;
                    case PropertyKeys.MARGIN_RIGHT:
                        this.margins.right = (_w - (_local_2.value as int));
                        break;
                    case PropertyKeys.MARGIN_BOTTOM:
                        this.margins.bottom = (_h - (_local_2.value as int));
                        break;
                }
            }
            super.properties = k;
        }

        public function get _Str_7032():String
        {
            return this._helpPage;
        }

        public function set _Str_7032(k:String):void
        {
            this._helpPage = k;
            var _local_2:IWindow = findChildByName("header_button_help");
            if (_local_2 != null)
            {
                _local_2.visible = (!(this._helpPage == ""));
            }
        }
    }
}
