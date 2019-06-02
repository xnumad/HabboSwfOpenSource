package com.sulake.habbo.window.widgets
{
    import com.sulake.core.window.utils.PropertyStruct;
    import com.sulake.core.window.components.IWidgetWindow;
    import com.sulake.habbo.window.HabboWindowManagerComponent;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.components.ILabelWindow;
    import com.sulake.core.window.iterators.EmptyIterator;
    import com.sulake.core.window.utils.IIterator;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.IWindow;

    public class IlluminaInputWidget implements _Str_2789 
    {
        public static const ILLUMINA_INPUT:String = "illumina_input";
        private static const _Str_14384:String = (ILLUMINA_INPUT + ":button_caption");
        private static const _Str_15741:String = (ILLUMINA_INPUT + ":empty_message");
        private static const _Str_15046:String = (ILLUMINA_INPUT + ":multiline");
        private static const _Str_15861:String = (ILLUMINA_INPUT + ":max_chars");
        private static const _Str_15732:PropertyStruct = new PropertyStruct(_Str_14384, "${widgets.chatinput.say}", PropertyStruct.STRING);
        private static const _Str_15686:PropertyStruct = new PropertyStruct(_Str_15741, "", PropertyStruct.STRING);
        private static const _Str_13245:PropertyStruct = new PropertyStruct(_Str_15046, false, PropertyStruct.BOOLEAN);
        private static const _Str_14030:PropertyStruct = new PropertyStruct(_Str_15861, 0, PropertyStruct.INT);
        private static const _Str_15913:int = 28;

        private var _disposed:Boolean;
        private var _widgetWindow:IWidgetWindow;
        private var _windowManager:HabboWindowManagerComponent;
        private var _root:IWindowContainer;
        private var _submitButton:IButtonWindow;
        private var _inputField:ITextFieldWindow;
        private var _emptyMessageLabel:ILabelWindow;
        private var _submitHandler:_Str_5480;

        public function IlluminaInputWidget(k:IWidgetWindow, _arg_2:HabboWindowManagerComponent)
        {
            this._widgetWindow = k;
            this._windowManager = _arg_2;
            this._root = (this._windowManager.buildFromXML((this._windowManager.assets.getAssetByName("illumina_input_xml").content as XML)) as IWindowContainer);
            this._root.width = this._widgetWindow.width;
            this._submitButton = (this._root.findChildByName("submit") as IButtonWindow);
            this._inputField = (this._root.findChildByName("input") as ITextFieldWindow);
            this._emptyMessageLabel = (this._root.findChildByName("empty_message") as ILabelWindow);
            this._Str_5167 = String(_Str_15732.value);
            this._Str_6307 = String(_Str_15686.value);
            this.multiline = Boolean(_Str_13245.value);
            this.maxChars = int(_Str_14030.value);
            this.refresh();
            this._root.procedure = this._Str_16893;
            this._widgetWindow._Str_2429 = this._root;
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                if (this._inputField != null)
                {
                    this._inputField = null;
                }
                this._submitButton = null;
                this._emptyMessageLabel = null;
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
                this._windowManager = null;
                this._disposed = true;
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get iterator():IIterator
        {
            return EmptyIterator.INSTANCE;
        }

        public function get properties():Array
        {
            var k:Array = [];
            if (this._disposed)
            {
                return k;
            }
            k.push(_Str_15732.withValue(this._Str_5167));
            k.push(_Str_15686.withValue(this._Str_6307));
            k.push(_Str_13245.withValue(this.multiline));
            k.push(_Str_14030.withValue(this.maxChars));
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
                    case _Str_14384:
                        this._Str_5167 = String(_local_2.value);
                        break;
                    case _Str_15741:
                        this._Str_6307 = String(_local_2.value);
                        break;
                    case _Str_15046:
                        this.multiline = Boolean(_local_2.value);
                        break;
                    case _Str_15861:
                        this.maxChars = int(_local_2.value);
                        break;
                }
            }
        }

        public function get _Str_5167():String
        {
            return this._submitButton.caption;
        }

        public function set _Str_5167(k:String):void
        {
            this._submitButton.caption = k;
            this._submitButton.visible = ((!(k == null)) && (k.length > 0));
            this.refresh();
        }

        public function get _Str_6307():String
        {
            return this._emptyMessageLabel.caption;
        }

        public function set _Str_6307(k:String):void
        {
            this._emptyMessageLabel.caption = k;
        }

        public function get multiline():Boolean
        {
            return this._inputField.multiline;
        }

        public function set multiline(k:Boolean):void
        {
            this._inputField.multiline = k;
            this._root.setParamFlag(WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_STRETCH, k);
            this._root.height = ((k) ? this._widgetWindow.height : _Str_15913);
        }

        public function get maxChars():int
        {
            return this._inputField.maxChars;
        }

        public function set maxChars(k:int):void
        {
            this._inputField.maxChars = k;
        }

        public function get message():String
        {
            return this._inputField.caption;
        }

        public function set message(k:String):void
        {
            this._inputField.caption = k;
            this.refresh();
        }

        public function get _Str_8859():_Str_5480
        {
            return this._submitHandler;
        }

        public function set _Str_8859(k:_Str_5480):void
        {
            this._submitHandler = k;
        }

        private function _Str_16893(k:WindowEvent, _arg_2:IWindow):void
        {
            switch (k.type)
            {
                case WindowEvent.WINDOW_EVENT_CHANGE:
                    if (_arg_2 == this._inputField)
                    {
                        this.refresh();
                    }
                    return;
                case WindowKeyboardEvent.WINDOW_EVENT_KEY_DOWN:
                    if ((((_arg_2 == this._inputField) && (WindowKeyboardEvent(k).charCode == 13)) && (this._submitButton.visible)))
                    {
                        this._Str_19598();
                    }
                    return;
                case WindowMouseEvent.CLICK:
                    if (_arg_2 == this._submitButton)
                    {
                        this._Str_19598();
                    }
                    return;
            }
        }

        private function _Str_19598():void
        {
            if (this._submitHandler != null)
            {
                this._submitHandler._Str_3055(this._widgetWindow, this.message);
            }
        }

        private function refresh():void
        {
            this._emptyMessageLabel.visible = (this._inputField.length == 0);
            this._inputField.width = (((this._submitButton.visible) ? this._submitButton.x : this._root.width) - (this._inputField.x * 2));
        }
    }
}
