package com.sulake.habbo.session
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.incoming.users._Str_5459;
    import com.sulake.habbo.communication.messages.incoming.users._Str_9184;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_10288;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_5697;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_10793;
    import com.sulake.habbo.communication.messages.outgoing.users._Str_10785;

    public class IgnoredUsersManager implements IDisposable 
    {
        private var _sessionDataManager:SessionDataManager;
        private var _ignoreResultMessageEvent:IMessageEvent;
        private var _ignoredUsersMessageEvent:IMessageEvent;
        private var _ignoredUsers:Array;

        public function IgnoredUsersManager(k:SessionDataManager)
        {
            this._ignoredUsers = [];
            super();
            this._sessionDataManager = k;
            if (this._sessionDataManager.communication)
            {
                this._ignoreResultMessageEvent = this._sessionDataManager.communication.addHabboConnectionMessageEvent(new _Str_5459(this._Str_16085));
                this._ignoredUsersMessageEvent = this._sessionDataManager.communication.addHabboConnectionMessageEvent(new _Str_9184(this._Str_24424));
            }
        }

        public function dispose():void
        {
            if (this.disposed)
            {
                return;
            }
            if (this._sessionDataManager.communication)
            {
                this._sessionDataManager.communication.removeHabboConnectionMessageEvent(this._ignoreResultMessageEvent);
                this._sessionDataManager.communication.removeHabboConnectionMessageEvent(this._ignoredUsersMessageEvent);
            }
            this._ignoreResultMessageEvent = null;
            this._ignoredUsersMessageEvent = null;
            this._sessionDataManager = null;
        }

        public function _Str_25475():void
        {
            this._sessionDataManager.send(new _Str_10288(this._sessionDataManager.userName));
        }

        private function _Str_24424(k:_Str_9184):void
        {
            this._ignoredUsers = k._Str_16804;
        }

        private function _Str_16085(k:_Str_5459):void
        {
            var _local_2:String = k.name;
            switch (k.result)
            {
                case 0:
                    return;
                case 1:
                    this._Str_19721(_local_2);
                    return;
                case 2:
                    this._Str_19721(_local_2);
                    this._ignoredUsers.shift();
                    return;
                case 3:
                    this._Str_23631(_local_2);
                    return;
            }
        }

        private function _Str_19721(k:String):void
        {
            if (this._ignoredUsers.indexOf(k) < 0)
            {
                this._ignoredUsers.push(k);
            }
        }

        private function _Str_23631(k:String):void
        {
            var _local_2:int = this._ignoredUsers.indexOf(k);
            if (_local_2 >= 0)
            {
                this._ignoredUsers.splice(_local_2, 1);
            }
        }

        public function _Str_26106(k:int):void
        {
            this._sessionDataManager.send(new _Str_5697(k));
        }

        public function _Str_10249(k:String):void
        {
            this._sessionDataManager.send(new _Str_10793(k));
        }

        public function _Str_14353(k:String):void
        {
            this._sessionDataManager.send(new _Str_10785(k));
        }

        public function _Str_3655(k:String):Boolean
        {
            return this._ignoredUsers.indexOf(k) >= 0;
        }

        public function get disposed():Boolean
        {
            return this._sessionDataManager == null;
        }
    }
}
