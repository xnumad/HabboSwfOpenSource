package com.sulake.habbo.communication.messages.parser.room.permissions
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_8378 implements IMessageParser 
    {
        private var _roomControllerLevel:int = 0;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._roomControllerLevel = k.readInteger();
            return true;
        }

        public function get roomControllerLevel():int
        {
            return this._roomControllerLevel;
        }
    }
}
