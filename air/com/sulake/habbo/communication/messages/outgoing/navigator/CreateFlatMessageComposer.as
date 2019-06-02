//com.sulake.habbo.communication.messages.outgoing.navigator.CreateFlatMessageComposer

package com.sulake.habbo.communication.messages.outgoing.navigator{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class CreateFlatMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function CreateFlatMessageComposer(k:String, _arg_2:String, _arg_3:String, _arg_4:int, _arg_5:int, _arg_6:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.navigator

