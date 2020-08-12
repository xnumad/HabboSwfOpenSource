package com.sulake.habbo.communication.messages.parser.talent
{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class TalentTrackRewardProduct
    {
        private var _productCode:String;
        private var _Str_22129:int;

        public function TalentTrackRewardProduct(k:IMessageDataWrapper)
        {
            this._productCode = k.readString();
            this._Str_22129 = k.readInteger();
        }

        public function get productCode():String
        {
            return this._productCode;
        }

        public function get _Str_13965():int
        {
            return this._Str_22129;
        }
    }
}
