//com.sulake.habbo.communication.messages.outgoing.help.GuideSessionCreateMessageComposer

package com.sulake.habbo.communication.messages.outgoing.help{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    [SecureSWF(rename="true")]
    public class GuideSessionCreateMessageComposer implements IMessageComposer, IDisposable {

        private var _data:Array;
        private var _disposed:Boolean;

        public function GuideSessionCreateMessageComposer(k:int, _arg_2:String);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.help

