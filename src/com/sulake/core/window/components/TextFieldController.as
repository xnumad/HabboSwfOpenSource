package com.sulake.core.window.components
{
    import flash.filters.DropShadowFilter;
    import com.sulake.core.window.enum.WindowParam;
    import flash.text.TextField;
    import flash.events.TextEvent;
    import flash.events.KeyboardEvent;
    import flash.events.Event;
    import flash.events.FocusEvent;
    import com.sulake.core.window.WindowContext;
    import flash.geom.Rectangle;
    import com.sulake.core.window.IWindow;
    import flash.text.TextFieldType;
    import com.sulake.core.window.graphics.GraphicContext;
    import com.sulake.core.window.graphics.IGraphicContext;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.WindowController;
    import flash.geom.Point;
    import flash.text.TextFieldAutoSize;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.IInputEventTracker;
    import com.sulake.core.window.enum.WindowState;
    import com.sulake.core.window.theme.PropertyKeys;
    import com.sulake.core.window.utils.PropertyStruct;

    public class TextFieldController extends TextController implements ITextFieldWindow 
    {
        private static const _Str_16549:RegExp = /[~%&!\\;:"',<>?#\s\.\-()=\[\]\{\}\^_]/g;

        private var _Str_14685:DropShadowFilter;
        protected var _Str_3681:uint = 500;
        protected var _Str_3422:String = "";
        protected var _Str_4476:Boolean = false;
        protected var _Str_9948:Boolean = false;
        protected var _initialized:Boolean = false;
        protected var _Str_6131:Array;
        protected var _Str_12892:Boolean;

        public function TextFieldController(k:String, _arg_2:uint, _arg_3:uint, _arg_4:uint, _arg_5:WindowContext, _arg_6:Rectangle, _arg_7:IWindow, _arg_8:Function, _arg_9:Array=null, _arg_10:Array=null, _arg_11:uint=0)
        {
            this._Str_14685 = new DropShadowFilter(1, 90, 0xFFFFFF, 1, 0, 0);
            this._Str_6131 = [];
            _arg_4 = (_arg_4 & (~(WindowParam.WINDOW_PARAM_USE_PARENT_GRAPHIC_CONTEXT)));
            _arg_4 = (_arg_4 | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR);
            _x = _arg_6.x;
            _y = _arg_6.y;
            _w = _arg_6.width;
            _h = _arg_6.height;
            _field = TextField(this.getGraphicContext(true).getDisplayObject());
            super(k, _arg_2, _arg_3, _arg_4, _arg_5, _arg_6, _arg_7, _arg_8, _arg_9, _arg_10, _arg_11);
            _field.addEventListener(TextEvent.TEXT_INPUT, this._Str_22281);
            _field.addEventListener(KeyboardEvent.KEY_DOWN, this._Str_19964);
            _field.addEventListener(KeyboardEvent.KEY_UP, this._Str_21573);
            _field.addEventListener(Event.CHANGE, this._Str_16912);
            _field.addEventListener(FocusEvent.FOCUS_IN, this._Str_4932);
            _field.addEventListener(FocusEvent.FOCUS_OUT, this._Str_4932);
            _field.addEventListener(Event.REMOVED_FROM_STAGE, this._Str_19111);
            _drawable = false;
            this._initialized = true;
        }

        public static function _Str_22243(k:String):Array
        {
            var _local_3:Object;
            var _local_2:Array = new Array();
            _local_2.push(0);
            while ((_local_3 = _Str_16549.exec(k)) != null)
            {
                if (_local_3.index < k.length)
                {
                    _local_2.push((_local_3.index + 1));
                }
            }
            return _local_2;
        }


        public function get focused():Boolean
        {
            if (_field)
            {
                if (_field.stage)
                {
                    return _field.stage.focus == _field;
                }
            }
            return false;
        }

        override public function enable():Boolean
        {
            if (super.enable())
            {
                _field.type = TextFieldType.INPUT;
                return true;
            }
            _field.type = TextFieldType.DYNAMIC;
            return false;
        }

        override public function disable():Boolean
        {
            if (super.disable())
            {
                _field.type = TextFieldType.DYNAMIC;
                return true;
            }
            _field.type = TextFieldType.INPUT;
            return false;
        }

        public function get editable():Boolean
        {
            return _field.type == TextFieldType.INPUT;
        }

        public function set editable(k:Boolean):void
        {
            _field.type = ((k) ? TextFieldType.INPUT : TextFieldType.DYNAMIC);
        }

        public function get selectable():Boolean
        {
            return _field.selectable;
        }

        public function set selectable(k:Boolean):void
        {
            _field.selectable = k;
        }

        public function set displayAsPassword(k:Boolean):void
        {
            _field.displayAsPassword = k;
        }

        public function get displayAsPassword():Boolean
        {
            return _field.displayAsPassword;
        }

        public function set mouseCursorType(k:uint):void
        {
        }

        public function get mouseCursorType():uint
        {
            return 0;
        }

        public function set toolTipCaption(k:String):void
        {
            this._Str_3422 = ((k == null) ? "" : k);
        }

        public function get toolTipCaption():String
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
            throw (new Error("Unimplemented method!"));
        }

        public function getMouseCursorByState(k:uint):uint
        {
            throw (new Error("Unimplemented method!"));
        }

        public function showToolTip(k:IToolTipWindow):void
        {
            throw (new Error("Unimplemented method!"));
        }

        public function hideToolTip():void
        {
            throw (new Error("Unimplemented method!"));
        }

        override public function set autoSize(k:String):void
        {
            super.autoSize = k;
            this._Str_18556();
        }

        override public function set background(k:Boolean):void
        {
            _field.background = k;
            _background = k;
            _fillColor = ((_background) ? (_fillColor | _alphaColor) : (_fillColor & 0xFFFFFF));
        }

        public function setSelection(k:int, _arg_2:int):void
        {
            _field.setSelection(k, _arg_2);
        }

        public function get selectionBeginIndex():int
        {
            return _field.selectionBeginIndex;
        }

        public function get selectionEndIndex():int
        {
            return _field.selectionEndIndex;
        }

        override public function getGraphicContext(k:Boolean):IGraphicContext
        {
            if (((k) && (!(_graphics))))
            {
                _graphics = new GraphicContext((("GC {" + _name) + "}"), GraphicContext.GC_TYPE_TEXTFIELD, rectangle);
            }
            return _graphics;
        }

        override public function dispose():void
        {
            if (!_disposed)
            {
                _context.getWindowServices().getFocusManagerService().removeFocusWindow(this);
                this._Str_9948 = false;
                if (_field)
                {
                    if (this.focused)
                    {
                        this.unfocus();
                    }
                    _field.removeEventListener(KeyboardEvent.KEY_DOWN, this._Str_19964);
                    _field.removeEventListener(KeyboardEvent.KEY_UP, this._Str_21573);
                    _field.removeEventListener(Event.CHANGE, this._Str_16912);
                    _field.removeEventListener(FocusEvent.FOCUS_IN, this._Str_4932);
                    _field.removeEventListener(FocusEvent.FOCUS_OUT, this._Str_4932);
                    _field.removeEventListener(Event.REMOVED_FROM_STAGE, this._Str_19111);
                }
                super.dispose();
            }
        }

        override public function set text(k:String):void
        {
            super.text = k;
            this._Str_18556();
        }

        override public function focus():Boolean
        {
            var k:Boolean = super.focus();
            if (k)
            {
                if (_field)
                {
                    if (_field.stage)
                    {
                        if (_field.stage.focus != _field)
                        {
                            _field.stage.focus = _field;
                        }
                    }
                }
            }
            return k;
        }

        override public function unfocus():Boolean
        {
            if (_field)
            {
                if (_field.stage)
                {
                    if (_field.stage.focus == _field)
                    {
                        _field.stage.focus = null;
                    }
                }
            }
            return super.unfocus();
        }

        override public function update(k:WindowController, _arg_2:WindowEvent):Boolean
        {
            var _local_3:Boolean = super.update(k, _arg_2);
            switch (_arg_2.type)
            {
                case WindowEvent.WINDOW_EVENT_ACTIVATED:
                case WindowMouseEvent.DOWN:
                    this.focus();
                    break;
                case WindowEvent.WINDOW_EVENT_RESIZED:
                    if (k == this)
                    {
                        _field.width = this.width;
                        _field.height = this.height;
                    }
                    break;
            }
            if (k == this)
            {
                InteractiveController._Str_10773(this, _arg_2);
            }
            return _local_3;
        }

        protected function _Str_18556():void
        {
            var k:Point;
            var _local_2:Point;
            var _local_3:Point;
            if (((this._initialized) && (!(autoSize == TextFieldAutoSize.NONE))))
            {
                if (((!(_w == _field.width)) || (!(_h == _field.height))))
                {
                    k = _field.localToGlobal(new Point(_field.x, _field.y));
                    _local_2 = new Point();
                    getGlobalPosition(_local_2);
                    _local_3 = new Point((k.x - _local_2.x), (k.y - _local_2.y));
                    setRectangle((_x + _local_3.x), (_y + _local_3.y), _field.width, _field.height);
                }
            }
        }

        override public function set filters(k:Array):void
        {
            this._Str_12892 = true;
            this._Str_6131 = k;
            this._Str_20609();
        }

        override public function get filters():Array
        {
            return this._Str_6131;
        }

        override public function set etchingColor(k:uint):void
        {
            this._Str_12892 = true;
            super.etchingColor = k;
        }

        private function _Str_20609():void
        {
            var k:Array;
            if (!this._Str_12892)
            {
                return;
            }
            this._Str_12892 = false;
            if ((_etchingColor & 0xFF000000) != 0)
            {
                this._Str_14685.color = (_etchingColor & 0xFFFFFF);
                this._Str_14685.alpha = (((_etchingColor >> 24) & 0xFF) / 0xFF);
                k = this._Str_6131.slice();
                k.push(this._Str_14685);
                this.getGraphicContext(true).filters = k;
            }
            else
            {
                this.getGraphicContext(true).filters = this._Str_6131;
            }
        }

        override protected function refreshTextImage(k:Boolean=false):void
        {
            var _local_3:WindowEvent;
            var _local_2:Boolean;
            this._Str_20609();
            if (_w != _field.width)
            {
                if (autoSize != TextFieldAutoSize.NONE)
                {
                    width = _field.width;
                    _local_2 = true;
                }
                else
                {
                    _field.width = width;
                }
            }
            if (_h != _field.height)
            {
                if (autoSize != TextFieldAutoSize.NONE)
                {
                    height = _field.height;
                    _local_2 = true;
                }
                else
                {
                    _field.height = height;
                }
            }
            if ((((!(_local_2)) && (!(k))) && (_events)))
            {
                _local_3 = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_RESIZED, this, null);
                _events.dispatchEvent(_local_3);
                _local_3.recycle();
            }
        }

        private function _Str_22281(k:TextEvent):void
        {
            if (this._Str_22506(k.text))
            {
                k.preventDefault();
            }
        }

        private function _Str_22506(k:String):Boolean
        {
            var _local_3:String;
            var _local_4:int;
            var _local_2:Boolean;
            if (((multiline) && (maxLines > 0)))
            {
                _local_2 = (numLines > maxLines);
                if (k != null)
                {
                    _local_3 = _field.text;
                    _local_4 = _field.caretIndex;
                    _field.text = ((_local_3.substring(0, _local_4) + k) + _local_3.substring(_local_4, _local_3.length));
                    if (numLines > maxLines)
                    {
                        _local_2 = true;
                    }
                    _field.text = _local_3;
                }
            }
            return _local_2;
        }

        private function _Str_19964(event:KeyboardEvent):void
        {
            var windowEvent:WindowKeyboardEvent;
            var tracker:IInputEventTracker;
            try
            {
                windowEvent = WindowKeyboardEvent.allocate(WindowKeyboardEvent.WINDOW_EVENT_KEY_DOWN, event, this, null);
                this.update(this, windowEvent);
                if (disposed)
                {
                    return;
                }
                for each (tracker in _context.inputEventTrackers)
                {
                    tracker.eventReceived(windowEvent, this);
                }
                windowEvent.recycle();
            }
            catch(e:Error)
            {
                _context.handleError(WindowContext.ERROR_DURING_EVENT_HANDLING, e);
            }
        }

        private function _Str_21573(event:KeyboardEvent):void
        {
            var windowEvent:WindowKeyboardEvent;
            var tracker:IInputEventTracker;
            try
            {
                _caption = _field.text;
                windowEvent = WindowKeyboardEvent.allocate(WindowKeyboardEvent.WINDOW_EVENT_KEY_UP, event, this, null);
                this.update(this, windowEvent);
                if (disposed)
                {
                    return;
                }
                for each (tracker in _context.inputEventTrackers)
                {
                    tracker.eventReceived(windowEvent, this);
                }
                windowEvent.recycle();
            }
            catch(e:Error)
            {
                _context.handleError(WindowContext.ERROR_DURING_EVENT_HANDLING, e);
            }
        }

        public function requestChangeEvent():void
        {
            this._Str_16912(null);
        }

        private function _Str_16912(event:Event):void
        {
            var windowEvent:WindowEvent;
            try
            {
                this._Str_18556();
                windowEvent = WindowEvent.allocate(WindowEvent.WINDOW_EVENT_CHANGE, this, null);
                this.update(this, windowEvent);
                windowEvent.recycle();
            }
            catch(e:Error)
            {
                _context.handleError(WindowContext.ERROR_DURING_EVENT_HANDLING, e);
            }
        }

        private function _Str_4932(event:FocusEvent):void
        {
            try
            {
                if (event.type == FocusEvent.FOCUS_IN)
                {
                    if (!getStateFlag(WindowState.FOCUSED))
                    {
                        this.focus();
                    }
                }
                else
                {
                    if (event.type == FocusEvent.FOCUS_OUT)
                    {
                        if (getStateFlag(WindowState.FOCUSED))
                        {
                            this.unfocus();
                        }
                    }
                }
            }
            catch(e:Error)
            {
                _context.handleError(WindowContext.ERROR_DURING_EVENT_HANDLING, e);
            }
        }

        private function _Str_19111(event:Event):void
        {
            try
            {
                if (getStateFlag(WindowState.FOCUSED))
                {
                    this.unfocus();
                }
            }
            catch(e:Error)
            {
                _context.handleError(WindowContext.ERROR_DURING_EVENT_HANDLING, e);
            }
        }

        override public function get properties():Array
        {
            var k:Array = InteractiveController._Str_8987(this, super.properties);
            k.push(createProperty(PropertyKeys.EDITABLE, (_field.type == TextFieldType.INPUT)));
            k.push(createProperty(PropertyKeys.FOCUS_CAPTURER, this._Str_9948));
            k.push(createProperty(PropertyKeys.SELECTABLE, _field.selectable));
            k.push(createProperty(PropertyKeys.DISPLAY_AS_PASSWORD, _field.displayAsPassword));
            k.push(createProperty(PropertyKeys.DISPLAY_RAW, _displayRaw));
            return k;
        }

        override public function set properties(k:Array):void
        {
            var _local_2:PropertyStruct;
            InteractiveController._Str_11019(this, k);
            for each (_local_2 in k)
            {
                switch (_local_2.key)
                {
                    case PropertyKeys.FOCUS_CAPTURER:
                        this._Str_9948 = (_local_2.value as Boolean);
                        if (this._Str_9948)
                        {
                            _context.getWindowServices().getFocusManagerService().registerFocusWindow(this);
                        }
                        break;
                    case PropertyKeys.SELECTABLE:
                        _field.selectable = (_local_2.value as Boolean);
                        break;
                    case PropertyKeys.EDITABLE:
                        _field.type = ((_local_2.value) ? TextFieldType.INPUT : TextFieldType.DYNAMIC);
                        break;
                    case PropertyKeys.DISPLAY_AS_PASSWORD:
                        _field.displayAsPassword = (_local_2.value as Boolean);
                        break;
                    case PropertyKeys.DISPLAY_RAW:
                        _displayRaw = (_local_2.value as Boolean);
                        break;
                }
            }
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

        public function set _Str_16747(k:Boolean):void
        {
            _displayRaw = k;
        }

        public function get _Str_16747():Boolean
        {
            return _displayRaw;
        }

        override public function set localization(k:String):void
        {
            super.localization = limitStringLength(((_displayRaw) ? _caption : k));
        }

        public function getWordAt(k:int, _arg_2:int):String
        {
            var _local_8:int;
            var _local_9:int;
            var _local_3:int = getCharIndexAtPoint(k, _arg_2);
            var _local_4:String = _field.text;
            var _local_5:Array = _Str_22243(_local_4);
            var _local_6:String = "";
            var _local_7:int;
            while (_local_7 < _local_5.length)
            {
                _local_8 = _local_5[_local_7];
                _local_9 = _local_4.length;
                if ((_local_7 + 1) < _local_5.length)
                {
                    _local_9 = (_local_5[(_local_7 + 1)] - 1);
                }
                if (((_local_3 >= _local_8) && (_local_3 <= _local_9)))
                {
                    _local_6 = _local_4.substring(_local_8, _local_9);
                    break;
                }
                _local_7++;
            }
            return _local_6;
        }
    }
}
