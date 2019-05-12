package com.sulake.habbo.communication.messages.incoming.friendlist
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_3696 
    {
        private var _Str_3764:int;
        private var _Str_20176:String;
        private var _Str_20869:String;
        private var _Str_22211:Boolean;
        private var _Str_22196:Boolean;
        private var _Str_20221:int;
        private var _Str_19188:String;
        private var _Str_25824:String;
        private var _realName:String;

        public function _Str_3696(k:IMessageDataWrapper)
        {
            this._Str_3764 = k.readInteger();
            this._Str_20176 = k.readString();
            this._Str_20869 = k.readString();
            this._Str_22211 = k.readBoolean();
            this._Str_22196 = k.readBoolean();
            k.readString();
            this._Str_20221 = k.readInteger();
            this._Str_19188 = k.readString();
            this._realName = k.readString();
        }

        public function get _Str_3251():int
        {
            return this._Str_3764;
        }

        public function get _Str_8751():String
        {
            return this._Str_20176;
        }

        public function get _Str_25898():String
        {
            return this._Str_20869;
        }

        public function get _Str_25717():Boolean
        {
            return this._Str_22211;
        }

        public function get _Str_26319():Boolean
        {
            return this._Str_22196;
        }

        public function get _Str_26027():int
        {
            return this._Str_20221;
        }

        public function get _Str_17102():String
        {
            return this._Str_19188;
        }

        public function get _Str_25904():String
        {
            return this._Str_25824;
        }

        public function get realName():String
        {
            return this._realName;
        }
    }
}
