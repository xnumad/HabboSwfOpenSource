//com.sulake.core.runtime.ComponentInterfaceQueue

package com.sulake.core.runtime{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IID;
    import __AS3__.vec.Vector;

    class ComponentInterfaceQueue implements IDisposable {

        private var _identifier:IID;
        private var _isDisposed:Boolean;
        private var _receivers:Vector.<Function>;

        public function ComponentInterfaceQueue(k:IID);

        public function get identifier():IID;

        public function get disposed():Boolean;

        public function get receivers():Vector.<Function>;

        public function dispose():void;


    }
}//package com.sulake.core.runtime

