package com.sulake.habbo.communication.messages.parser.navigator
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class RoomThumbnailUpdateResultMessageParser implements IMessageParser
    {
        private var _flatId:int;
        private var _resultCode:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._flatId = k.readInteger();
            this._resultCode = k.readInteger();
            return true;
        }

        public function get flatId():int
        {
            return this._flatId;
        }

        public function get resultCode():int
        {
            return this._resultCode;
        }
    }
}
