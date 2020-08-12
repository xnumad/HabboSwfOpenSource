package com.sulake.habbo.communication.messages.outgoing.users
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class WelcomeGiftChangeEmailComposer implements IMessageComposer
    {
        private var _Str_6877:String;

        public function WelcomeGiftChangeEmailComposer(k:String)
        {
            this._Str_6877 = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            return [this._Str_6877];
        }
    }
}
