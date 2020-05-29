package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetCreditFurniRedeemMessage extends RoomWidgetMessage 
    {
        public static const RWFCRM_REDEEM:String = "RWFCRM_REDEEM";

        private var _objectId:int;

        public function RoomWidgetCreditFurniRedeemMessage(k:String, _arg_2:int)
        {
            super(k);
            this._objectId = _arg_2;
        }

        public function get objectId():int
        {
            return this._objectId;
        }
    }
}
