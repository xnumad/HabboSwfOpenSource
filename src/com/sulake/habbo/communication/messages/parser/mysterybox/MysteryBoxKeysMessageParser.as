package com.sulake.habbo.communication.messages.parser.mysterybox
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class MysteryBoxKeysMessageParser implements IMessageParser 
    {
        private var _boxColor:String;
        private var _keyColor:String;


        public function flush():Boolean
        {
            this._boxColor = null;
            this._keyColor = null;
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._boxColor = k.readString();
            this._keyColor = k.readString();
            return true;
        }

        public function get boxColor():String
        {
            return this._boxColor;
        }

        public function get keyColor():String
        {
            return this._keyColor;
        }
    }
}
