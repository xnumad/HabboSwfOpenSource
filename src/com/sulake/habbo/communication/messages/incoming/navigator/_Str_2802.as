package com.sulake.habbo.communication.messages.incoming.navigator
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_2802 
    {
        private var _Str_19281:int;
        private var _Str_18480:String;
        private var _visible:Boolean;
        private var _Str_20025:Boolean;
        private var _Str_21646:String;
        private var _Str_13882:String;
        private var _Str_22231:Boolean;

        public function _Str_2802(k:IMessageDataWrapper)
        {
            this._Str_19281 = k.readInteger();
            this._Str_18480 = k.readString();
            this._visible = k.readBoolean();
            this._Str_20025 = k.readBoolean();
            this._Str_21646 = k.readString();
            this._Str_13882 = k.readString();
            this._Str_22231 = k.readBoolean();
        }

        public function get _Str_4760():int
        {
            return this._Str_19281;
        }

        public function get _Str_20353():String
        {
            return this._Str_18480;
        }

        public function get visible():Boolean
        {
            return this._visible;
        }

        public function get _Str_15540():Boolean
        {
            return this._Str_20025;
        }

        public function get _Str_13024():Boolean
        {
            return this._Str_22231;
        }

        public function get _Str_26018():String
        {
            return this._Str_21646;
        }

        public function get _Str_26359():String
        {
            return this._Str_13882;
        }

        public function get _Str_14718():String
        {
            return (this._Str_13882 == "") ? this._Str_18480 : (("${navigator.flatcategory.global." + this._Str_13882) + "}");
        }
    }
}
