package com.sulake.habbo.communication.messages.outgoing.gifts
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class SetPhoneNumberVerificationStatusMessageComposer implements IMessageComposer, IDisposable
    {
        public static const NO_ISSUE_ID:int = -1;

        private var _array:Array;

        public function SetPhoneNumberVerificationStatusMessageComposer(k:int)
        {
            this._array = new Array();
            super();
            this._array.push(k);
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
