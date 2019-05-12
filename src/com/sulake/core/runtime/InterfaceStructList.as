package com.sulake.core.runtime
{
    import com.sulake.core.runtime.IDisposable;
    import flash.utils.getQualifiedClassName;
    import com.sulake.core.runtime.IID;
    import com.sulake.core.runtime.IUnknown;
    import com.sulake.core.runtime.*;

    internal final class InterfaceStructList implements IDisposable 
    {
        private var _list:Array;

        public function InterfaceStructList()
        {
            this._list = new Array();
            super();
        }

        public function get length():uint
        {
            return this._list.length;
        }

        public function get disposed():Boolean
        {
            return this._list == null;
        }

        public function dispose():void
        {;
            for (var index:uint;  index < this._list.length; index++)
            {
                this._list.pop().dispose();
            }
            this._list = null;
        }

        public function insert(interfaceStruct:InterfaceStruct):uint
        {
            this._list.push(interfaceStruct);
            return this._list.length;
        }

        public function remove(index:uint):InterfaceStruct
        {
            if (index < this._list.length)
            {
                var interfaceStruct:InterfaceStruct = this._list[index];
                this._list.splice(index, 1);
                return interfaceStruct;
            }
            throw (new Error("Index out of range!"));
        }

        public function find(iid:IID):IUnknown
        {
            var name:String = getQualifiedClassName(iid);
            for (var index:uint; index < this._list.length; index++)
            {
				var interfaceStruct:InterfaceStruct = (this._list[index] as InterfaceStruct);
                if (interfaceStruct.iis == name)
                {
                    return interfaceStruct.unknown;
                }
            }
            return null;
        }

        public function getStructByInterface(iid:IID):InterfaceStruct
        {
            var name:String = getQualifiedClassName(iid);
            for (var index:uint; index < this._list.length; index++ )
            {
                var interfaceStruct:InterfaceStruct = (this._list[index] as InterfaceStruct);
                if (interfaceStruct.iis == name)
                {
                    return interfaceStruct;
                }
            }
            return null;
        }

        public function getIndexByInterface(iid:IID):int
        {
            var name:String = getQualifiedClassName(iid);
            for (var index:int;  index < this._list.length; index++)
            {
                var interfaceStruct:InterfaceStruct = (this._list[index] as InterfaceStruct);
                if (interfaceStruct.iis == name)
                {
                    return index;
                }
            }
            return -1;
        }

        public function mapStructsByInterface(iid:IID, out:Array):uint
        {
            var name:String = getQualifiedClassName(iid);
            var count:uint;
            for (var index:uint; index < this._list.length; index++)
            {
                var interfaceStruct:InterfaceStruct = (this._list[index] as InterfaceStruct);
                if (interfaceStruct.iis == name)
                {
                    out.push(interfaceStruct);
                    count++;
                }
            }
            return count;
        }

        public function getStructByImplementor(unknown:IUnknown):InterfaceStruct
        {
            for (var index:uint; index < this._list.length; index++)
            {
                var interfaceStruct:InterfaceStruct = (this._list[index] as InterfaceStruct);
                if (interfaceStruct.unknown == unknown)
                {
                    return interfaceStruct;
                }
            }
            return null;
        }

        public function getIndexByImplementor(unknown:IUnknown):int
        {
            var interfaceStruct:InterfaceStruct;
            for (var index:uint;  index < this._list.length; index++ )
            {
                interfaceStruct = (this._list[index] as InterfaceStruct);
                if (interfaceStruct.unknown == unknown)
                {
                    return index;
                }
            }
            return -1;
        }

        public function mapStructsByImplementor(unknown:IUnknown, out:Array):uint
        {
            var count:uint;
            for (var index:uint = 0; index < this._list.length; index++)
            {
                var interfaceStruct:InterfaceStruct = (this._list[index] as InterfaceStruct);
                if (interfaceStruct.unknown == unknown)
                {
                    out.push(interfaceStruct);
                    count++;
                }
            }
            return count;
        }

        public function getStructByIndex(index:uint):InterfaceStruct
        {
            return (index < this._list.length) ? this._list[index] : null;
        }

        public function getTotalReferenceCount():uint
        {
            var count:uint;
            for (var index:uint = 0; index < this._list.length; index++ )
            {
                var interfaceStruct:InterfaceStruct = (this._list[index] as InterfaceStruct);
                count = (count + interfaceStruct.references);
            }
            return count;
        }
    }
}
