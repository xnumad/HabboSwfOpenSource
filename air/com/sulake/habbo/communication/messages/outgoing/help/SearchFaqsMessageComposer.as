//com.sulake.habbo.communication.messages.outgoing.help.SearchFaqsMessageComposer

package com.sulake.habbo.communication.messages.outgoing.help{
    import com.sulake.core.communication.messages.IMessageComposer;

    [SecureSWF(rename="true")]
    public class SearchFaqsMessageComposer implements IMessageComposer {

        private var _searchString:String;

        public function SearchFaqsMessageComposer(k:String);

        public function getMessageArray():Array;

        public function dispose():void;


    }
}//package com.sulake.habbo.communication.messages.outgoing.help

