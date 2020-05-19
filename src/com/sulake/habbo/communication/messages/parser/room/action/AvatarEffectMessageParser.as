package com.sulake.habbo.communication.messages.parser.room.action
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class AvatarEffectMessageParser implements IMessageParser 
    {
        private var _userId:int = 0;
        private var _effectId:int = 0;
        private var _delayMilliSeconds:int = 0;


        public function get userId():int
        {
            return this._userId;
        }

        public function get effectId():int
        {
            return this._effectId;
        }

        public function get delayMilliSeconds():int
        {
            return this._delayMilliSeconds;
        }

        public function flush():Boolean
        {
            this._userId = 0;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            if (k == null)
            {
                return false;
            }
            this._userId = k.readInteger();
            this._effectId = k.readInteger();
            this._delayMilliSeconds = k.readInteger();
            return true;
        }
    }
}
