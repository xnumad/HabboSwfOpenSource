package com.sulake.habbo.communication.messages.outgoing.tracking
{
    import com.sulake.core.communication.messages.IMessageComposer;

    public class LagWarningReportMessageComposer implements IMessageComposer 
    {
        private var _warningCount:int;

        public function LagWarningReportMessageComposer(k:int)
        {
            this._warningCount = k;
        }

        public function getMessageArray():Array
        {
            return [this._warningCount];
        }

        public function dispose():void
        {
        }
    }
}
