package com.sulake.habbo.communication.messages.parser.help.data
{
    import com.sulake.habbo.help.enum._Str_2849;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class _Str_5959 
    {
        private var _type:int;
        private var _Str_21075:int;
        private var _Str_20671:Boolean;
        private var _Str_14628:String;
        private var _Str_14806:String;
        private var _description:String;
        private var _roomName:String;

        public function _Str_5959(k:IMessageDataWrapper):void
        {
            this._type = k.readInteger();
            this._Str_21075 = k.readInteger();
            this._Str_20671 = k.readBoolean();
            switch (this._type)
            {
                case _Str_2849._Str_4268:
                case _Str_2849._Str_4749:
                    this._Str_14628 = k.readString();
                    this._Str_14806 = k.readString();
                    return;
                case _Str_2849._Str_8260:
                    if (!this._Str_17256)
                    {
                        this._Str_14628 = k.readString();
                        this._Str_14806 = k.readString();
                        this._roomName = k.readString();
                    }
                    return;
                case _Str_2849._Str_7052:
                    this._Str_14628 = k.readString();
                    this._Str_14806 = k.readString();
                    this._description = k.readString();
                    return;
            }
        }

        public function get type():int
        {
            return this._type;
        }

        public function get _Str_20952():int
        {
            return this._Str_21075;
        }

        public function get _Str_17256():Boolean
        {
            return this._Str_20671;
        }

        public function get _Str_25260():String
        {
            return this._Str_14628;
        }

        public function get _Str_25026():String
        {
            return this._Str_14806;
        }

        public function get description():String
        {
            return this._description;
        }

        public function get roomName():String
        {
            return this._roomName;
        }
    }
}
