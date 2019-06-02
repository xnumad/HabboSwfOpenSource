//com.sulake.habbo.communication.messages.outgoing.room.session.OpenFlatConnectionMessageComposer

package com.sulake.habbo.communication.messages.outgoing.room.session{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class OpenFlatConnectionMessageComposer implements IMessageComposer {

        private var _message:Array;

        public function OpenFlatConnectionMessageComposer(k:int, _arg_2:String="", _arg_3:int=-1);

        public function dispose():void;

        public function getMessageArray():Array;


    }
}//package com.sulake.habbo.communication.messages.outgoing.room.session

