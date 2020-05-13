package com.sulake.habbo.communication.messages.outgoing.campaign
{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class OpenCampaignCalendarDoorAsStaffComposer implements IMessageComposer, IDisposable 
    {
        private var _array:Array;

        public function OpenCampaignCalendarDoorAsStaffComposer(k:String, _arg_2:int)
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
