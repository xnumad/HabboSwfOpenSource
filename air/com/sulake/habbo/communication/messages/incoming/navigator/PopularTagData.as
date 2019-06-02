//com.sulake.habbo.communication.messages.incoming.navigator.PopularTagData

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class PopularTagData {

        private var _tagName:String;
        private var _userCount:int;

        public function PopularTagData(k:IMessageDataWrapper);

        public function get tagName():String;

        public function get userCount():int;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

