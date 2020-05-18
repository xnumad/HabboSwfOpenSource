package com.sulake.habbo.communication.messages.parser.preferences
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
        private var _roomCameraFollowDisabled:Boolean;
        private var _uiFlags:int;
        private var _preferedChatStyle:int;


        public function get traxVolume():int
        {
            return this._traxVolume;
        }

        public function get furniVolume():int
        {
            return this._furniVolume;
        }

        public function get uiVolume():int
        {
            return this._uiVolume;
        }

        public function get freeFlowChatDisabled():Boolean
        {
            return this._freeFlowChatDisabled;
        }

        public function get roomInvitesIgnored():Boolean
        {
            return this._roomInvitesIgnored;
        }

        public function get roomCameraFollowDisabled():Boolean
        {
            return this._roomCameraFollowDisabled;
        }

        public function get uiFlags():int
        {
            return this._uiFlags;
        }

        public function get preferedChatStyle():int
        {
            return this._preferedChatStyle;
        }

        public function flush():Boolean
        {
            this._freeFlowChatDisabled = false;
            this._roomCameraFollowDisabled = false;
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
            this._roomCameraFollowDisabled = k.readBoolean();
            this._uiFlags = k.readInteger();
            this._preferedChatStyle = k.readInteger();
            return true;
        }
    }
}
