package com.sulake.habbo.ui.widget.roomtools
{
    import com.sulake.habbo.ui.widget.RoomWidgetBase;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
    import com.sulake.habbo.ui.IRoomDesktop;
    import com.sulake.habbo.freeflowchat.IHabboFreeFlowChat;
    import flash.utils.Timer;
    import org.openvideoads.util.StringUtils;
    import com.sulake.habbo.communication.enum.perk.PerkEnum;
    import com.sulake.habbo.session.UIFlags;
    import com.sulake.habbo.ui.IRoomWidgetHandler;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.habbo.ui.RoomUI;
    import flash.events.TimerEvent;
    import com.sulake.habbo.ui.handler.RoomToolsWidgetHandler;
    import com.sulake.core.window.IWindow;
    import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
    import com.sulake.habbo.ui.widget.chatinput.RoomChatInputWidget;
    import __AS3__.vec.*;

    public class RoomToolsWidget extends RoomWidgetBase
    {
        private static const ROOM_HISTORY_MAX_LENGTH:int = 10;
        private static var _visitedRooms:Vector.<GuestRoomData> = new Vector.<GuestRoomData>();
        private static var _currentRoomIndex:int;

        private var _currentRoomName:String = "";
        private var _toolbarView:RoomToolsToolbarCtrl;
        private var _roomToolsInfoCtrl:RoomToolsInfoCtrl;
        private var _desktop:IRoomDesktop;
        private var _freeFlowChat:IHabboFreeFlowChat;
        private var _roomButtonTimer:Timer;

        public function RoomToolsWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:RoomUI)
        {
            super(k, _arg_2, _arg_3, _arg_4.localization);
            this.handler.widget = this;
            this._desktop = _arg_4.getDesktop("hard_coded_room_id");
            this._freeFlowChat = _arg_4.freeFlowChat;
            this._roomToolsInfoCtrl = new RoomToolsInfoCtrl(this, _arg_2, _arg_3);
            this._toolbarView = new RoomToolsToolbarCtrl(this, _arg_2, _arg_3);
            this._toolbarView._Str_20713();
            this._toolbarView._Str_24545(((!(this._freeFlowChat)) || (!(this._freeFlowChat.isDisabledInPreferences))));
            var _local_5:String = _arg_4.getProperty("camera.launch.ui.position");
            this._toolbarView._Str_23347(((this.handler.container.sessionDataManager.isPerkAllowed(PerkEnum.CAMERA)) && ((StringUtils.isEmpty(_local_5)) || (_local_5 == "room-menu"))));
            this._toolbarView._Str_21132(this.handler._Str_5090);
            this._toolbarView.setCollapsed(((this.handler.sessionDataManager.isNoob) || (!(this.handler.sessionDataManager.uiFlags & UIFlags.ROOM_TOOLS_OPEN))));
        }

        override public function dispose():void
        {
            if (this._roomButtonTimer)
            {
                this._roomButtonTimer.stop();
                this._roomButtonTimer = null;
            }
            if (this._toolbarView)
            {
                this._toolbarView.dispose();
                this._toolbarView = null;
            }
            if (this._roomToolsInfoCtrl)
            {
                this._roomToolsInfoCtrl.dispose();
                this._roomToolsInfoCtrl = null;
            }
            this._freeFlowChat = null;
            this._desktop = null;
            super.dispose();
        }

        public function updateRoomData(k:GuestRoomData):void
        {
            var _local_2:GuestRoomData;
            for each (_local_2 in _visitedRooms)
            {
                if (_local_2.flatId == k.flatId)
                {
                    _local_2.roomName = k.roomName;
                }
            }
        }

        public function storeRoomData(k:GuestRoomData):void
        {
            var _local_2:GuestRoomData;
            for each (_local_2 in _visitedRooms)
            {
                if (_local_2.flatId == k.flatId)
                {
                    return;
                }
            }
            _visitedRooms.push(k);
            if (_visitedRooms.length > ROOM_HISTORY_MAX_LENGTH)
            {
                _visitedRooms.shift();
            }
            _currentRoomIndex = (_visitedRooms.length - 1);
            if (this._toolbarView)
            {
                this._toolbarView._Str_21132(this.handler._Str_5090);
            }
        }

        public function showRoomInfo(k:Boolean, _arg_2:String, _arg_3:String, _arg_4:Array):void
        {
            if (!this._roomToolsInfoCtrl)
            {
                return;
            }
            this._currentRoomName = _arg_2;
            this._roomToolsInfoCtrl.showRoomInfo(k, _arg_2, _arg_3, _arg_4);
        }

        public function enterNewRoom(k:int):void
        {
            var _local_3:GuestRoomData;
            if (((!(this._toolbarView)) || (!(this._roomToolsInfoCtrl))))
            {
                return;
            }
            var _local_2:int;
            for each (_local_3 in _visitedRooms)
            {
                if (_local_3.flatId == k)
                {
                    _currentRoomIndex = _local_2;
                }
                _local_2++;
            }
            this._toolbarView._Str_18755();
            if (this._roomButtonTimer != null)
            {
                this._roomButtonTimer.stop();
            }
            this._roomButtonTimer = new Timer(2000, 1);
            this._roomButtonTimer.addEventListener(TimerEvent.TIMER, this.roomButtonTimerEventHandler);
            this._roomButtonTimer.start();
            this._roomToolsInfoCtrl.setElementVisible("tags", true);
        }

        private function roomButtonTimerEventHandler(k:TimerEvent):void
        {
            var _local_2:Timer = (k.target as Timer);
            if (_local_2)
            {
                _local_2.stop();
                _local_2.removeEventListener(TimerEvent.TIMER, this.roomButtonTimerEventHandler);
            }
            if (this._toolbarView)
            {
                this._toolbarView._Str_20713();
            }
        }

        public function setCollapsed(k:Boolean):void
        {
            if (this._toolbarView)
            {
                this._toolbarView.setCollapsed(k);
            }
            if (this._roomToolsInfoCtrl)
            {
                this._roomToolsInfoCtrl.setToolbarCollapsed(k);
            }
        }

        public function get handler():RoomToolsWidgetHandler
        {
            return _handler as RoomToolsWidgetHandler;
        }

        public function getIconLocation(k:String):IWindow
        {
            var _local_2:IWindow = this._toolbarView.window.findChildByName(k);
            return _local_2;
        }

        public function _Str_24850():int
        {
            return (this._toolbarView) ? this._toolbarView.right : 0;
        }

        public function getChatInputY():int
        {
            if (!this._desktop)
            {
                return 0;
            }
            var k:RoomChatInputWidget = (this._desktop.getWidget(RoomWidgetEnum.CHAT_INPUT_WIDGET) as RoomChatInputWidget);
            if (!k)
            {
                return 0;
            }
            return k.getChatInputY();
        }

        public function getRoomToolbarRight():int
        {
            return (this._toolbarView) ? this._toolbarView.right : 0;
        }

        public function goToNextRoom():void
        {
            var k:int = (_currentRoomIndex + 1);
            var _local_2:int = _visitedRooms.length;
            if (k > _local_2)
            {
                k = _local_2;
            }
            this.handler.goToPrivateRoom(_visitedRooms[k].flatId);
            this._toolbarView._Str_18755();
        }

        public function goToPreviousRoom():void
        {
            var k:int = (_currentRoomIndex - 1);
            if (k < 0)
            {
                k = 0;
            }
            this.handler.goToPrivateRoom(_visitedRooms[k].flatId);
            this._toolbarView._Str_18755();
        }

        public function get freeFlowChat():IHabboFreeFlowChat
        {
            return this._freeFlowChat;
        }

        public function get visitedRooms():Vector.<GuestRoomData>
        {
            return _visitedRooms;
        }

        public function get currentRoomIndex():int
        {
            return _currentRoomIndex;
        }

        public function get _Str_26110():String
        {
            return this._currentRoomName;
        }
    }
}
