//com.sulake.habbo.communication.messages.parser.room.engine.SlideObjectBundleMessageParser

package com.sulake.habbo.communication.messages.parser.room.engine{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.room.engine.SlideObjectMessageData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class SlideObjectBundleMessageParser implements IMessageParser {

        private var _id:int;
        private var _objectList:Array;
        private var _avatar:SlideObjectMessageData;

        public function SlideObjectBundleMessageParser();

        public function get id():int;

        public function get avatar():SlideObjectMessageData;

        public function get objectList():Array;

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;


    }
}//package com.sulake.habbo.communication.messages.parser.room.engine

