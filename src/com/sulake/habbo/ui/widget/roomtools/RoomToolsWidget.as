package com.sulake.habbo.ui.widget.roomtools
{
    import com.sulake.habbo.ui.widget.ConversionTrackingWidget;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.communication.messages.incoming.navigator._Str_2370;
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

    public class RoomToolsWidget extends ConversionTrackingWidget 
    {
        private static const _Str_18581:int = 10;
        private static var _Str_4498:Vector.<_Str_2370> = new Vector.<_Str_2370>();
        private static var _Str_7037:int;

        private var _Str_19410:String = "";
        private var _Str_2617:RoomToolsToolbarCtrl;
        private var _roomToolsInfoCtrl:RoomToolsInfoCtrl;
        private var _Str_4242:IRoomDesktop;
        private var _freeFlowChat:IHabboFreeFlowChat;
        private var _Str_6811:Timer;

        public function RoomToolsWidget(k:IRoomWidgetHandler, _arg_2:IHabboWindowManager, _arg_3:IAssetLibrary, _arg_4:RoomUI)
        {
            super(k, _arg_2, _arg_3, _arg_4.localization);
            this.handler.widget = this;
            this._Str_4242 = _arg_4.getDesktop("hard_coded_room_id");
            this._freeFlowChat = _arg_4.freeFlowChat;
            this._roomToolsInfoCtrl = new RoomToolsInfoCtrl(this, _arg_2, _arg_3);
            this._Str_2617 = new RoomToolsToolbarCtrl(this, _arg_2, _arg_3);
            this._Str_2617._Str_20713();
            this._Str_2617._Str_24545(((!(this._freeFlowChat)) || (!(this._freeFlowChat.isDisabledInPreferences))));
            var _local_5:String = _arg_4.getProperty("camera.launch.ui.position");
            this._Str_2617._Str_23347(((this.handler.container.sessionDataManager.isPerkAllowed(PerkEnum.CAMERA)) && ((StringUtils.isEmpty(_local_5)) || (_local_5 == "room-menu"))));
            this._Str_2617._Str_21132(this.handler._Str_5090);
            this._Str_2617.setCollapsed(((this.handler.sessionDataManager.nameChangeAllowed) || (!(this.handler.sessionDataManager._Str_8444 & UIFlags._Str_13691))));
        }

        override public function dispose():void
        {
            if (this._Str_6811)
            {
                this._Str_6811.stop();
                this._Str_6811 = null;
            }
            if (this._Str_2617)
            {
                this._Str_2617.dispose();
                this._Str_2617 = null;
            }
            if (this._roomToolsInfoCtrl)
            {
                this._roomToolsInfoCtrl.dispose();
                this._roomToolsInfoCtrl = null;
            }
            this._freeFlowChat = null;
            this._Str_4242 = null;
            super.dispose();
        }

        public function _Str_23062(k:_Str_2370):void
        {
            var _local_2:_Str_2370;
            for each (_local_2 in _Str_4498)
            {
                if (_local_2.flatId == k.flatId)
                {
                    _local_2.roomName = k.roomName;
                }
            }
        }

        public function _Str_22970(k:_Str_2370):void
        {
            var _local_2:_Str_2370;
            for each (_local_2 in _Str_4498)
            {
                if (_local_2.flatId == k.flatId)
                {
                    return;
                }
            }
            _Str_4498.push(k);
            if (_Str_4498.length > _Str_18581)
            {
                _Str_4498.shift();
            }
            _Str_7037 = (_Str_4498.length - 1);
            if (this._Str_2617)
            {
                this._Str_2617._Str_21132(this.handler._Str_5090);
            }
        }

        public function _Str_15920(k:Boolean, _arg_2:String, _arg_3:String, _arg_4:Array):void
        {
            if (!this._roomToolsInfoCtrl)
            {
                return;
            }
            this._Str_19410 = _arg_2;
            this._roomToolsInfoCtrl._Str_15920(k, _arg_2, _arg_3, _arg_4);
        }

        public function _Str_23696(k:int):void
        {
            var _local_3:_Str_2370;
            if (((!(this._Str_2617)) || (!(this._roomToolsInfoCtrl))))
            {
                return;
            }
            var _local_2:int;
            for each (_local_3 in _Str_4498)
            {
                if (_local_3.flatId == k)
                {
                    _Str_7037 = _local_2;
                }
                _local_2++;
            }
            this._Str_2617._Str_18755();
            if (this._Str_6811 != null)
            {
                this._Str_6811.stop();
            }
            this._Str_6811 = new Timer(2000, 1);
            this._Str_6811.addEventListener(TimerEvent.TIMER, this._Str_21420);
            this._Str_6811.start();
            this._roomToolsInfoCtrl.setElementVisible("tags", true);
        }

        private function _Str_21420(k:TimerEvent):void
        {
            var _local_2:Timer = (k.target as Timer);
            if (_local_2)
            {
                _local_2.stop();
                _local_2.removeEventListener(TimerEvent.TIMER, this._Str_21420);
            }
            if (this._Str_2617)
            {
                this._Str_2617._Str_20713();
            }
        }

        public function setCollapsed(k:Boolean):void
        {
            if (this._Str_2617)
            {
                this._Str_2617.setCollapsed(k);
            }
            if (this._roomToolsInfoCtrl)
            {
                this._roomToolsInfoCtrl._Str_23422(k);
            }
        }

        public function get handler():RoomToolsWidgetHandler
        {
            return _Str_2470 as RoomToolsWidgetHandler;
        }

        public function getIconLocation(k:String):IWindow
        {
            var _local_2:IWindow = this._Str_2617.window.findChildByName(k);
            return _local_2;
        }

        public function _Str_24850():int
        {
            return (this._Str_2617) ? this._Str_2617.right : 0;
        }

        public function getChatInputY():int
        {
            if (!this._Str_4242)
            {
                return 0;
            }
            var k:RoomChatInputWidget = (this._Str_4242._Str_11511(RoomWidgetEnum.CHAT_INPUT_WIDGET) as RoomChatInputWidget);
            if (!k)
            {
                return 0;
            }
            return k.getChatInputY();
        }

        public function getRoomToolbarRight():int
        {
            return (this._Str_2617) ? this._Str_2617.right : 0;
        }

        public function goToNextRoom():void
        {
            var k:int = (_Str_7037 + 1);
            var _local_2:int = _Str_4498.length;
            if (k > _local_2)
            {
                k = _local_2;
            }
            this.handler.goToPrivateRoom(_Str_4498[k].flatId);
            this._Str_2617._Str_18755();
        }

        public function goToPreviousRoom():void
        {
            var k:int = (_Str_7037 - 1);
            if (k < 0)
            {
                k = 0;
            }
            this.handler.goToPrivateRoom(_Str_4498[k].flatId);
            this._Str_2617._Str_18755();
        }

        public function get freeFlowChat():IHabboFreeFlowChat
        {
            return this._freeFlowChat;
        }

        public function get visitedRooms():Vector.<_Str_2370>
        {
            return _Str_4498;
        }

        public function get currentRoomIndex():int
        {
            return _Str_7037;
        }

        public function get _Str_26110():String
        {
            return this._Str_19410;
        }
    }
}
