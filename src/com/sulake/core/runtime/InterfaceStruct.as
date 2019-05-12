package com.sulake.core.runtime
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.runtime.IID;
    import com.sulake.core.runtime.IUnknown;
    import flash.utils.getQualifiedClassName;

    internal final class InterfaceStruct implements IDisposable 
    {
        private var _iid:IID;
        private var _iis:String;
        private var _unknown:IUnknown;
        private var _references:uint;

        public function InterfaceStruct(iid:IID, unknown:IUnknown)
        {
            this._iid = iid;
            this._iis = getQualifiedClassName(this._iid);
            this._unknown = unknown;
            this._references = 0;
        }

        public function get iid():IID
        {
            return this._iid;
        }

        public function get iis():String
        {
            return this._iis;
        }

        public function get unknown():IUnknown
        {
            return this._unknown;
        }

        public function get references():uint
        {
            return this._references;
        }

        public function get disposed():Boolean
        {
            return this._unknown == null;
        }

        public function dispose():void
        {
            this._iid = null;
            this._iis = null;
            this._unknown = null;
            this._references = 0;
        }

        public function reserve():uint
        {
            return ++this._references;
        }

        public function release():uint
        {
            return (this.references > 0) ? --this._references : 0;
        }
    }
}
