//com.sulake.habbo.communication.messages.incoming.navigator.CategoriesWithVisitorCountData

package com.sulake.habbo.communication.messages.incoming.navigator{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.utils.Map;
    import com.sulake.core.communication.messages.IMessageDataWrapper;

    [SecureSWF(rename="true")]
    public class CategoriesWithVisitorCountData implements IDisposable, MsgWithRequestId {

        private var _categoryToCurrentUserCountMap:Map;
        private var _categoryToMaxUserCountMap:Map;
        private var _disposed:Boolean;

        public function CategoriesWithVisitorCountData(k:IMessageDataWrapper);

        public function dispose():void;

        public function get disposed():Boolean;

        public function get categoryToCurrentUserCountMap():Map;

        public function get categoryToMaxUserCountMap():Map;


    }
}//package com.sulake.habbo.communication.messages.incoming.navigator

