package com.sulake.habbo.friendlist.domain
{
    import com.sulake.core.runtime.IDisposable;
    import com.sulake.core.window.IWindowContainer;
    import com.sulake.habbo.friendlist.Util;

    public class _Str_2591 implements IDisposable 
    {
        public static const _Str_3331:int = 100;
        public static const _Str_15031:int = 0;
        public static const _Str_7666:int = -1;

        private var _id:int;
        private var _name:String;
        private var _open:Boolean;
        private var _friends:Array;
        private var _received:Boolean;
        private var _disposed:Boolean;
        private var _view:IWindowContainer;
        private var _Str_4347:int;

        public function _Str_2591(k:int, _arg_2:String)
        {
            this._friends = [];
            super();
            this._id = k;
            this._name = _arg_2;
            this._open = (!(this._id == _Str_7666));
        }

        public function dispose():void
        {
            if (this._disposed)
            {
                return;
            }
            this._disposed = true;
            this._view = null;
        }

        public function _Str_11247(k:Friend):void
        {
            this._Str_8793(k.id);
            this._friends.push(k);
            this._friends.sortOn(["pocketHabboUser", "name"], [(Array.NUMERIC | Array.DESCENDING), Array.CASEINSENSITIVE]);
        }

        public function _Str_8217(k:Array):void
        {
            var _local_2:Friend;
            for each (_local_2 in this._friends)
            {
                if (_local_2.selected)
                {
                    k.push(_local_2);
                }
            }
        }

        public function getFriend(k:int):Friend
        {
            var _local_2:Friend;
            for each (_local_2 in this._friends)
            {
                if (_local_2.id == k)
                {
                    return _local_2;
                }
            }
            return null;
        }

        public function _Str_5401(k:Boolean, _arg_2:Boolean=false):int
        {
            var _local_4:Friend;
            var _local_3:int;
            for each (_local_4 in this._friends)
            {
                if ((((!(k)) || (_local_4.online)) && ((!(_arg_2)) || (_local_4._Str_4501))))
                {
                    _local_3 = (_local_3 + 1);
                }
            }
            return _local_3;
        }

        public function _Str_8793(k:int):Friend
        {
            var _local_2:Friend = this.getFriend(k);
            if (_local_2 != null)
            {
                Util.remove(this._friends, _local_2);
                return _local_2;
            }
            return null;
        }

        private function _Str_19812():void
        {
            if (this._Str_4347 >= this._Str_11426())
            {
                this._Str_4347 = Math.max(0, (this._Str_11426() - 1));
            }
        }

        public function _Str_11426():int
        {
            return Math.ceil((this._friends.length / _Str_3331));
        }

        public function _Str_23845():int
        {
            this._Str_19812();
            return this._Str_4347 * _Str_3331;
        }

        public function _Str_25646():int
        {
            this._Str_19812();
            return Math.min(((this._Str_4347 + 1) * _Str_3331), this._friends.length);
        }

        public function _Str_22255(k:Boolean):void
        {
            var _local_2:Friend;
            this._open = k;
            if (!k)
            {
                for each (_local_2 in this._friends)
                {
                    _local_2.selected = false;
                }
            }
        }

        public function get disposed():Boolean
        {
            return this._disposed;
        }

        public function get received():Boolean
        {
            return this._received;
        }

        public function get id():int
        {
            return this._id;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get friends():Array
        {
            return this._friends;
        }

        public function get view():IWindowContainer
        {
            return this._view;
        }

        public function get open():Boolean
        {
            return this._open;
        }

        public function get pageIndex():int
        {
            return this._Str_4347;
        }

        public function set id(k:int):void
        {
            this._id = k;
        }

        public function set name(k:String):void
        {
            this._name = k;
        }

        public function set view(k:IWindowContainer):void
        {
            this._view = k;
        }

        public function set received(k:Boolean):void
        {
            this._received = k;
        }

        public function set pageIndex(k:int):void
        {
            this._Str_4347 = k;
        }
    }
}
