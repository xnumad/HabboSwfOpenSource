package com.sulake.habbo.communication.messages.outgoing.inventory.badges
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class RequestABadgeComposer implements IMessageComposer
    {
        private var _requestCode:String;

        public function RequestABadgeComposer(k:String)
        {
            this._requestCode = k;
        }

        public function dispose():void
        {
        }

        public function getMessageArray():Array
        {
            var k:Array = new Array();
            k.push(this._requestCode);
            return k;
        }
    }
}
