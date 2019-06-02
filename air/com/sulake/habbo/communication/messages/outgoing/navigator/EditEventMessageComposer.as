//com.sulake.habbo.communication.messages.outgoing.navigator.EditEventMessageComposer

package com.sulake.habbo.communication.messages.outgoing.navigator{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class EditEventMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function EditEventMessageComposer(k:int, _arg_2:String, _arg_3:String);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.navigator

