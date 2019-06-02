//com.sulake.habbo.communication.messages.outgoing.register.UpdateFigureDataMessageComposer

package com.sulake.habbo.communication.messages.outgoing.register{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class UpdateFigureDataMessageComposer implements IMessageComposer {

        private var _data:Array;

        public function UpdateFigureDataMessageComposer(k:String, _arg_2:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.register

