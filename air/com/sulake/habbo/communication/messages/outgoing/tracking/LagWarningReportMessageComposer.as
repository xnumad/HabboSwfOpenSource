//com.sulake.habbo.communication.messages.outgoing.tracking.LagWarningReportMessageComposer

package com.sulake.habbo.communication.messages.outgoing.tracking{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class LagWarningReportMessageComposer implements IMessageComposer {

        private var _warningCount:int;

        public function LagWarningReportMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.tracking

