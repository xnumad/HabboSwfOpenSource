//com.sulake.habbo.communication.messages.outgoing.mysterybox.MysteryBoxWaitingCanceledMessageComposer

package com.sulake.habbo.communication.messages.outgoing.mysterybox{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class MysteryBoxWaitingCanceledMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function MysteryBoxWaitingCanceledMessageComposer(k:int);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.mysterybox

