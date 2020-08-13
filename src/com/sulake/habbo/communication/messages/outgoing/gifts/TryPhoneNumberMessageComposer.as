package com.sulake.habbo.communication.messages.outgoing.gifts
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class TryPhoneNumberMessageComposer implements IMessageComposer, IDisposable
    {
        public static const NO_ISSUE_ID:int = -1;

        private var _array:Array;

        public function TryPhoneNumberMessageComposer(k:String, _arg_2:String)
        {
            this._array = new Array();
            super();
            this._array.push(k);
            this._array.push(_arg_2);
        }

        public function getMessageArray():Array
        {
            return this._array;
        }

        public function dispose():void
        {
            this._array = null;
        }

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
