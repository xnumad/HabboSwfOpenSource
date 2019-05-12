package com.sulake.habbo.communication.messages.parser.room.camera
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_9206 implements IMessageParser 
    {
        private var _roomType:String = "";
        private var _roomId:int = 0;


        public function get roomType():String
        {
            return this._roomType;
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function flush():Boolean
        {
            this._roomType = "";
            this._roomId = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._roomType = k.readString();
            this._roomId = k.readInteger();
            return true;
        }
    }
}
