//com.sulake.habbo.communication.messages.outgoing.tracking.EventLogMessageComposer

package com.sulake.habbo.communication.messages.outgoing.tracking{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class EventLogMessageComposer implements IMessageComposer {

        private var _category:String;
        private var _type:String;
        private var _action:String;
        private var _extraString:String;
        private var _extraInt:int;

        public function EventLogMessageComposer(k:String, _arg_2:String, _arg_3:String, _arg_4:String="", _arg_5:int=0);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.tracking

