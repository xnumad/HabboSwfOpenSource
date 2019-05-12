package com.sulake.habbo.communication.messages.parser.quest
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class EpicPopupParser implements IMessageParser 
    {
        private var _Str_18748:String;


        public function flush():Boolean
        {
            this._Str_18748 = "";
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_18748 = k.readString();
            return true;
        }

        public function get _Str_24035():String
        {
            return this._Str_18748;
        }
    }
}
