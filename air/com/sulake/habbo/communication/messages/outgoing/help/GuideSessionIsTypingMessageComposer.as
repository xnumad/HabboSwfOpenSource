//com.sulake.habbo.communication.messages.outgoing.help.GuideSessionIsTypingMessageComposer

package com.sulake.habbo.communication.messages.outgoing.help{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class GuideSessionIsTypingMessageComposer implements IMessageComposer, IDisposable {

        private var _data:Array;
        private var _disposed:Boolean;

        public function GuideSessionIsTypingMessageComposer(k:Boolean);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.help

