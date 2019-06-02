//com.sulake.core.runtime.InterfaceStruct

package com.sulake.core.runtime{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IID;
    import com.sulake.core.runtime.IUnknown;

    final class InterfaceStruct implements IDisposable {

        private var _iid:IID;
        private var _iis:String;
        private var _unknown:IUnknown;
        private var _references:uint;

        public function InterfaceStruct(k:IID, _arg_2:IUnknown);

        public function get iid():IID;

        public function get iis():String;

        public function get unknown():IUnknown;

        public function get references():uint;

        public function get disposed():Boolean;

        public function dispose():void;

        public function reserve():uint;

        public function release():uint;


    }
}//package com.sulake.core.runtime

