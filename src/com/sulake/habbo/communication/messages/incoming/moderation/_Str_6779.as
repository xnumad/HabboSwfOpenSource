package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6779 
    {
        private var _timeStamp:String;
        private var _Str_20918:int;
        private var _Str_22073:String;
        private var _Str_5798:String;
        private var _Str_21220:Boolean;

        public function _Str_6779(k:IMessageDataWrapper)
        {
            this._timeStamp = k.readString();
            this._Str_20918 = k.readInteger();
            this._Str_22073 = k.readString();
            this._Str_5798 = k.readString();
            this._Str_21220 = k.readBoolean();
        }

        public function get timeStamp():String
        {
            return this._timeStamp;
        }

        public function get _Str_13143():int
        {
            return this._Str_20918;
        }

        public function get _Str_18796():String
        {
            return this._Str_22073;
        }

        public function get _Str_23429():String
        {
            return this._Str_5798;
        }

        public function get _Str_19967():Boolean
        {
            return this._Str_21220;
        }
    }
}
