//com.sulake.core.communication.messages.MessageClassManager

package com.sulake.core.communication.messages{
    import flash.utils.Dictionary;

    public class MessageClassManager {

        private var _messageIdByComposerClass:Dictionary;
        private var _messageIdByEventClass:Dictionary;
        private var _messageInstancesById:Dictionary;

        public function MessageClassManager();

        public function dispose():void;

        public function registerMessages(k:IMessageConfiguration):void;

        private function registerMessageComposerClass(k:int, _arg_2:Class):void;

        private function registerMessageEventClass(k:int, _arg_2:Class):void;

        public function registerMessageEvent(k:IMessageEvent):void;

        public function unregisterMessageEvent(k:IMessageEvent):void;

        public function getMessageIDForComposer(k:IMessageComposer):int;

        public function getMessageEventsForID(k:int):Array;


    }
}//package com.sulake.core.communication.messages

