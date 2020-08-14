package com.sulake.habbo.communication.messages.parser.help
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class CallForHelpDisabledNotifyMessageParser implements IMessageParser
    {
        private var _infoUrl:String;


        public function flush():Boolean
        {
            return false;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._infoUrl = k.readString();
            return true;
        }

        public function get _Str_23798():String
        {
            return this._infoUrl;
        }
    }
}
