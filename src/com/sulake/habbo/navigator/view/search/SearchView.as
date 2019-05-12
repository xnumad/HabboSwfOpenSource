package com.sulake.habbo.navigator.view.search
{
    import com.sulake.habbo.navigator.HabboNewNavigator;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.components.IDropMenuWindow;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.IStaticBitmapWrapperWindow;
    import flash.ui.Keyboard;

    public class SearchView 
    {
        private static var _Str_17352:Array = [FilterModeEnum._Str_17193, FilterModeEnum._Str_17720, FilterModeEnum._Str_19005, FilterModeEnum._Str_17241, FilterModeEnum._Str_3783];
        private static var _Str_18694:Array = [0, 2, 1, 3, 4, 0];
        private static const _Str_15977:uint = 0x9F9F9F;
        private static const _Str_16807:uint = 0;

        private var _navigator:HabboNewNavigator;
        private var _container:IWindowContainer;
        private var _inputField:ITextFieldWindow;
        private var _filterSelector:IDropMenuWindow;
        private var _inputFieldPlaceholderText:String;

        public function SearchView(k:HabboNewNavigator)
        {
            this._navigator = k;
            this._inputFieldPlaceholderText = this._navigator.localization.getLocalizationWithParams("navigator.filter.input.placeholder", "filter rooms by...");
        }

        public function set container(k:IWindowContainer):void
        {
            this._container = k;
            this._filterSelector = IDropMenuWindow(this._container.findChildByName("filter_type_drop_menu"));
            this._inputField = ITextFieldWindow(this._container.findChildByName("search_input"));
            this._inputField.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_UP, this._Str_15516);
            this._inputField.addEventListener(WindowEvent.WINDOW_EVENT_CHANGE, this._Str_14673);
            this._inputField.addEventListener(WindowEvent.WINDOW_EVENT_FOCUSED, this._Str_22495);
            var _local_2:IWindow = this._container.findChildByName("clear_search_button");
            if (_local_2)
            {
                _local_2.addEventListener(WindowMouseEvent.CLICK, this._Str_15242);
            }
            this.clear();
        }

        private function _Str_15242(k:WindowMouseEvent=null):void
        {
            this._inputField.focus();
            this._inputField.caption = "";
            var _local_2:IStaticBitmapWrapperWindow = (this._container.findChildByName("search.clear.icon") as IStaticBitmapWrapperWindow);
            _local_2.assetUri = "common_small_pen";
        }

        public function clear():void
        {
            this._Str_19423();
            this._filterSelector.selection = FilterModeEnum.DEFAULT;
            this._container.findChildByName("refreshButtonContainer").visible = false;
        }

        public function _Str_22850(k:String, _arg_2:String=""):void
        {
            var _local_4:IStaticBitmapWrapperWindow;
            var _local_3:int = FilterModeEnum._Str_25167(k);
            if (_local_3 != 0)
            {
                this._filterSelector.selection = _Str_18694[_local_3];
                this._inputField.caption = k.substr(FilterModeEnum._Str_7872[_local_3].length, (k.length - FilterModeEnum._Str_7872[_local_3].length));
            }
            else
            {
                this._inputField.caption = k;
                this._filterSelector.selection = FilterModeEnum.DEFAULT;
            }
            if (((!(_arg_2 == "")) && (!(_arg_2 == this._inputFieldPlaceholderText))))
            {
                this._inputField.caption = _arg_2;
                this._Str_13466(true);
            }
            else
            {
                if (this._inputField.caption == "")
                {
                    this._Str_19423();
                }
                else
                {
                    this._Str_13466(false);
                }
            }
            if (((!(this._inputField.caption.length == 0)) && (!(this._inputField.caption == this._inputFieldPlaceholderText))))
            {
                this._container.findChildByName("refreshButtonContainer").visible = true;
                _local_4 = (this._container.findChildByName("search.clear.icon") as IStaticBitmapWrapperWindow);
                _local_4.assetUri = "icons_close";
            }
            else
            {
                this._container.findChildByName("refreshButtonContainer").visible = false;
                _local_4 = (this._container.findChildByName("search.clear.icon") as IStaticBitmapWrapperWindow);
                _local_4.assetUri = "common_small_pen";
            }
        }

        private function _Str_15516(k:WindowKeyboardEvent):void
        {
            if (k.keyCode == Keyboard.ENTER)
            {
                this._navigator._Str_3310(this._navigator._Str_3440._Str_4569, this._Str_24862());
            }
        }

        private function _Str_24862():String
        {
            return FilterModeEnum._Str_7872[_Str_17352[this._filterSelector.selection]] + this._inputField.caption;
        }

        private function _Str_19423():void
        {
            this._Str_13466(true);
            this._inputField.caption = this._inputFieldPlaceholderText;
        }

        private function _Str_22495(k:WindowEvent):void
        {
            this._Str_13466(false);
            if (this._inputField.caption == this._inputFieldPlaceholderText)
            {
                this._inputField.caption = "";
            }
        }

        private function _Str_13466(k:Boolean):void
        {
            this._inputField.textColor = ((k) ? _Str_15977 : _Str_16807);
            this._inputField.italic = k;
        }

        private function _Str_14673(k:WindowEvent):void
        {
        }

        public function get _Str_25291():String
        {
            if (this._inputField != null)
            {
                return this._inputField.caption;
            }
            return this._inputFieldPlaceholderText;
        }
    }
}


