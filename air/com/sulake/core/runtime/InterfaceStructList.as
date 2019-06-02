//com.sulake.core.runtime.InterfaceStructList

package com.sulake.core.runtime{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IID;
    import com.sulake.core.runtime.IUnknown;

    final class InterfaceStructList implements IDisposable {

        private var _list:Array;

        public function InterfaceStructList();

        public function get length():uint;

        public function get disposed():Boolean;

        public function dispose():void;

        public function insert(k:InterfaceStruct):uint;

        public function remove(k:uint):InterfaceStruct;

        public function find(k:IID):IUnknown;

        public function getStructByInterface(k:IID):InterfaceStruct;

        public function getIndexByInterface(k:IID):int;

        public function mapStructsByInterface(k:IID, _arg_2:Array):uint;

        public function getStructByImplementor(k:IUnknown):InterfaceStruct;

        public function getIndexByImplementor(k:IUnknown):int;

        public function mapStructsByImplementor(k:IUnknown, _arg_2:Array):uint;

        public function getStructByIndex(k:uint):InterfaceStruct;

        public function getTotalReferenceCount():uint;


    }
}//package com.sulake.core.runtime

