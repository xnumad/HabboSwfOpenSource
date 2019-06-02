package com.sulake.habbo.communication.messages.parser.users
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_4007 implements IMessageParser 
    {
        public static const _Str_21428:int = 1;
        public static const _Str_12890:int = 2;
        public static const _Str_14729:int = 3;
        public static const _Str_15916:int = 4;

        private var _productName:String;
        private var _Str_19265:int;
        private var _Str_19345:int;
        private var _Str_19583:int;
        private var _Str_22116:int;
        private var _Str_19758:Boolean;
        private var _Str_6923:Boolean;
        private var _Str_11060:int;
        private var _Str_11826:int;
        private var _Str_6262:int;
        private var _Str_6888:int;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._productName = k.readString();
            this._Str_19265 = k.readInteger();
            this._Str_19345 = k.readInteger();
            this._Str_19583 = k.readInteger();
            this._Str_22116 = k.readInteger();
            this._Str_19758 = k.readBoolean();
            this._Str_6923 = k.readBoolean();
            this._Str_11060 = k.readInteger();
            this._Str_11826 = k.readInteger();
            this._Str_6262 = k.readInteger();
            if (k.bytesAvailable)
            {
                this._Str_6888 = k.readInteger();
            }
            return true;
        }

        public function get productName():String
        {
            return this._productName;
        }

        public function get _Str_14465():int
        {
            return this._Str_19265;
        }

        public function get _Str_23950():int
        {
            return this._Str_19345;
        }

        public function get _Str_17546():int
        {
            return this._Str_19583;
        }

        public function get _Str_9379():int
        {
            return this._Str_22116;
        }

        public function get _Str_24419():Boolean
        {
            return this._Str_19758;
        }

        public function get isVIP():Boolean
        {
            return this._Str_6923;
        }

        public function get pastClubDays():int
        {
            return this._Str_11060;
        }

        public function get pastVipDays():int
        {
            return this._Str_11826;
        }

        public function get minutesUntilExpiration():int
        {
            return this._Str_6262;
        }

        public function get _Str_6312():int
        {
            return this._Str_6888;
        }
    }
}
