package com.sulake.habbo.help.namechange
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.habbo.help.INameChangeUI;
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.components.ITextWindow;
    import flash.external.ExternalInterface;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.communication.messages.incoming.avatar.ChangeNameUpdateEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowEvent;

    public class NameChangeView implements IDisposable 
    {
        private static const FLASHEXTERNALINTERFACE_UPDATENAME:String = "FlashExternalInterface.updateName";
        private static var _Str_5899:uint = 13232628;
        private static var _Str_7150:uint = 11129827;

        private var _controller:INameChangeUI;
        private var _window:IFrameWindow;
        private var _checkedName:String;
        private var _pendingName:String;
        private var _mainView:IWindowContainer;
        private var _selectionView:IWindowContainer;
        private var _confirmationView:IWindowContainer;
        private var _currentView:IWindowContainer;
        private var _waitingNameCheck:Boolean = false;
        private var _suggestionsRenderer:NameSuggestionListRenderer;
        private var _disposed:Boolean;

        public function NameChangeView(k:INameChangeUI):void
        {
            this._controller = k;
        }

        public function get id():String
        {
            return NameChangeController.TUI_NAME_VIEW;
        }

        public function set _Str_16320(k:String):void
        {
            this._checkedName = k;
            if (this._pendingName == this._checkedName)
            {
                this._Str_16586();
                return;
            }
            this._Str_17607();
        }

        public function dispose():void
        {
            if (!this._disposed)
            {
                this._Str_6430();
                if (this._suggestionsRenderer != null)
                {
                    this._suggestionsRenderer.dispose();
                    this._suggestionsRenderer = null;
                }
                this._disposed = true;
            }
        }

        private function _Str_6430():void
        {
            this._mainView = null;
            this._selectionView = null;
            this._confirmationView = null;
            this._currentView = null;
            if (this._window != null)
            {
                this._window.dispose();
                this._window = null;
            }
        }

        private function _Str_4731(k:IWindowContainer):void
        {
            this._waitingNameCheck = false;
            if (this._currentView)
            {
                this._currentView.visible = false;
            }
            this._currentView = k;
            this._currentView.visible = true;
            if (this._window)
            {
                this._window.content.width = this._currentView.width;
                this._window.content.height = this._currentView.height;
            }
        }

        public function _Str_22632():void
        {
            if (!this._window)
            {
                this._window = (this._controller._Str_12245("welcome_name_change") as IFrameWindow);
                this._window.center();
                this._window.procedure = this._Str_3545;
                this._mainView = (this._window.content.getChildAt(0) as IWindowContainer);
            }
            this._controller.localization.registerParameter("tutorial.name_change.current", "name", this._controller._Str_16619);
            this._window.caption = this._controller.localization.getLocalization("tutorial.name_change.title.main");
            this._Str_4731(this._mainView);
        }

        private function _Str_20459():void
        {
            if (!this._selectionView)
            {
                this._selectionView = (this._controller._Str_12245("welcome_name_selection") as IWindowContainer);
                if (!this._selectionView)
                {
                    return;
                }
                this._window.content.addChild(this._selectionView);
            }
            this._window.caption = this._controller.localization.getLocalization("tutorial.name_change.title.select");
            var k:IButtonWindow = (this._window.findChildByName("select_name_button") as IButtonWindow);
            if (k)
            {
                k.disable();
            }
            this._Str_15733();
            this._Str_4731(this._selectionView);
        }

        private function _Str_16586():void
        {
            if (!this._confirmationView)
            {
                this._confirmationView = (this._controller._Str_12245("welcome_name_confirmation") as IWindowContainer);
                if (!this._confirmationView)
                {
                    return;
                }
                this._window.content.addChild(this._confirmationView);
            }
            this._window.caption = this._controller.localization.getLocalization("tutorial.name_change.title.confirm");
            var k:ITextWindow = (this._confirmationView.findChildByName("final_name") as ITextWindow);
            if (k)
            {
                k.text = this._checkedName;
            }
            this._Str_4731(this._confirmationView);
            if (ExternalInterface.available)
            {
                ExternalInterface.call(FLASHEXTERNALINTERFACE_UPDATENAME, this._checkedName);
            }
        }

        public function get view():IWindowContainer
        {
            return this._window;
        }

        public function _Str_15733():void
        {
            if (this._window == null)
            {
                return;
            }
            var k:ITextWindow = (this._window.findChildByName("info_text") as ITextWindow);
            if (k == null)
            {
                return;
            }
            k.text = this._controller.localization.getLocalization("help.tutorial.name.info");
            var _local_2:IWindowContainer = (this._window.findChildByName("suggestions") as IWindowContainer);
            if (_local_2 == null)
            {
                return;
            }
            _local_2.visible = false;
        }

        public function _Str_17607():void
        {
            if (this._window == null)
            {
                return;
            }
            this._Str_7477(true);
            var k:ITextWindow = (this._window.findChildByName("info_text") as ITextWindow);
            if (k == null)
            {
                return;
            }
            this._controller.localization.registerParameter("help.tutorial.name.available", "name", this._checkedName);
            k.text = this._controller.localization.getLocalization("help.tutorial.name.available");
            var _local_2:ITextFieldWindow = (this._window.findChildByName("input") as ITextFieldWindow);
            if (_local_2 == null)
            {
                return;
            }
            _local_2.text = this._checkedName;
            var _local_3:IWindowContainer = (this._window.findChildByName("suggestions") as IWindowContainer);
            if (_local_3 == null)
            {
                return;
            }
            _local_3.visible = false;
        }

        public function _Str_14489(k:int, _arg_2:String, _arg_3:Array):void
        {
            var _local_8:IWindow;
            this._Str_7477(false);
            if (this._currentView != this._selectionView)
            {
                this._Str_20459();
            }
            this._pendingName = null;
            this._checkedName = null;
            if (this._window == null)
            {
                return;
            }
            var _local_4:ITextWindow = (this._window.findChildByName("info_text") as ITextWindow);
            if (_local_4 == null)
            {
                return;
            }
            switch (k)
            {
                case ChangeNameUpdateEvent._Str_7721:
                    this._controller.localization.registerParameter("help.tutorial.name.taken", "name", _arg_2);
                    _local_4.text = this._controller.localization.getLocalization("help.tutorial.name.taken");
                    break;
                case ChangeNameUpdateEvent._Str_7836:
                    this._controller.localization.registerParameter("help.tutorial.name.invalid", "name", _arg_2);
                    _local_4.text = this._controller.localization.getLocalization("help.tutorial.name.invalid");
                    break;
                case ChangeNameUpdateEvent._Str_7005:
                    break;
                case ChangeNameUpdateEvent._Str_7137:
                    _local_4.text = this._controller.localization.getLocalization("help.tutorial.name.long");
                    break;
                case ChangeNameUpdateEvent._Str_7389:
                    _local_4.text = this._controller.localization.getLocalization("help.tutorial.name.short");
                    break;
                case ChangeNameUpdateEvent._Str_8620:
                    _local_4.text = this._controller.localization.getLocalization("help.tutorial.name.change_not_allowed");
                    break;
                case ChangeNameUpdateEvent._Str_9429:
                    _local_4.text = this._controller.localization.getLocalization("help.tutorial.name.merge_hotel_down");
                    break;
            }
            var _local_5:IWindowContainer = (this._window.findChildByName("suggestions") as IWindowContainer);
            if (_local_5 == null)
            {
                return;
            }
            if (((k == ChangeNameUpdateEvent._Str_9429) || (k == ChangeNameUpdateEvent._Str_8620)))
            {
                _local_5.visible = false;
                return;
            }
            _local_5.visible = true;
            this._suggestionsRenderer = new NameSuggestionListRenderer(this._controller);
            var _local_6:int = this._suggestionsRenderer.render(_arg_3, _local_5);
            var _local_7:int;
            while (_local_7 < _local_5.numChildren)
            {
                _local_8 = _local_5.getChildAt(_local_7);
                _local_8.color = _Str_5899;
                _local_8.addEventListener(WindowMouseEvent.CLICK, this._Str_16049);
                _local_8.addEventListener(WindowMouseEvent.OVER, this._Str_18499);
                _local_8.addEventListener(WindowMouseEvent.OUT, this._Str_18785);
                _local_7++;
            }
        }

        private function _Str_16049(k:WindowMouseEvent):void
        {
            this._Str_7477(true);
            var _local_2:ITextWindow = (k.target as ITextWindow);
            if (!_local_2)
            {
                return;
            }
            var _local_3:String = _local_2.text;
            this._Str_15733();
            var _local_4:ITextFieldWindow = (this._window.findChildByName("input") as ITextFieldWindow);
            if (_local_4 == null)
            {
                return;
            }
            _local_4.text = _local_3;
        }

        private function _Str_18499(k:WindowMouseEvent):void
        {
            var _local_2:ITextWindow = (k.target as ITextWindow);
            if (_local_2 != null)
            {
                _local_2.color = _Str_7150;
            }
        }

        private function _Str_18785(k:WindowMouseEvent):void
        {
            var _local_2:ITextWindow = (k.target as ITextWindow);
            if (_local_2 != null)
            {
                _local_2.color = _Str_5899;
            }
        }

        public function _Str_13481():void
        {
            var k:IWindow;
            if (((this._window) && (!(this._window.disposed))))
            {
                k = this._window.findChildByName("select_name_button");
                if (k)
                {
                    k.disable();
                }
                k = this._window.findChildByName("check_name_button");
                if (k)
                {
                    k.disable();
                }
                k = this._window.findChildByName("input");
                if (k)
                {
                    k.disable();
                }
                k = this._window.findChildByName("info_text");
                if (k)
                {
                    k.caption = this._controller.localization.getLocalization("help.tutorial.name.wait_while_checking");
                }
            }
            this._waitingNameCheck = true;
        }

        public function _Str_7477(k:Boolean):void
        {
            var _local_2:IWindow;
            if (((this._window) && (!(this._window.disposed))))
            {
                if (k)
                {
                    _local_2 = this._window.findChildByName("select_name_button");
                    if (_local_2)
                    {
                        _local_2.enable();
                    }
                }
                _local_2 = this._window.findChildByName("check_name_button");
                if (_local_2)
                {
                    _local_2.enable();
                }
                _local_2 = this._window.findChildByName("input");
                if (_local_2)
                {
                    _local_2.enable();
                }
            }
            this._waitingNameCheck = false;
        }

        private function _Str_3545(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:IWindow;
            var _local_4:ITextFieldWindow;
            var _local_5:String;
            if (!this._waitingNameCheck)
            {
                if (k.type == WindowEvent.WINDOW_EVENT_CHANGE)
                {
                    if (_arg_2.name == "input")
                    {
                        _local_3 = this._window.findChildByName("select_name_button");
                        _local_4 = (_arg_2 as ITextFieldWindow);
                        if (((_local_3) && (_local_4)))
                        {
                            if (_local_4.text.length > 2)
                            {
                                _local_3.enable();
                            }
                            else
                            {
                                _local_3.disable();
                            }
                        }
                    }
                }
            }
            if (k.type != WindowMouseEvent.CLICK)
            {
                return;
            }
            switch (_arg_2.name)
            {
                case "change_name_button":
                    this._Str_20459();
                    return;
                case "keep_name_button":
                    this._checkedName = this._controller._Str_16619;
                    this._Str_16586();
                    return;
                case "check_name_button":
                    this._controller.checkName(this.getName());
                    this._Str_13481();
                    return;
                case "select_name_button":
                    _local_5 = this.getName();
                    if (_local_5.length < 1)
                    {
                        return;
                    }
                    if (this._checkedName != _local_5)
                    {
                        this._pendingName = _local_5;
                        this._controller.checkName(_local_5);
                        this._Str_13481();
                    }
                    else
                    {
                        this._Str_16586();
                    }
                    return;
                case "cancel_selection_button":
                    this._controller._Str_5574();
                    return;
                case "confirm_name_button":
                    this._controller._Str_20431(this._checkedName);
                    return;
                case "cancel_confirmation_button":
                    this._controller._Str_5574();
                    return;
                case "header_button_close":
                    this._controller._Str_5574();
                    return;
            }
        }

        private function getName():String
        {
            var k:ITextFieldWindow;
            if (this._window)
            {
                k = (this._window.findChildByName("input") as ITextFieldWindow);
                if (k)
                {
                    return k.text;
                }
            }
            return null;
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }
    }
}
