package com.sulake.habbo.communication.messages.parser.callforhelp
{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_7692 implements IMessageParser 
    {
        private var _Str_21269:Boolean;
        private var _Str_20966:Boolean;
        private var _Str_19378:String;
        private var _Str_19998:int;
        private var _Str_21197:String;
        private var _Str_20631:String;
        private var _Str_19322:int;
        private var _Str_22000:String;
        private var _Str_19157:int;
        private var _Str_21458:Boolean;
        private var _Str_22154:String;


        public function flush():Boolean
        {
            return true;
        }

        public function parse(k:IMessageDataWrapper):Boolean
        {
            this._Str_21269 = k.readBoolean();
            this._Str_20966 = k.readBoolean();
            this._Str_19378 = k.readString();
            this._Str_19998 = k.readInteger();
            k.readInteger();
            this._Str_21197 = k.readString();
            this._Str_20631 = k.readString();
            this._Str_19322 = k.readInteger();
            this._Str_22000 = k.readString();
            this._Str_19157 = k.readInteger();
            k.readInteger();
            this._Str_21458 = k.readBoolean();
            if (k.bytesAvailable)
            {
                this._Str_22154 = k.readString();
            }
            return true;
        }

        public function get _Str_22957():Boolean
        {
            return this._Str_21269;
        }

        public function get _Str_16442():Boolean
        {
            return this._Str_20966;
        }

        public function get _Str_22691():String
        {
            return this._Str_19378;
        }

        public function get _Str_22497():int
        {
            return this._Str_19998;
        }

        public function get _Str_22005():String
        {
            return this._Str_21197;
        }

        public function get _Str_25720():String
        {
            return this._Str_20631;
        }

        public function get _Str_20904():int
        {
            return this._Str_19322;
        }

        public function get _Str_23024():String
        {
            return this._Str_22000;
        }

        public function get _Str_23610():int
        {
            return this._Str_19157;
        }

        public function get _Str_23177():Boolean
        {
            return this._Str_21458;
        }

        public function get _Str_21248():String
        {
            return this._Str_22154;
        }
    }
}
