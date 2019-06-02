package com.sulake.habbo.avatar.view
{
    import com.sulake.core.window.components.IFrameWindow;
    import com.sulake.habbo.avatar.AvatarEditorView;
    import com.sulake.habbo.avatar.HabboAvatarEditorManager;
    import com.sulake.core.window.components.IButtonWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.components.ITextWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.communication.messages.incoming.avatar.ChangeNameUpdateEvent;

    public class AvatarEditorNameChangeView 
    {
        private static var _Str_5899:uint = 13232628;
        private static var _Str_7150:uint = 11129827;

        private var _window:IFrameWindow;
        private var _mainView:AvatarEditorView;
        private var _manager:HabboAvatarEditorManager;
        private var _suggestionsRenderer:AvatarEditorNameSuggestionListRenderer;
        private var _checkedName:String;
        private var _pendingName:String;
        private var _waitingNameCheck:Boolean = false;

        public function AvatarEditorNameChangeView(k:AvatarEditorView, _arg_2:int, _arg_3:int)
        {
            this._mainView = k;
            this._manager = this._mainView.editor.manager;
            this._window = IFrameWindow(this._manager.windowManager.buildFromXML(XML(new HabboAvatarEditorCom.avatar_editor_name_change())));
            this._window.x = _arg_2;
            var _local_4:int = this._manager.windowManager.getDesktop(1).width;
            if ((this._window.x + this._window.width) > _local_4)
            {
                this._window.x = (_local_4 - this._window.width);
            }
            this._window.y = _arg_3;
            this._Str_7598();
        }

        private function _Str_7598():void
        {
            this._window.procedure = this._Str_3545;
            var k:IButtonWindow = (this._window.findChildByName("select_name_button") as IButtonWindow);
            if (k)
            {
                k.disable();
            }
        }

        public function focus():void
        {
            this._window.activate();
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
                    k.caption = this._manager.localization.getLocalization("help.tutorial.name.wait_while_checking");
                }
            }
            this._waitingNameCheck = true;
        }

        private function _Str_3545(k:WindowEvent, _arg_2:IWindow):void
        {
            var _local_3:IWindow;
            var _local_4:ITextFieldWindow;
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
                case "check_name_button":
                    this._manager.handler.checkName(this.getName());
                    this._Str_13481();
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

        public function set _Str_16320(k:String):void
        {
            this._checkedName = k;
            if (this._pendingName == this._checkedName)
            {
                return;
            }
            this._Str_17607();
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
            this._manager.localization.registerParameter("help.tutorial.name.available", "name", this._checkedName);
            k.text = this._manager.localization.getLocalization("help.tutorial.name.available");
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
                    this._manager.localization.registerParameter("help.tutorial.name.taken", "name", _arg_2);
                    _local_4.text = this._manager.localization.getLocalization("help.tutorial.name.taken");
                    break;
                case ChangeNameUpdateEvent._Str_7836:
                    this._manager.localization.registerParameter("help.tutorial.name.invalid", "name", _arg_2);
                    _local_4.text = this._manager.localization.getLocalization("help.tutorial.name.invalid");
                    break;
                case ChangeNameUpdateEvent._Str_7005:
                    break;
                case ChangeNameUpdateEvent._Str_7137:
                    _local_4.text = this._manager.localization.getLocalization("help.tutorial.name.long");
                    break;
                case ChangeNameUpdateEvent._Str_7389:
                    _local_4.text = this._manager.localization.getLocalization("help.tutorial.name.short");
                    break;
                case ChangeNameUpdateEvent._Str_8620:
                    _local_4.text = this._manager.localization.getLocalization("help.tutorial.name.change_not_allowed");
                    break;
                case ChangeNameUpdateEvent._Str_9429:
                    _local_4.text = this._manager.localization.getLocalization("help.tutorial.name.merge_hotel_down");
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
            this._suggestionsRenderer = new AvatarEditorNameSuggestionListRenderer(this._manager);
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
            k.text = this._manager.localization.getLocalization("help.tutorial.name.info");
            var _local_2:IWindowContainer = (this._window.findChildByName("suggestions") as IWindowContainer);
            if (_local_2 == null)
            {
                return;
            }
            _local_2.visible = false;
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
    }
}

