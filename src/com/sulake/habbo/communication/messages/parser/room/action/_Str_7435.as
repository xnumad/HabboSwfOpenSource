package com.sulake.habbo.communication.messages.parser.room.action
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7435 implements IMessageParser 
    {
        private var _userId:int = 0;
        private var _mouseHighlight:int = -1;


        public function get userId():int
        {
            return this._userId;
        }

        public function get expressionType():int
        {
            return this._mouseHighlight;
        }

        public function flush():Boolean
        {
            this._userId = 0;
            this._mouseHighlight = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._userId = k.readInteger();
            this._mouseHighlight = k.readInteger();
            return true;
        }
    }
}
