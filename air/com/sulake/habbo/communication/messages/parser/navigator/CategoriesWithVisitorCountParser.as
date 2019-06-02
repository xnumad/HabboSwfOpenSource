//com.sulake.habbo.communication.messages.parser.navigator.CategoriesWithVisitorCountParser

package com.sulake.habbo.communication.messages.parser.navigator{
    import com.sulake.core.communication.messages.IMessageParser;
    import com.sulake.habbo.communication.messages.incoming.navigator.CategoriesWithVisitorCountData;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CategoriesWithVisitorCountParser implements IMessageParser {

        private var _data:CategoriesWithVisitorCountData;

        public function CategoriesWithVisitorCountParser();

        public function flush():Boolean;

        public function parse(k:IMessageDataWrapper):Boolean;

        public function get data():CategoriesWithVisitorCountData;


    }
}//package com.sulake.habbo.communication.messages.parser.navigator

