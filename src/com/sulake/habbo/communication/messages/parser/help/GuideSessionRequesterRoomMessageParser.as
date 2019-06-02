package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class GuideSessionRequesterRoomMessageParser implements IMessageParser 
    {
        private var _requesterRoomId:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._requesterRoomId = k.readInteger();
            return true;
        }

        public function getRequesterRoomId():int
        {
            return this._requesterRoomId;
        }
    }
}
