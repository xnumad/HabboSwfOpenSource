﻿package com.sulake.habbo.communication.messages.outgoing._Str_63
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10037 implements IMessageComposer 
    {
        private var _productCode:String;

        public function _Str_10037(k:String)
        {
            this._productCode = k;
        }

        public function getMessageArray():Array
        {
            return [this._productCode];
        }

        public function dispose():void
        {
            this._productCode = null;
        }
    }
}
