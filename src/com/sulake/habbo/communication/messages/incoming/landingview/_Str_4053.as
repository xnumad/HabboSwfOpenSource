package com.sulake.habbo.communication.messages.incoming.landingview
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_4053 
    {
        public static const _Str_15693:int = 0;
        public static const _Str_18301:int = 1;
        public static const _Str_17401:int = 2;

        private var _id:int;
        private var _title:String;
        private var _Str_20880:String;
        private var _Str_19063:String;
        private var _Str_20590:int;
        private var _Str_20788:String;
        private var _imageUrl:String;

        public function _Str_4053(k:IMessageDataWrapper)
        {
            this._id = k.readInteger();
            this._title = k.readString();
            this._Str_20880 = k.readString();
            this._Str_19063 = k.readString();
            this._Str_20590 = k.readInteger();
            this._Str_20788 = k.readString();
            this._imageUrl = k.readString();
        }

        public function get id():int
        {
            return this._id;
        }

        public function get title():String
        {
            return this._title;
        }

        public function get _Str_23333():String
        {
            return this._Str_20880;
        }

        public function get _Str_22430():String
        {
            return this._Str_19063;
        }

        public function get _Str_18393():int
        {
            return this._Str_20590;
        }

        public function get _Str_18141():String
        {
            return this._Str_20788;
        }

        public function get imageUrl():String
        {
            return this._imageUrl;
        }
    }
}
