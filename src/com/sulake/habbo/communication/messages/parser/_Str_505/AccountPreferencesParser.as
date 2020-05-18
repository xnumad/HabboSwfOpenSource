package com.sulake.habbo.communication.messages.parser._Str_505
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class AccountPreferencesParser implements IMessageParser 
    {
        private var _traxVolume:int;
        private var _furniVolume:int;
        private var _uiVolume:int;
        private var _freeFlowChatDisabled:Boolean;
        private var _roomInvitesIgnored:Boolean;
        private var _roomCameraFollowUser:Boolean;
        private var _uiFlags:int;
        private var _preferedChatStyle:int;


        public function get _Str_3410():int
        {
            return this._traxVolume;
        }

        public function get _Str_3488():int
        {
            return this._furniVolume;
        }

        public function get _Str_16610():int
        {
            return this._uiVolume;
        }

        public function get _Str_25556():Boolean
        {
            return this._freeFlowChatDisabled;
        }

        public function get _Str_22473():Boolean
        {
            return this._roomInvitesIgnored;
        }

        public function get roomCameraFollowUser():Boolean
        {
            return this._roomCameraFollowUser;
        }

        public function get _Str_8444():int
        {
            return this._uiFlags;
        }

        public function get _Str_6984():int
        {
            return this._preferedChatStyle;
        }

        public function flush():Boolean
        {
            this._freeFlowChatDisabled = false;
            this._roomCameraFollowUser = false;
            this._uiFlags = 0;
            this._preferedChatStyle = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._uiVolume = k.readInteger();
            this._furniVolume = k.readInteger();
            this._traxVolume = k.readInteger();
            this._freeFlowChatDisabled = k.readBoolean();
            this._roomInvitesIgnored = k.readBoolean();
            this._roomCameraFollowUser = k.readBoolean();
            this._uiFlags = k.readInteger();
            this._preferedChatStyle = k.readInteger();
            return true;
        }
    }
}
