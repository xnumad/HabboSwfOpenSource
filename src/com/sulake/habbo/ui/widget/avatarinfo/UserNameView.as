package com.sulake.habbo.ui.widget.avatarinfo
{
    public class UserNameView extends AvatarContextInfoView 
    {
        public static const _Str_20705:uint = 4288528218;
        public static const _Str_20334:int = 8000;

        private var _objectId:int;
        private var _isGameRoomMode:Boolean;

        public function UserNameView(k:AvatarInfoWidget, _arg_2:Boolean=false)
        {
            super(k);
            this._isGameRoomMode = _arg_2;
        }

        public static function setup(k:UserNameView, _arg_2:int, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:int, _arg_7:uint=4288528218, _arg_8:int=8000):void
        {
            k._objectId = _arg_6;
            k._Str_12637 = _arg_8;
            AvatarContextInfoView.setup(k, _arg_2, _arg_3, _arg_4, _arg_5, false);
            k.window.color = _arg_7;
        }


        public function get _Str_1577():int
        {
            return this._objectId;
        }

        public function get _Str_23492():Boolean
        {
            return this._isGameRoomMode;
        }

        override public function get maximumBlend():Number
        {
            if (this._isGameRoomMode)
            {
                return 0.75;
            }
            return super.maximumBlend;
        }
    }
}
