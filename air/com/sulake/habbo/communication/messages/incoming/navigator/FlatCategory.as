//com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    public class FlatCategory {

        private var _nodeId:int;
        private var _nodeName:String;
        private var _visible:Boolean;
        private var _automatic:Boolean;

        public function FlatCategory(k:IMessageDataWrapper);

        public function get nodeId():int;

        public function get nodeName():String;

        public function get visible():Boolean;

        public function get automatic():Boolean;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

