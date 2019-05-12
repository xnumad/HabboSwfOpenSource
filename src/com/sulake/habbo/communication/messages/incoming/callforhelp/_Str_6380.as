package com.sulake.habbo.communication.messages.incoming.callforhelp
{
    import com.sulake.habbo.communication.messages.incoming.moderation._Str_817;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_6380 implements _Str_817 
    {
        private var _name:String;
        private var _Str_17470:int;
        private var _Str_22477:int;
        private var _Str_16344:Boolean;
        private var _Str_17021:String = "";
        private var _Str_16444:String = "";

        public function _Str_6380(k:IMessageDataWrapper)
        {
            this._name = k.readString();
            this._Str_17470 = k.readInteger();
            this._Str_22477 = k.readInteger();
            this._Str_16344 = k.readBoolean();
            if (k.bytesAvailable)
            {
                this._Str_17021 = k.readString();
            }
            if (k.bytesAvailable)
            {
                this._Str_16444 = k.readString();
            }
            Logger.log(((((((((("READ CFH SANCTION TYPE: " + this._name) + ", length: ") + this._Str_17470) + ", avatar only: ") + this._Str_16344) + ", trade lock info: ") + this._Str_17021) + ", machine ban info: ") + this._Str_16444));
        }

        public function get name():String
        {
            return this._name;
        }

        public function get _Str_16119():int
        {
            return this._Str_17470;
        }

        public function get _Str_25147():Boolean
        {
            return this._Str_16344;
        }

        public function get _Str_20573():String
        {
            return this._Str_17021;
        }

        public function get _Str_19607():String
        {
            return this._Str_16444;
        }
    }
}
