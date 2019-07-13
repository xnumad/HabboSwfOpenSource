package com.sulake.habbo.ui.widget.chatinput
{
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.window.components.ITextFieldWindow;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.ICloseButtonWindow;
    import com.sulake.core.window.components.IRegionWindow;
    import flash.text.TextFormat;
    import flash.utils.Timer;
    import com.sulake.habbo.ui.widget.chatinput.styleselector.ChatStyleSelector;
    import com.sulake.core.runtime.IHabboConfigurationManager;
    import flash.events.TimerEvent;
    import com.sulake.core.window.events.WindowMouseEvent;
    import com.sulake.core.window.events.WindowKeyboardEvent;
    import com.sulake.core.window.events.WindowEvent;
    import com.sulake.habbo.freeflowchat.style.IChatStyle;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.enum.WindowParam;
    import com.sulake.habbo.session.SecurityLevelEnum;
    import com.sulake.habbo.session.HabboClubLevelEnum;
    import com.sulake.core.window.components.IItemListWindow;
    import com.sulake.room.utils.RoomEnterEffect;
    import com.sulake.core.window.enum.WindowType;
    import com.sulake.habbo.window.enum._Str_3108;
    import flash.geom.Rectangle;
    import flash.geom.Point;
    import flash.events.KeyboardEvent;
    import flash.ui.Keyboard;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetChatTypingMessage;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetChatMessage;
    import com.sulake.habbo.ui.widget.enums.SystemChatStyleEnum;
    import flash.display.Stage;
    import flash.display.InteractiveObject;
    import flash.display.DisplayObject;
    import flash.text.TextField;
    import com.sulake.habbo.session.ISessionDataManager;

    public class RoomChatInputView 
    {
        private static const _Str_10663:int = 12;
        private static const _Str_16188:String = "habbopages/chat/commands";

        private var _widget:RoomChatInputWidget;
        private var _window:IWindowContainer;
        private var _inputField:ITextFieldWindow;
        private var _inputBorder:IWindow;
        private var _blockText:IWindow;
        private var _helpButton:ICloseButtonWindow;
        private var _helpButtonShowRegion:IRegionWindow;
        private var _mouseOverHelpButton:Boolean = false;
        private var _chatInputContainerWindow:IWindowContainer;
        private var _chatStyleSelectorMenuContainer:IWindowContainer;
        private var _chatModeIdShout:String;
        private var _chatModeIdWhisper:String;
        private var _chatModeIdSpeak:String;
        private var _isHelpTextShowing:Boolean = false;
        private var _helpTextFormat:TextFormat;
        private var _isTyping:Boolean = false;
        private var _typingStartedSent:Boolean = false;
        private var _typingTimer:Timer;
        private var _idleTimer:Timer;
        private var _nuxIdleTimer:Timer;
        private var _lastContent:String = "";
        private var _removeDimmerTimer:Timer;
        private var _isNoob:Boolean = false;
        private var _nuxChatReminderTimer:Timer;
        private var _chatReminderAnimationCounter:int = 0;
        private var _helpButtonHideTimer:Timer;
        private var _chatStyleSelector:ChatStyleSelector;

        public function RoomChatInputView(k:RoomChatInputWidget)
        {
            var _local_2:IHabboConfigurationManager;
            var _local_3:int;
            super();
            this._widget = k;
            this._chatModeIdWhisper = k.localizations.getLocalization("widgets.chatinput.mode.whisper", ":tell");
            this._chatModeIdShout = k.localizations.getLocalization("widgets.chatinput.mode.shout", ":shout");
            this._chatModeIdSpeak = k.localizations.getLocalization("widgets.chatinput.mode.speak", ":speak");
            this._typingTimer = new Timer(1000, 1);
            this._typingTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this._Str_20723);
            this._idleTimer = new Timer(10000, 1);
            this._idleTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this._Str_20169);
            this._isNoob = ((this.sessionDataManager.nameChangeAllowed) || (this.sessionDataManager.isAnyRoomController));
            if (this._isNoob)
            {
                _local_2 = k.handler.container.config;
                if (_local_2.getProperty("nux.chat.reminder.shown") != "1")
                {
                    _local_3 = _local_2.getInteger("nux.noob.chat.reminder.delay", 240);
                    this._nuxIdleTimer = new Timer((_local_3 * 1000), 1);
                    this._nuxIdleTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this._Str_16184);
                    this._nuxIdleTimer.start();
                }
            }
            this._helpTextFormat = new TextFormat(null, null, 0x999999, null, true, false);
            this.createWindow();
        }

        public function get window():IWindowContainer
        {
            return this._window;
        }

        public function dispose():void
        {
            if (this._isNoob)
            {
                this.widget.windowManager.hideHint();
                this.widget.windowManager.unregisterHintWindow("nux_chat_reminder");
            }
            this._widget = null;
            if (this._inputField)
            {
                this._inputField.removeEventListener(WindowMouseEvent.DOWN, this._Str_22202);
                this._inputField.removeEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_DOWN, this._Str_10572);
                this._inputField.removeEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_UP, this._Str_15516);
                this._inputField.removeEventListener(WindowEvent.WINDOW_EVENT_CHANGE, this._Str_14673);
                this._inputField.removeEventListener(WindowMouseEvent.OVER, this._Str_6563);
                this._inputField.removeEventListener(WindowMouseEvent.OUT, this._Str_6563);
                this._inputField = null;
            }
            this._inputBorder = null;
            this._blockText = null;
            if (this._helpButton)
            {
                this._helpButton.removeEventListener(WindowMouseEvent.CLICK, this._Str_8782);
                this._helpButton.removeEventListener(WindowMouseEvent.OVER, this._Str_8782);
                this._helpButton.removeEventListener(WindowMouseEvent.OUT, this._Str_8782);
                this._helpButton = null;
            }
            if (this._helpButtonShowRegion)
            {
                this._helpButtonShowRegion.removeEventListener(WindowMouseEvent.OVER, this._Str_6563);
                this._helpButtonShowRegion.removeEventListener(WindowMouseEvent.OUT, this._Str_6563);
                this._helpButtonShowRegion = null;
            }
            if (this._chatInputContainerWindow != null)
            {
                this._chatInputContainerWindow.dispose();
                this._chatInputContainerWindow = null;
            }
            if (this._typingTimer != null)
            {
                this._typingTimer.reset();
                this._typingTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this._Str_20723);
                this._typingTimer = null;
            }
            if (this._idleTimer != null)
            {
                this._idleTimer.reset();
                this._idleTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this._Str_20169);
                this._idleTimer = null;
            }
            if (this._nuxIdleTimer != null)
            {
                this._nuxIdleTimer.reset();
                this._nuxIdleTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this._Str_16184);
                this._nuxIdleTimer = null;
            }
            if (this._nuxChatReminderTimer != null)
            {
                this._nuxChatReminderTimer.reset();
                this._nuxChatReminderTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this._Str_20444);
                this._nuxChatReminderTimer = null;
            }
            if (this._removeDimmerTimer)
            {
                this._removeDimmerTimer.reset();
                this._removeDimmerTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this._Str_5360);
                this._removeDimmerTimer = null;
            }
            if (((this._window) && (this._window.desktop)))
            {
                this._window.desktop.removeChild(this._window);
            }
        }

        private function createWindow():void
        {
            var _local_3:Array;
            var _local_4:Array;
            var _local_5:Boolean;
            var _local_6:int;
            var _local_7:IChatStyle;
            if (this._chatInputContainerWindow != null)
            {
                return;
            }
            var k:String = "chatinput_window_new";
            var _local_2:XmlAsset = (this._widget.assets.getAssetByName(k) as XmlAsset);
            if (((_local_2 == null) || (_local_2.content == null)))
            {
                return;
            }
            this._window = (this._widget.windowManager.buildFromXML((_local_2.content as XML)) as IWindowContainer);
            this._window.width = this._window.desktop.width;
            this._window.height = this._window.desktop.height;
            this._window.invalidate();
            this._chatStyleSelectorMenuContainer = IWindowContainer(this._window.findChildByName("chatstyles_menu"));
            this._chatInputContainerWindow = (this._window.findChildByName("bubblecont") as IWindowContainer);
            this._chatInputContainerWindow.tags.push("room_widget_chatinput");
            this._inputField = (this._chatInputContainerWindow.findChildByName("chat_input") as ITextFieldWindow);
            this._inputBorder = this._chatInputContainerWindow.findChildByName("input_border");
            this._blockText = this._chatInputContainerWindow.findChildByName("block_text");
            this._helpButtonShowRegion = IRegionWindow(this._chatInputContainerWindow.findChildByName("helpbutton_show_hover_region"));
            this._helpButtonShowRegion.addEventListener(WindowMouseEvent.OVER, this._Str_6563);
            this._helpButtonShowRegion.addEventListener(WindowMouseEvent.OUT, this._Str_6563);
            this._Str_3714();
            this._inputField.setParamFlag(WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR, true);
            this._inputField.addEventListener(WindowMouseEvent.DOWN, this._Str_22202);
            this._inputField.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_DOWN, this._Str_10572);
            this._inputField.addEventListener(WindowKeyboardEvent.WINDOW_EVENT_KEY_UP, this._Str_15516);
            this._inputField.addEventListener(WindowEvent.WINDOW_EVENT_CHANGE, this._Str_14673);
            this._inputField.addEventListener(WindowMouseEvent.OVER, this._Str_6563);
            this._inputField.addEventListener(WindowMouseEvent.OUT, this._Str_6563);
            this._inputField._Str_3099 = 0;
            this._inputField._Str_4074 = true;
            this._isHelpTextShowing = true;
            this._inputField.setTextFormat(this._helpTextFormat);
            this._lastContent = "";
            this._window.addEventListener(WindowEvent.WINDOW_EVENT_PARENT_RESIZED, this._Str_3714);
            this._window.addEventListener(WindowEvent.WINDOW_EVENT_PARENT_ADDED, this._Str_3714);
            if (((((this._Str_20898()) && (!(this._widget.handler.container.roomSession.isGameSession))) && (!(this._widget.handler.container.freeFlowChat == null))) && (!(this._widget.handler.container.freeFlowChat.chatStyleLibrary == null))))
            {
                _local_3 = [];
                _local_4 = this._widget._Str_13265.getProperty("disabled.custom.chat.styles").split(",");
                _local_5 = this._widget.handler.container.sessionDataManager.hasSecurity(SecurityLevelEnum._Str_3751);
                for each (_local_6 in this._widget.handler.container.freeFlowChat.chatStyleLibrary.getStyleIds())
                {
                    _local_7 = this._widget.handler.container.freeFlowChat.chatStyleLibrary.getStyle(_local_6);
                    if (((!(_local_7.isSystemStyle)) && (_local_4.indexOf(_local_6.toString()) == -1)))
                    {
                        if (((_local_7.isHcOnly) && (this._widget.handler.container.sessionDataManager.clubLevel >= HabboClubLevelEnum._Str_2964)))
                        {
                            _local_3.push(_local_6);
                        }
                        else
                        {
                            if (((!(_local_7.isHcOnly)) && (!(_local_7.isAmbassadorOnly))))
                            {
                                _local_3.push(_local_6);
                            }
                        }
                    }
                    if (((_local_7.isStaffOverrideable) && (_local_5)))
                    {
                        _local_3.push(_local_6);
                    }
                    if (((_local_7.isAmbassadorOnly) && ((_local_5) || (this._widget.handler.container.sessionDataManager._Str_4050))))
                    {
                        _local_3.push(_local_6);
                    }
                }
                this._Str_23245(_local_3);
                this._Str_24580(_local_3);
            }
            else
            {
                if ((this._chatInputContainerWindow.findChildByName("chat_input_container") is IItemListWindow))
                {
                    IItemListWindow(this._chatInputContainerWindow.findChildByName("chat_input_container")).removeListItemAt(0);
                }
            }
            this._Str_14171();
            this._helpButton = ICloseButtonWindow(this._window.findChildByName("helpbutton"));
            this._helpButton.addEventListener(WindowMouseEvent.CLICK, this._Str_8782);
            this._helpButton.addEventListener(WindowMouseEvent.OVER, this._Str_8782);
            this._helpButton.addEventListener(WindowMouseEvent.OUT, this._Str_8782);
            this._helpButton.visible = false;
        }

        private function _Str_23245(k:Array):void
        {
            var _local_3:int;
            var _local_2:int;
            while (_local_2 < (k.length - 1))
            {
                _local_3 = (_local_2 + 1);
                while (_local_3 < k.length)
                {
                    if (k[_local_2] === k[_local_3])
                    {
                        k.splice(_local_3--, 1);
                    }
                    _local_3++;
                }
                _local_2++;
            }
        }

        private function _Str_20898():Boolean
        {
            return this._widget._Str_13265.getBoolean("custom.chat.styles.enabled");
        }

        private function _Str_14171():void
        {
            var k:IWindow;
            if (RoomEnterEffect.isRunning())
            {
                k = this._widget.windowManager.createWindow("chat_dimmer", "", WindowType.WINDOW_TYPE_BORDER, _Str_3108._Str_9798, ((WindowParam.WINDOW_PARAM_RELATIVE_HORIZONTAL_SCALE_STRETCH | WindowParam.WINDOW_PARAM_RELATIVE_VERTICAL_SCALE_STRETCH) | WindowParam.WINDOW_PARAM_INPUT_EVENT_PROCESSOR), new Rectangle(0, 0, this._chatInputContainerWindow.width, this._chatInputContainerWindow.height), null, 0);
                k.color = 0;
                k.blend = 0.3;
                this._chatInputContainerWindow.addChild(k);
                this._chatInputContainerWindow.invalidate();
                if (this._removeDimmerTimer == null)
                {
                    this._removeDimmerTimer = new Timer(RoomEnterEffect.totalRunningTime, 1);
                    this._removeDimmerTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this._Str_5360);
                    this._removeDimmerTimer.start();
                }
            }
        }

        private function _Str_5360(k:TimerEvent):void
        {
            this._removeDimmerTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this._Str_5360);
            this._removeDimmerTimer = null;
            var _local_2:IWindow = this._chatInputContainerWindow.findChildByName("chat_dimmer");
            if (_local_2 != null)
            {
                this._chatInputContainerWindow.removeChild(_local_2);
                this._widget.windowManager.destroy(_local_2);
            }
        }

        public function _Str_3714(k:WindowEvent=null, _arg_2:int=10000, _arg_3:int=10000):void
        {
            this._window.width = this._window.desktop.width;
            this._window.height = this._window.desktop.height;
            var _local_4:Point = new Point();
            if (!this._chatInputContainerWindow)
            {
                return;
            }
            var _local_5:int = this.widget._Str_26449();
            var _local_6:int = this.widget._Str_24691();
            var _local_7:int = ((this._window.desktop.width / 2) - (this._chatInputContainerWindow.width / 2));
            var _local_8:int;
            var _local_9:int = (this._chatInputContainerWindow.width + _Str_10663);
            if (((this._window.desktop.width - _local_5) - _local_6) > _local_9)
            {
                _local_8 = (_local_5 + _Str_10663);
                this._chatInputContainerWindow.y = (this._window.desktop.height - 104);
                if ((_local_7 + this._chatInputContainerWindow.width) > (this._window.desktop.width - _local_6))
                {
                    _local_7 = 0;
                }
            }
            else
            {
                _local_8 = (this.widget._Str_22730() + _Str_10663);
                this._chatInputContainerWindow.y = (this._window.desktop.height - 160);
            }
            this._chatInputContainerWindow.x = Math.max(_local_7, _local_8);
            if (this._chatStyleSelector)
            {
                this._chatStyleSelector._Str_19515();
            }
        }

        private function _Str_25960(k:WindowMouseEvent):void
        {
            if (!this._isHelpTextShowing)
            {
                this._Str_21815();
            }
        }

        public function _Str_22810():void
        {
            this._inputField.visible = true;
            this._blockText.visible = false;
        }

        public function _Str_22358():void
        {
            this._inputField.visible = false;
            this._blockText.visible = true;
        }

        public function _Str_22027(k:int):void
        {
            this._blockText.caption = this._widget.localizations.registerParameter("chat.input.alert.flood", "time", k.toString());
        }

        public function _Str_23022(k:String, _arg_2:String=""):void
        {
            if (((this._chatInputContainerWindow == null) || (this._inputField == null)))
            {
                return;
            }
            this._inputField.enable();
            this._inputField.selectable = true;
            this._inputField.text = "";
            this._Str_16838();
            this._inputField.text = (this._inputField.text + (k + " "));
            if (_arg_2.length > 0)
            {
                this._inputField.text = (this._inputField.text + (_arg_2 + " "));
            }
            this._inputField.setSelection(this._inputField.text.length, this._inputField.text.length);
            this._lastContent = this._inputField.text;
        }

        private function _Str_22202(k:WindowEvent=null, _arg_2:IWindow=null):void
        {
            this._Str_16838();
        }

        private function _Str_10572(k:WindowEvent=null, _arg_2:IWindow=null):void
        {
            var _local_3:uint;
            var _local_4:Boolean;
            var _local_5:WindowKeyboardEvent;
            var _local_6:KeyboardEvent;
            var _local_7:String;
            var _local_8:Array;
            if ((((this._chatInputContainerWindow == null) || (this._widget == null)) || (this._widget._Str_21409)))
            {
                return;
            }
            if (this._Str_25460())
            {
                return;
            }
            this._Str_16838();
            if ((k is WindowKeyboardEvent))
            {
                _local_5 = (k as WindowKeyboardEvent);
                _local_3 = _local_5.charCode;
                _local_4 = _local_5.shiftKey;
            }
            if ((k is KeyboardEvent))
            {
                _local_6 = (k as KeyboardEvent);
                _local_3 = _local_6.charCode;
                _local_4 = _local_6.shiftKey;
            }
            if (((_local_6 == null) && (_local_5 == null)))
            {
                return;
            }
            if (_local_3 == Keyboard.SPACE)
            {
                this._Str_24578();
            }
            if (_local_3 == Keyboard.ENTER)
            {
                this._Str_21815(_local_4);
                this._Str_22035(true);
            }
            if (_local_3 == Keyboard.BACKSPACE)
            {
                if (this._inputField != null)
                {
                    _local_7 = this._inputField.text;
                    _local_8 = _local_7.split(" ");
                    if ((((_local_8[0] == this._chatModeIdWhisper) && (_local_8.length == 3)) && (_local_8[2] == "")))
                    {
                        this._inputField.text = "";
                        this._lastContent = "";
                    }
                }
            }
        }

        private function _Str_15516(k:WindowKeyboardEvent):void
        {
            if (k.keyCode == Keyboard.ENTER)
            {
                this._Str_22035(false);
            }
        }

        private function _Str_22035(k:Boolean):void
        {
        }

        private function _Str_14673(k:WindowEvent):void
        {
            var _local_2:ITextFieldWindow = (k.window as ITextFieldWindow);
            if (_local_2 == null)
            {
                return;
            }
            this._idleTimer.reset();
            var _local_3:* = (_local_2.text.length == 0);
            if (_local_3)
            {
                this._isTyping = false;
                this._typingTimer.start();
            }
            else
            {
                if (_local_2.text.length > (this._lastContent.length + 1))
                {
                    if (this._widget._Str_24849)
                    {
                        this._widget._Str_23495();
                    }
                    else
                    {
                        _local_2.text = "";
                    }
                }
                this._lastContent = _local_2.text;
                if (!this._isTyping)
                {
                    this._isTyping = true;
                    this._typingTimer.reset();
                    this._typingTimer.start();
                }
                this._idleTimer.start();
                if (this._nuxIdleTimer != null)
                {
                    this._nuxIdleTimer.reset();
                    this._nuxIdleTimer = null;
                }
            }
        }

        private function _Str_24578():void
        {
            if (((this._inputField == null) || (this._inputField.text == "")))
            {
                return;
            }
            var k:String = this._inputField.text;
            var _local_2:String = this._widget._Str_21568;
            if (k == this._chatModeIdWhisper)
            {
                if (_local_2.length > 0)
                {
                    this._inputField.text = (this._inputField.text + (" " + this._widget._Str_21568));
                    this._inputField.setSelection(this._inputField.text.length, this._inputField.text.length);
                    this._lastContent = this._inputField.text;
                }
            }
        }

        private function _Str_20169(k:TimerEvent):void
        {
            if (this._isTyping)
            {
                this._typingStartedSent = false;
            }
            this._isTyping = false;
            this._Str_17137();
        }

        private function _Str_16184(k:TimerEvent):void
        {
            if (this._nuxIdleTimer != null)
            {
                this._nuxIdleTimer.reset();
                this._nuxIdleTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, this._Str_16184);
                this._nuxIdleTimer = null;
            }
            this._Str_23223();
        }

        private function _Str_20723(k:TimerEvent):void
        {
            if (this._isTyping)
            {
                this._typingStartedSent = true;
            }
            this._Str_17137();
        }

        private function _Str_17137():void
        {
            if (this._widget == null)
            {
                return;
            }
            if (this._widget._Str_21409)
            {
                return;
            }
            var k:RoomWidgetChatTypingMessage = new RoomWidgetChatTypingMessage(this._isTyping);
            this._widget.messageListener.processWidgetMessage(k);
        }

        private function _Str_23223():void
        {
            this._inputField.text = this.widget.localizations.getLocalization("widgets.chatinput.mode.remind.noobie");
            this._nuxChatReminderTimer = new Timer(500);
            this._nuxChatReminderTimer.addEventListener(TimerEvent.TIMER, this._Str_20444);
            this._nuxChatReminderTimer.start();
            this.widget.windowManager.registerHintWindow("nux_chat_reminder", this._inputField);
            this.widget.windowManager.showHint("nux_chat_reminder");
        }

        private function _Str_20444(k:TimerEvent):void
        {
            this._chatReminderAnimationCounter++;
            if ((this._chatReminderAnimationCounter % 2) != 0)
            {
                this._widget.mainWindow.y--;
            }
            else
            {
                this._widget.mainWindow.y = (this._widget.mainWindow.y + 1);
            }
            if (this._chatReminderAnimationCounter >= 10)
            {
                this._nuxChatReminderTimer.reset();
                this._nuxChatReminderTimer = null;
                this._widget.mainWindow.y = 0;
                this._Str_21516();
            }
        }

        private function _Str_21516():void
        {
            this.widget.handler.container.config.setProperty("nux.chat.reminder.shown", "1");
            if (this._nuxChatReminderTimer != null)
            {
                this._nuxChatReminderTimer.reset();
            }
            this.widget.windowManager.hideHint();
            this.widget.windowManager.unregisterHintWindow("nux_chat_reminder");
        }

        private function _Str_16838():void
        {
            if (this._inputField == null)
            {
                return;
            }
            if (this._nuxChatReminderTimer != null)
            {
                this._Str_21516();
            }
            if (this._isHelpTextShowing)
            {
                this._inputField.text = "";
                this._inputField.textColor = 0;
                this._inputField.italic = false;
                this._isHelpTextShowing = false;
                this._lastContent = "";
            }
            this._inputField.focus();
        }

        public function _Str_24855(k:uint):void
        {
            if (this._inputField == null)
            {
                return;
            }
            this._inputField.textColor = k;
            this._inputField.defaultTextFormat.color = k;
        }

        private function _Str_21815(k:Boolean=false):void
        {
            if (((this._inputField == null) || (this._inputField.text == "")))
            {
                return;
            }
            var _local_2:int = ((k) ? RoomWidgetChatMessage.CHAT_TYPE_SHOUT : RoomWidgetChatMessage.CHAT_TYPE_SPEAK);
            var _local_3:String = this._inputField.text;
            var _local_4:Array = _local_3.split(" ");
            var _local_5:String = "";
            var _local_6:String = "";
            switch (_local_4[0])
            {
                case this._chatModeIdWhisper:
                    _local_2 = RoomWidgetChatMessage.CHAT_TYPE_WHISPER;
                    _local_5 = _local_4[1];
                    _local_6 = (((this._chatModeIdWhisper + " ") + _local_5) + " ");
                    _local_4.shift();
                    _local_4.shift();
                    break;
                case this._chatModeIdShout:
                    _local_2 = RoomWidgetChatMessage.CHAT_TYPE_SHOUT;
                    _local_4.shift();
                    break;
                case this._chatModeIdSpeak:
                    _local_2 = RoomWidgetChatMessage.CHAT_TYPE_SPEAK;
                    _local_4.shift();
                    break;
            }
            _local_3 = _local_4.join(" ");
            var _local_7:int = SystemChatStyleEnum.NORMAL;
            if (((this._Str_20898()) && (!(this._chatStyleSelector == null))))
            {
                _local_7 = this._chatStyleSelector._Str_22824;
            }
            if (this._widget != null)
            {
                if (this._typingTimer.running)
                {
                    this._typingTimer.reset();
                }
                if (this._idleTimer.running)
                {
                    this._idleTimer.reset();
                }
                this._widget._Str_25042(_local_3, _local_2, _local_5, _local_7);
                this._isTyping = false;
                if (this._typingStartedSent)
                {
                    this._Str_17137();
                }
                this._typingStartedSent = false;
            }
            if (this._inputField != null)
            {
                this._inputField.text = _local_6;
            }
            this._lastContent = _local_6;
        }

        private function _Str_25460():Boolean
        {
            var _local_2:Stage;
            var _local_3:InteractiveObject;
            if (this._inputField != null)
            {
                if (this._inputField.focused)
                {
                    return false;
                }
            }
            var k:DisplayObject = this._chatInputContainerWindow.context.getDesktopWindow().getDisplayObject();
            if (k != null)
            {
                _local_2 = k.stage;
                if (_local_2 != null)
                {
                    _local_3 = _local_2.focus;
                    if (_local_3 == null)
                    {
                        return false;
                    }
                    if ((_local_3 is TextField))
                    {
                        return true;
                    }
                }
            }
            return false;
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return this._widget.handler.container.sessionDataManager;
        }

        private function _Str_24580(k:Array):void
        {
            var _local_3:int;
            if (!this._chatStyleSelector)
            {
                this._chatStyleSelector = new ChatStyleSelector(this, IWindowContainer(this._chatInputContainerWindow.findChildByName("styles")), this.sessionDataManager);
                this._chatStyleSelector._Str_22746 = ((k.length / 6) + 1);
            }
            var _local_2:int = (k.length - 1);
            while (_local_2 >= 0)
            {
                _local_3 = k[_local_2];
                this._chatStyleSelector._Str_2822(_local_3, this._widget.handler.container.freeFlowChat.chatStyleLibrary.getStyle(_local_3).selectorPreview);
                _local_2--;
            }
            this._chatStyleSelector._Str_24820();
        }

        public function get widget():RoomChatInputWidget
        {
            return this._widget;
        }

        public function get _Str_22667():IWindowContainer
        {
            return this._chatStyleSelectorMenuContainer;
        }

        public function getChatInputY():int
        {
            if (((!(this._window)) || (!(this._window.findChildByName("chat_input_container")))))
            {
                return 0;
            }
            var k:Point = new Point();
            this._window.findChildByName("chat_input_container").getGlobalPosition(k);
            return k.y;
        }

        public function _Str_25675():Array
        {
            return [this._chatInputContainerWindow, this._inputField];
        }

        private function _Str_8782(k:WindowMouseEvent):void
        {
            if (k.type == WindowMouseEvent.CLICK)
            {
                this._widget._Str_13265.context.createLinkEvent(_Str_16188);
            }
            if (k.type == WindowMouseEvent.OVER)
            {
                this._helpButton.visible = true;
                this._mouseOverHelpButton = true;
                this._Str_13977();
            }
            else
            {
                if (k.type == WindowMouseEvent.OUT)
                {
                    this._mouseOverHelpButton = false;
                    this._Str_21882();
                }
            }
        }

        private function _Str_6563(k:WindowMouseEvent):void
        {
            if (k.type == WindowMouseEvent.OVER)
            {
                this._helpButton.visible = true;
                this._Str_13977();
            }
            else
            {
                if (((k.type == WindowMouseEvent.OUT) && (!(this._mouseOverHelpButton))))
                {
                    this._Str_21882();
                }
            }
        }

        private function _Str_21882():void
        {
            if (this._helpButtonHideTimer != null)
            {
                this._Str_13977();
            }
            this._helpButtonHideTimer = new Timer(400);
            this._helpButtonHideTimer.addEventListener(TimerEvent.TIMER, this._Str_22017);
            this._helpButtonHideTimer.start();
        }

        private function _Str_22017(k:TimerEvent):void
        {
            if (((!(this._mouseOverHelpButton)) && (this._helpButton)))
            {
                this._helpButton.visible = false;
            }
            this._Str_13977();
        }

        private function _Str_13977():void
        {
            if (!this._helpButtonHideTimer)
            {
                return;
            }
            this._helpButtonHideTimer.stop();
            this._helpButtonHideTimer.removeEventListener(TimerEvent.TIMER, this._Str_22017);
            this._helpButtonHideTimer = null;
        }
    }
}
