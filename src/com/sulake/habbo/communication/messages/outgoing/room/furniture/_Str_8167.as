﻿package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_8167 implements IMessageComposer 
    {
        private var _itemId:int;
        private var _location:String;
        private var _message:String;
        private var _Str_3062:String;

        public function _Str_8167(k:int, _arg_2:String, _arg_3:String, _arg_4:String)
        {
            this._itemId = k;
            this._location = _arg_2;
            this._message = _arg_4;
            this._Str_3062 = _arg_3;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._itemId, this._location, this._Str_3062, this._message];
        }
    }
}
