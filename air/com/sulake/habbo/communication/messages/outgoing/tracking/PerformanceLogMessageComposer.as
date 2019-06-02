//com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer

package com.sulake.habbo.communication.messages.outgoing.tracking{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class PerformanceLogMessageComposer implements IMessageComposer {

        private var _array:Array;

        public function PerformanceLogMessageComposer(k:int, _arg_2:String, _arg_3:String, _arg_4:String, _arg_5:String, _arg_6:Boolean, _arg_7:int, _arg_8:int, _arg_9:int, k0:int, k1:int);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.tracking

