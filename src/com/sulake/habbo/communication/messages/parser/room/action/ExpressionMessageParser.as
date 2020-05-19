package com.sulake.habbo.communication.messages.parser.room.action
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ExpressionMessageParser implements IMessageParser 
    {
        private var _userId:int = 0;
        private var _expressionType:int = -1;


        public function get userId():int
        {
            return this._userId;
        }

        public function get expressionType():int
        {
            return this._expressionType;
        }

        public function flush():Boolean
        {
            this._userId = 0;
            this._expressionType = -1;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._userId = k.readInteger();
            this._expressionType = k.readInteger();
            return true;
        }
    }
}
