package com.sulake.habbo.communication.messages.parser.room.session
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7187 implements IMessageParser 
    {
        private var _isPlaying:Boolean = false;


        public function get isPlaying():Boolean
        {
            return this._isPlaying;
        }

        public function flush():Boolean
        {
            this._isPlaying = false;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._isPlaying = k.readBoolean();
            return true;
        }
    }
}
