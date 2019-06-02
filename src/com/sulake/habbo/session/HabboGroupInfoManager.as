package com.sulake.habbo.session
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.room.session._Str_3407;
    import com.sulake.habbo.communication.messages.incoming.users._Str_5458;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_10770;

    public class HabboGroupInfoManager implements IDisposable 
    {
        private var _sessionDataManager:SessionDataManager;
        private var _badges:Map;
        private var _roomReadyMessageEvent:IMessageEvent;
        private var _habboGroupBadgesMessageEvent:IMessageEvent;

        public function HabboGroupInfoManager(k:SessionDataManager)
        {
            this._sessionDataManager = k;
            this._badges = new Map();
            if (this._sessionDataManager.communication)
            {
                this._roomReadyMessageEvent = this._sessionDataManager.communication.addHabboConnectionMessageEvent(new _Str_3407(this._Str_5963));
                this._habboGroupBadgesMessageEvent = this._sessionDataManager.communication.addHabboConnectionMessageEvent(new _Str_5458(this._Str_18218));
            }
        }

        public function get disposed():Boolean
        {
            return this._sessionDataManager == null;
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            if (this._sessionDataManager.communication)
            {
                this._sessionDataManager.communication.removeHabboConnectionMessageEvent(this._roomReadyMessageEvent);
                this._sessionDataManager.communication.removeHabboConnectionMessageEvent(this._habboGroupBadgesMessageEvent);
            }
            this._badges = null;
            this._sessionDataManager = null;
        }

        private function _Str_5963(k:IMessageEvent):void
        {
            this._sessionDataManager.send(new _Str_10770());
        }

        private function _Str_18218(k:_Str_5458):void
        {
            var _local_3:int;
            var _local_2:Map = k.badges;
            var _local_4:int;
            while (_local_4 < _local_2.length)
            {
                _local_3 = _local_2.getKey(_local_4);
                this._badges.remove(_local_3);
                this._badges.add(_local_3, _local_2.getWithIndex(_local_4));
                _local_4++;
            }
        }

        public function getBadgeId(k:int):String
        {
            return this._badges.getValue(k);
        }
    }
}
