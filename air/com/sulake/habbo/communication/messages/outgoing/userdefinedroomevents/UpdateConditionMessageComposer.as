//com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents.UpdateConditionMessageComposer

package com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class UpdateConditionMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function UpdateConditionMessageComposer(k:int, _arg_2:Array, _arg_3:String, _arg_4:Array, _arg_5:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.userdefinedroomevents

