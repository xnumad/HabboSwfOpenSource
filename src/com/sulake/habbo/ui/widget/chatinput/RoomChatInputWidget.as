package com.sulake.habbo.ui.widget.chatinput
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import flash.utils.Timer;
    import com.sulake.habbo.ui.RoomUI;
    import com.sulake.habbo.ui.IRoomDesktop;
    import com.sulake.habbo.ui.handler.ChatInputWidgetHandler;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import flash.utils.getTimer;
    import com.sulake.habbo.ui.widget.messages.RoomWidgetChatMessage;
    import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
    import com.sulake.habbo.ui.widget.events._Str_4831;
    import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateInfostandUserEvent;
    import com.sulake.habbo.ui.widget.events._Str_6300;
    import flash.events.IEventDispatcher;
    import flash.events.TimerEvent;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.roomtools.RoomToolsWidget;
    import com.sulake.core.window.IWindow;

    public class RoomChatInputWidget extends ConversionTrackingWidget 
    {
        private static const _Str_16319:int = 5000;

        private var _visualization:RoomChatInputView;
        private var _selectedUserName:String = "";
        private var _floodBlocked:Boolean = false;
        private var _releaseTimer:Timer = null;
        private var _lastPasteTime:int;
        private var _roomUi:RoomUI;
        private var _desktop:IRoomDesktop;

        public function RoomChatInputWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:IHabboLocalizationManager, _arg_5:RoomUI, _arg_6:IRoomDesktop)
        {
            super(k, _arg_2, _arg_3, _arg_4);
            this._roomUi = _arg_5;
            this._desktop = _arg_6;
            this._visualization = new RoomChatInputView(this);
            (k as ChatInputWidgetHandler).widget = this;
        }

        public function get _Str_21409():Boolean
        {
            return this._floodBlocked;
        }

        public function get _Str_13265():RoomUI
        {
            return this._roomUi;
        }

        public function get handler():ChatInputWidgetHandler
        {
            return _Str_2470 as ChatInputWidgetHandler;
        }

        override public function dispose():void
        {
            if (this._visualization != null)
            {
                this._visualization.dispose();
                this._visualization = null;
            }
            if (this._releaseTimer != null)
            {
                this._releaseTimer.stop();
                this._releaseTimer = null;
            }
            this._roomUi = null;
            super.dispose();
        }

        public function get _Str_24849():Boolean
        {
            return (getTimer() - this._lastPasteTime) > _Str_16319;
        }

        public function _Str_23495():void
        {
            this._lastPasteTime = getTimer();
        }

        public function _Str_25042(k:String, _arg_2:int, _arg_3:String="", _arg_4:int=0):void
        {
            if (this._floodBlocked)
            {
                return;
            }
            var _local_5:RoomWidgetChatMessage = new RoomWidgetChatMessage(RoomWidgetChatMessage.RWCM_MESSAGE_CHAT, k, _arg_2, _arg_3, _arg_4);
            if (messageListener != null)
            {
                messageListener.processWidgetMessage(_local_5);
            }
        }

        override public function registerUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.addEventListener(RoomWidgetRoomObjectUpdateEvent.OBJECT_DESELECTED, this._Str_20658);
            k.addEventListener(_Str_4831.RWWCIDE_CHAT_INPUT_CONTENT, this._Str_20741);
            k.addEventListener(RoomWidgetUpdateInfostandUserEvent.PEER, this._Str_3746);
            k.addEventListener(_Str_6300.RWFCE_FLOOD_CONTROL, this.onFloodControl);
            super.registerUpdateEvents(k);
        }

        override public function unregisterUpdateEvents(k:IEventDispatcher):void
        {
            if (k == null)
            {
                return;
            }
            k.removeEventListener(RoomWidgetRoomObjectUpdateEvent.OBJECT_DESELECTED, this._Str_20658);
            k.removeEventListener(_Str_4831.RWWCIDE_CHAT_INPUT_CONTENT, this._Str_20741);
            k.removeEventListener(RoomWidgetUpdateInfostandUserEvent.PEER, this._Str_3746);
            k.removeEventListener(_Str_6300.RWFCE_FLOOD_CONTROL, this.onFloodControl);
        }

        private function _Str_20658(k:RoomWidgetRoomObjectUpdateEvent):void
        {
            this._selectedUserName = "";
        }

        private function _Str_3746(k:RoomWidgetUpdateInfostandUserEvent):void
        {
            this._selectedUserName = k.name;
        }

        private function _Str_20741(k:_Str_4831):void
        {
            var _local_2:String = "";
            switch (k._Str_23621)
            {
                case _Str_4831.WHISPER:
                    _local_2 = localizations.getLocalization("widgets.chatinput.mode.whisper", ":tell");
                    this._visualization._Str_23022(_local_2, k.userName);
                    return;
                case _Str_4831.SHOUT:
                    return;
            }
        }

        private function onTimerComplete(k:TimerEvent):void
        {
            Logger.log("Releasing flood blocking");
            this._floodBlocked = false;
            if (this._visualization != null)
            {
                this._visualization._Str_22810();
            }
            this._releaseTimer = null;
        }

        private function onTimer(k:TimerEvent):void
        {
            if (this._visualization != null)
            {
                this._visualization._Str_22027((this._releaseTimer.repeatCount - this._releaseTimer.currentCount));
            }
        }

        public function _Str_24485():void
        {
            this._visualization._Str_3714(null);
        }

        public function _Str_24691():int
        {
            if (!this._roomUi._Str_16059)
            {
                return 1000;
            }
            return this._roomUi._Str_16059._Str_20387;
        }

        public function _Str_26449():int
        {
            if (!this._roomUi.toolbar)
            {
                return 1000;
            }
            return this._roomUi.toolbar.toolBarAreaWidth;
        }

        public function _Str_22730():int
        {
            var k:RoomToolsWidget = (this._desktop._Str_11511(RoomWidgetEnum.ROOM_TOOLS) as RoomToolsWidget);
            if (!k)
            {
                return 0;
            }
            return k._Str_24850();
        }

        public function get _Str_21568():String
        {
            return this._selectedUserName;
        }

        public function onFloodControl(k:_Str_6300):void
        {
            this._floodBlocked = true;
            Logger.log((("Enabling flood blocking for " + k.seconds) + " seconds"));
            if (this._releaseTimer)
            {
                this._releaseTimer.reset();
            }
            else
            {
                this._releaseTimer = new Timer(1000, k.seconds);
                this._releaseTimer.addEventListener(TimerEvent.TIMER, this.onTimer);
                this._releaseTimer.addEventListener(TimerEvent.TIMER_COMPLETE, this.onTimerComplete);
            }
            this._releaseTimer.start();
            if (this._visualization != null)
            {
                this._visualization._Str_22027(k.seconds);
                this._visualization._Str_22358();
            }
        }

        override public function get mainWindow():IWindow
        {
            return this._visualization.window;
        }

        public function hide():void
        {
            if (this.mainWindow)
            {
                this.mainWindow.visible = false;
            }
        }

        public function getChatInputY():int
        {
            return (this._visualization) ? this._visualization.getChatInputY() : 0;
        }

        public function _Str_23678():Array
        {
            var k:Array;
            if (this._visualization)
            {
                k = this._visualization._Str_25675();
            }
            return k;
        }
    }
}
