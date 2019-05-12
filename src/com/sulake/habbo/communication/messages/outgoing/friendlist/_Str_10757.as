package com.sulake.habbo.communication.messages.outgoing.friendlist
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class _Str_10757 implements IMessageComposer 
    {
        private var _Str_5549:String;

        public function _Str_10757(k:String)
        {
            this._Str_5549 = k;
        }

        public function getMessageArray():Array
        {
            return [this._Str_5549];
        }

        public function dispose():void
        {
            this._Str_5549 = null;
        }
    }
}
