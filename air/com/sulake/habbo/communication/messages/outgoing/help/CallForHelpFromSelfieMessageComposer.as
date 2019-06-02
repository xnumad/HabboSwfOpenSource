//com.sulake.habbo.communication.messages.outgoing.help.CallForHelpFromSelfieMessageComposer

package com.sulake.habbo.communication.messages.outgoing.help{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class CallForHelpFromSelfieMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function CallForHelpFromSelfieMessageComposer(k:String, _arg_2:int, _arg_3:int, _arg_4:String);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.help

