//com.sulake.habbo.communication.messages.outgoing.facebook.FaceBookIsLoggedOnMessageComposer

package com.sulake.habbo.communication.messages.outgoing.facebook{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class FaceBookIsLoggedOnMessageComposer implements IMessageComposer {

        private var _params:Array;

        public function FaceBookIsLoggedOnMessageComposer(k:String, _arg_2:String, _arg_3:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.facebook

