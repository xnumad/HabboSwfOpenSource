//com.sulake.habbo.communication.messages.outgoing.preferences.SetChatPreferencesMessageComposer

package com.sulake.habbo.communication.messages.outgoing.preferences{
    import com.sulake.core.communication.messages.IMessageComposer;
    import com.sulake.core.runtime.IDisposable;

    public class SetChatPreferencesMessageComposer implements IMessageComposer, IDisposable {

        private var _array:Array;

        public function SetChatPreferencesMessageComposer(k:Boolean);

        public function getMessageArray():Array;

        public function dispose():void;

        public function get disposed():Boolean;


    }
}//package com.sulake.habbo.communication.messages.outgoing.preferences

