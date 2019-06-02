//com.sulake.habbo.communication.messages.incoming.navigator.CategoriesWithVisitorCountEvent

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.MessageEvent;
    import com.sulake.core.communication.messages.IMessageEvent;
    import com.sulake.habbo.communication.messages.parser.navigator.CategoriesWithVisitorCountParser;

    [SecureSWF(rename="true")]
    public class CategoriesWithVisitorCountEvent extends MessageEvent implements IMessageEvent {

        public function CategoriesWithVisitorCountEvent(k:Function);

        public function getParser():CategoriesWithVisitorCountParser;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

