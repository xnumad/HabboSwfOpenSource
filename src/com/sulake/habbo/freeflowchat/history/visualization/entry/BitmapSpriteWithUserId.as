package com.sulake.habbo.freeflowchat.history.visualization.entry
{
    import flash.display.Bitmap;

    public class BitmapSpriteWithUserId extends Bitmap 
    {
        private var _userId:int;
        private var _roomId:int;
        private var _canIgnore:Boolean;
        private var _userName:String;


        public function get _Str_6123():Boolean
        {
            return this._canIgnore;
        }

        public function set _Str_6123(k:Boolean):void
        {
            this._canIgnore = k;
        }

        public function get userName():String
        {
            return this._userName;
        }

        public function set userName(k:String):void
        {
            this._userName = k;
        }

        public function get userId():int
        {
            return this._userId;
        }

        public function set userId(k:int):void
        {
            this._userId = k;
        }

        public function get roomId():int
        {
            return this._roomId;
        }

        public function set roomId(k:int):void
        {
            this._roomId = k;
        }
    }
}
