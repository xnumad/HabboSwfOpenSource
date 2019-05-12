package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuideSessionInvitedToGuideRoomMessageParser implements IMessageParser 
    {
        private var _roomId:int = 0;
        private var _roomName:String = "";


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._roomId = k.readInteger();
            this._roomName = k.readString();
            return true;
        }

        public function _Str_5256():int
        {
            return this._roomId;
        }

        public function _Str_22514():String
        {
            return this._roomName;
        }
    }
}
