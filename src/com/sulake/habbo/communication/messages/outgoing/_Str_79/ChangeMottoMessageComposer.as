package com.sulake.habbo.communication.messages.outgoing._Str_79
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class ChangeMottoMessageComposer implements IMessageComposer
    {
        private var _motto:String;

        public function ChangeMottoMessageComposer(k:String)
        {
            this._motto = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._motto];
        }
    }
}
