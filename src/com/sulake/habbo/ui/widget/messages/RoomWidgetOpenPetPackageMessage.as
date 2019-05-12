package com.sulake.habbo.ui.widget.messages
{
    public class RoomWidgetOpenPetPackageMessage extends RoomWidgetMessage 
    {
        public static const RWOPPM_OPEN_PET_PACKAGE:String = "RWOPPM_OPEN_PET_PACKAGE";

        private var _objectId:int;
        private var _name:String;

        public function RoomWidgetOpenPetPackageMessage(k:String, _arg_2:int, _arg_3:String)
        {
            super(k);
            this._objectId = _arg_2;
            this._name = _arg_3;
        }

        public function get _Str_1577():int
        {
            return this._objectId;
        }

        public function get name():String
        {
            return this._name;
        }
    }
}
