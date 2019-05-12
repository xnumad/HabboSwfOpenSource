package com.sulake.habbo.communication.messages.incoming.moderation
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5467 
    {
        private var _userId:int;
        private var _userName:String;
        private var _Str_19258:int;
        private var _Str_20876:int;
        private var _online:Boolean;
        private var _Str_21621:int;
        private var _Str_20013:int;
        private var _Str_20917:int;
        private var _Str_20349:int;
        private var _Str_21386:int;
        private var _Str_20848:String;
        private var _Str_21819:String;
        private var _Str_20982:int;
        private var _Str_19460:int;
        private var _Str_22254:String;
        private var _figure:String;
        private var _Str_20625:String;
        private var _Str_19116:String = "";
        private var _Str_20729:int = 0;

        public function _Str_5467(k:IMessageDataWrapper)
        {
            this._userId = k.readInteger();
            this._userName = k.readString();
            this._figure = k.readString();
            this._Str_19258 = k.readInteger();
            this._Str_20876 = k.readInteger();
            this._online = k.readBoolean();
            this._Str_21621 = k.readInteger();
            this._Str_20013 = k.readInteger();
            this._Str_20917 = k.readInteger();
            this._Str_20349 = k.readInteger();
            this._Str_21386 = k.readInteger();
            this._Str_20848 = k.readString();
            this._Str_21819 = k.readString();
            this._Str_20982 = k.readInteger();
            this._Str_19460 = k.readInteger();
            this._Str_22254 = k.readString();
            this._Str_20625 = k.readString();
            if (k.bytesAvailable)
            {
                this._Str_19116 = k.readString();
                this._Str_20729 = k.readInteger();
            }
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function get userName():String
        {
            return this._userName;
        }

        public function get figure():String
        {
            return this._figure;
        }

        public function get _Str_24334():int
        {
            return this._Str_19258;
        }

        public function get _Str_23276():int
        {
            return this._Str_20876;
        }

        public function get online():Boolean
        {
            return this._online;
        }

        public function get _Str_24656():int
        {
            return this._Str_21621;
        }

        public function get _Str_22987():int
        {
            return this._Str_20013;
        }

        public function get _Str_16987():int
        {
            return this._Str_20917;
        }

        public function get _Str_20373():int
        {
            return this._Str_20349;
        }

        public function get _Str_24526():int
        {
            return this._Str_21386;
        }

        public function get _Str_23969():String
        {
            return this._Str_20848;
        }

        public function get _Str_22786():String
        {
            return this._Str_21819;
        }

        public function get _Str_25657():int
        {
            return this._Str_20982;
        }

        public function get _Str_22700():int
        {
            return this._Str_19460;
        }

        public function get _Str_20219():String
        {
            return this._Str_22254;
        }

        public function get _Str_22262():String
        {
            return this._Str_20625;
        }

        public function get _Str_24447():String
        {
            return this._Str_19116;
        }

        public function get _Str_19137():int
        {
            return this._Str_20729;
        }
    }
}
