package com.sulake.habbo.roomevents
{
    import com.sulake.core.runtime.Component;
    import com.sulake.habbo.window.IHabboWindowManager;
    import com.sulake.habbo.communication.IHabboCommunicationManager;
    import com.sulake.habbo.localization.IHabboLocalizationManager;
    import com.sulake.habbo.roomevents.userdefinedroomevents.UserDefinedRoomEventsCtrl;
    import com.sulake.habbo.room.IRoomEngine;
    import com.sulake.habbo.session.IRoomSession;
    import com.sulake.habbo.session.ISessionDataManager;
    import com.sulake.core.runtime.IContext;
    import com.sulake.core.assets.IAssetLibrary;
    import com.sulake.core.runtime.ComponentDependency;
    import com.sulake.iid.IIDHabboCommunicationManager;
    import com.sulake.iid.IIDHabboWindowManager;
    import com.sulake.iid.IIDHabboLocalizationManager;
    import com.sulake.iid.IIDRoomEngine;
    import com.sulake.iid.IIDHabboRoomSessionManager;
    import com.sulake.habbo.session.events.RoomSessionEvent;
    import com.sulake.iid.IIDSessionDataManager;
    import __AS3__.vec.Vector;
    import com.sulake.habbo.room.IRoomEngineServices;
    import com.sulake.habbo.room.ISelectedRoomObjectData;
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.assets.IAsset;
    import com.sulake.core.assets.XmlAsset;
    import com.sulake.core.window.IWindow;
    import com.sulake.core.window.components.IBitmapWrapperWindow;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.core.assets.BitmapDataAsset;
    import flash.display.BitmapData;

    public class HabboUserDefinedRoomEvents extends Component implements IHabboUserDefinedRoomEvents 
    {
        private var _windowManager:IHabboWindowManager;
        private var _communication:IHabboCommunicationManager;
        private var _localization:IHabboLocalizationManager;
        private var _userDefinedRoomEventsCtrl:UserDefinedRoomEventsCtrl;
        private var _incomingMessages:IncomingMessages;
        private var _roomEngine:IRoomEngine;
        private var _roomSession:IRoomSession;
        private var _sessionDataManager:ISessionDataManager;
        private var _userName:String;

        public function HabboUserDefinedRoomEvents(k:IContext, _arg_2:uint=0, _arg_3:IAssetLibrary=null)
        {
            super(k, _arg_2, _arg_3);
            this._userDefinedRoomEventsCtrl = new UserDefinedRoomEventsCtrl(this);
        }

        public function get communication():IHabboCommunicationManager
        {
            return this._communication;
        }

        public function get windowManager():IHabboWindowManager
        {
            return this._windowManager;
        }

        public function get localization():IHabboLocalizationManager
        {
            return this._localization;
        }

        override protected function get dependencies():Vector.<ComponentDependency>
        {
            return (super.dependencies.concat(new <ComponentDependency>[new ComponentDependency(new IIDHabboCommunicationManager(), function (k:IHabboCommunicationManager):void
            {
                _communication = k;
            }), new ComponentDependency(new IIDHabboWindowManager(), function (k:IHabboWindowManager):void
            {
                _windowManager = k;
            }), new ComponentDependency(new IIDHabboLocalizationManager(), function (k:IHabboLocalizationManager):void
            {
                _localization = k;
            }), new ComponentDependency(new IIDRoomEngine(), function (k:IRoomEngine):void
            {
                _roomEngine = k;
            }), new ComponentDependency(new IIDHabboRoomSessionManager(), null, false, [{
                "type":RoomSessionEvent.CREATED,
                "callback":this._Str_3985
            }, {
                "type":RoomSessionEvent.STARTED,
                "callback":this._Str_3985
            }, {
                "type":RoomSessionEvent.ENDED,
                "callback":this._Str_3985
            }]), new ComponentDependency(new IIDSessionDataManager(), function (k:ISessionDataManager):void
            {
                _sessionDataManager = k;
            })]));
        }

        override protected function initComponent():void
        {
            this._incomingMessages = new IncomingMessages(this);
        }

        override public function dispose():void
        {
            if (disposed)
            {
                return;
            }
            if (this._incomingMessages != null)
            {
                this._incomingMessages.dispose();
                this._incomingMessages = null;
            }
            super.dispose();
        }

        public function _Str_15677(k:int, _arg_2:String):void
        {
            var _local_3:ISelectedRoomObjectData = (this._roomEngine as IRoomEngineServices).getPlacedObjectData(this.roomId);
            if (((_local_3) && (_local_3.id == -(k))))
            {
                (this._roomEngine as IRoomEngineServices).setPlacedObjectData(this.roomId, null);
                return;
            }
            this._userDefinedRoomEventsCtrl._Str_15677(k, _arg_2);
        }

        public function send(k:IMessageComposer, _arg_2:Boolean=false):void
        {
            this._communication.connection.send(k);
        }

        public function getXmlWindow(k:String):IWindow
        {
            var _local_3:IAsset;
            var _local_4:XmlAsset;
            var _local_2:IWindow;
            try
            {
                _local_3 = assets.getAssetByName((k + "_xml"));
                _local_4 = XmlAsset(_local_3);
                _local_2 = this._windowManager.buildFromXML(XML(_local_4.content));
            }
            catch(e:Error)
            {
            }
            return _local_2;
        }

        public function refreshButton(k:IWindowContainer, _arg_2:String, _arg_3:Boolean, _arg_4:Function, _arg_5:int, _arg_6:String=null):void
        {
            if (!_arg_6)
            {
                _arg_6 = _arg_2;
            }
            var _local_7:IBitmapWrapperWindow = (k.findChildByName(_arg_2) as IBitmapWrapperWindow);
            if (!_arg_3)
            {
                _local_7.visible = false;
            }
            else
            {
                this._Str_11416(_local_7, _arg_6, _arg_4, _arg_5);
                _local_7.visible = true;
            }
        }

        private function _Str_11416(k:IBitmapWrapperWindow, _arg_2:String, _arg_3:Function, _arg_4:int):void
        {
            k.id = _arg_4;
            k.procedure = _arg_3;
            if (k.bitmap != null)
            {
                return;
            }
            k.bitmap = this._Str_3122(_arg_2);
            k.width = k.bitmap.width;
            k.height = k.bitmap.height;
        }

        public function _Str_3122(k:String, _arg_2:String="_png"):BitmapData
        {
            var _local_3:String = (k + _arg_2);
            var _local_4:IAsset = assets.getAssetByName(_local_3);
            var _local_5:BitmapDataAsset = BitmapDataAsset(_local_4);
            var _local_6:BitmapData = BitmapData(_local_5.content);
            return _local_6.clone();
        }

        public function get _Str_7247():UserDefinedRoomEventsCtrl
        {
            return this._userDefinedRoomEventsCtrl;
        }

        public function get roomEngine():IRoomEngine
        {
            return this._roomEngine;
        }

        private function _Str_3985(k:RoomSessionEvent):void
        {
            if (this._roomEngine == null)
            {
                return;
            }
            switch (k.type)
            {
                case RoomSessionEvent.CREATED:
                case RoomSessionEvent.STARTED:
                case RoomSessionEvent.ENDED:
                    this._roomSession = k.session;
                    return;
            }
        }

        public function get roomId():int
        {
            return (this._roomSession) ? this._roomSession.roomId : 0;
        }

        public function get userName():String
        {
            return this._userName;
        }

        public function set userName(k:String):void
        {
            this._userName = k;
        }

        public function get sessionDataManager():ISessionDataManager
        {
            return this._sessionDataManager;
        }
    }
}
