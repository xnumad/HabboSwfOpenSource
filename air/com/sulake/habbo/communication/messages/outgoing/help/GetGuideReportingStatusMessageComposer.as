//com.sulake.habbo.communication.messages.outgoing.help.GetGuideReportingStatusMessageComposer

package com.sulake.habbo.communication.messages.outgoing.help{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class GetGuideReportingStatusMessageComposer implements IMessageComposer {

        public function GetGuideReportingStatusMessageComposer();

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.help

