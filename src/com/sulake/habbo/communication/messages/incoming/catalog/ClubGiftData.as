package com.sulake.habbo.communication.messages.incoming.catalog
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class ClubGiftData
    {
        private var _offerId:int;
        private var _isVip:Boolean;
        private var _Str_693:Boolean;
        private var _Str_19803:int;

        public function ClubGiftData(k:IMessageDataWrapper)
        {
            this._offerId = k.readInteger();
            this._isVip = k.readBoolean();
            this._Str_19803 = k.readInteger();
            this._Str_693 = k.readBoolean();
        }

        public function get offerId():int
        {
            return this._offerId;
        }

        public function get _Str_12313():Boolean
        {
            return this._isVip;
        }

        public function get isSelectable():Boolean
        {
            return this._Str_693;
        }

        public function get _Str_21146():int
        {
            return this._Str_19803;
        }
    }
}
