package com.sulake.habbo.communication.messages.outgoing.landingview
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class GetPromoArticlesComposer implements IMessageComposer, IDisposable
    {


        public function getMessageArray():Array
        {
            return [];
        }

        public function dispose():void
        {
        }

        public function get disposed():Boolean
        {
            return false;
        }
    }
}
