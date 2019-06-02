package com.sulake.room
{
    import flash.utils.Dictionary;
    import com.sulake.core.utils.Map;
    import com.sulake.room.renderer.IRoomRendererBase;
    import com.sulake.room.object.IRoomObjectController;
    import com.sulake.room.object.logic.IRoomObjectEventHandler;
    import flash.utils.getTimer;
    import com.sulake.room.object.IRoomObject;

    public class RoomInstance implements IRoomInstance 
    {
        private var _numberDataList:Dictionary;
        private var _stringDataList:Dictionary;
        private var _numberReadOnlyList:Array;
        private var _stringReadOnlyList:Array;
        private var _managers:Map;
        private var _updateCategories:Array;
        private var _renderer:IRoomRendererBase;
        private var _container:IRoomInstanceContainer;
        private var _id:String;

        public function RoomInstance(k:String, _arg_2:IRoomInstanceContainer)
        {
            this._managers = new Map();
            this._updateCategories = [];
            this._container = _arg_2;
            this._id = k;
            this._numberDataList = new Dictionary();
            this._stringDataList = new Dictionary();
            this._numberReadOnlyList = [];
            this._stringReadOnlyList = [];
        }

        public function get id():String
        {
            return this._id;
        }

        public function dispose():void
        {
            var k:String;
            var _local_2:int;
            var _local_3:IRoomObjectManager;
            if (this._managers != null)
            {
                _local_2 = 0;
                while (_local_2 < this._managers.length)
                {
                    _local_3 = (this._managers.getWithIndex(_local_2) as IRoomObjectManager);
                    if (_local_3 != null)
                    {
                        _local_3.dispose();
                    }
                    _local_2++;
                }
                this._managers.dispose();
                this._managers = null;
            }
            if (this._renderer != null)
            {
                this._renderer.dispose();
                this._renderer = null;
            }
            this._container = null;
            this._updateCategories = null;
            if (this._numberDataList != null)
            {
                for (k in this._numberDataList)
                {
                    delete this._numberDataList[k];
                }
                this._numberDataList = null;
            }
            if (this._stringDataList != null)
            {
                for (k in this._stringDataList)
                {
                    delete this._stringDataList[k];
                }
                this._stringDataList = null;
            }
            this._stringReadOnlyList = [];
            this._numberReadOnlyList = [];
        }

        public function getNumber(k:String):Number
        {
            return this._numberDataList[k];
        }

        public function setNumber(k:String, _arg_2:Number, _arg_3:Boolean=false):void
        {
            if (this._numberReadOnlyList.indexOf(k) >= 0)
            {
                return;
            }
            if (_arg_3)
            {
                this._numberReadOnlyList.push(k);
            }
            if (this._numberDataList[k] != _arg_2)
            {
                this._numberDataList[k] = _arg_2;
            }
        }

        public function getString(k:String):String
        {
            return this._stringDataList[k];
        }

        public function setString(k:String, _arg_2:String, _arg_3:Boolean=false):void
        {
            if (this._stringReadOnlyList.indexOf(k) >= 0)
            {
                return;
            }
            if (_arg_3)
            {
                this._stringReadOnlyList.push(k);
            }
            if (this._stringDataList[k] != _arg_2)
            {
                this._stringDataList[k] = _arg_2;
            }
        }

        public function addObjectUpdateCategory(k:int):void
        {
            var _local_2:int = this._updateCategories.indexOf(k);
            if (_local_2 >= 0)
            {
                return;
            }
            this._updateCategories.push(k);
        }

        public function removeObjectUpdateCategory(k:int):void
        {
            var _local_2:int = this._updateCategories.indexOf(k);
            if (_local_2 >= 0)
            {
                this._updateCategories.splice(_local_2, 1);
            }
        }

        public function update():void
        {
            var _local_3:int;
            var _local_4:IRoomObjectManager;
            var _local_5:int;
            var _local_6:IRoomObjectController;
            var _local_7:IRoomObjectEventHandler;
            var k:int = getTimer();
            var _local_2:int = (this._updateCategories.length - 1);
            while (_local_2 >= 0)
            {
                _local_3 = int(this._updateCategories[_local_2]);
                _local_4 = this.getObjectManager(_local_3);
                if (_local_4 != null)
                {
                    _local_5 = (_local_4.getObjectCount() - 1);
                    while (_local_5 >= 0)
                    {
                        _local_6 = _local_4.getObjectWithIndex(_local_5);
                        if (_local_6 != null)
                        {
                            _local_7 = _local_6.getEventHandler();
                            if (_local_7 != null)
                            {
                                _local_7.update(k);
                            }
                        }
                        _local_5--;
                    }
                }
                _local_2--;
            }
        }

        public function createRoomObject(k:int, _arg_2:String, _arg_3:int):IRoomObject
        {
            if (this._container != null)
            {
                return this._container.createRoomObject(this._id, k, _arg_2, _arg_3);
            }
            return null;
        }

        public function createObjectInternal(k:int, _arg_2:int, _arg_3:String, _arg_4:int):IRoomObject
        {
            var _local_6:IRoomObjectController;
            var _local_5:IRoomObjectManager = this.createObjectManager(_arg_4);
            if (_local_5 != null)
            {
                _local_6 = _local_5.createObject(k, _arg_2, _arg_3);
                if (this._renderer != null)
                {
                    this._renderer.feedRoomObject(_local_6);
                }
                return _local_6;
            }
            return null;
        }

        public function getObject(k:int, _arg_2:int):IRoomObject
        {
            var _local_3:IRoomObjectManager = this.getObjectManager(_arg_2);
            if (_local_3 != null)
            {
                return _local_3.getObject(k);
            }
            return null;
        }

        public function getObjects(k:int):Array
        {
            var _local_2:IRoomObjectManager = this.getObjectManager(k);
            return (_local_2) ? _local_2.getObjects() : [];
        }

        public function getObjectWithIndex(k:int, _arg_2:int):IRoomObject
        {
            var _local_3:IRoomObjectManager = this.getObjectManager(_arg_2);
            if (_local_3 != null)
            {
                return _local_3.getObjectWithIndex(k);
            }
            return null;
        }

        public function getObjectCount(k:int):int
        {
            var _local_2:IRoomObjectManager = this.getObjectManager(k);
            if (_local_2 != null)
            {
                return _local_2.getObjectCount();
            }
            return 0;
        }

        public function getObjectWithIndexAndType(k:int, _arg_2:String, _arg_3:int):IRoomObject
        {
            var _local_4:IRoomObjectManager = this.getObjectManager(_arg_3);
            if (_local_4 != null)
            {
                return _local_4.getObjectWithIndexAndType(k, _arg_2);
            }
            return null;
        }

        public function getObjectCountForType(k:String, _arg_2:int):int
        {
            var _local_3:IRoomObjectManager = this.getObjectManager(_arg_2);
            if (_local_3 != null)
            {
                return _local_3.getObjectCountForType(k);
            }
            return 0;
        }

        public function disposeObject(k:int, _arg_2:int):Boolean
        {
            var _local_4:IRoomObject;
            var _local_3:IRoomObjectManager = this.getObjectManager(_arg_2);
            if (_local_3 != null)
            {
                _local_4 = _local_3.getObject(k);
                if (_local_4 != null)
                {
                    _local_4.tearDown();
                    if (this._renderer)
                    {
                        this._renderer.removeRoomObject(_local_4);
                    }
                    return _local_3.disposeObject(k);
                }
            }
            return false;
        }

        public function disposeObjects(k:int):int
        {
            var _local_4:int;
            var _local_5:IRoomObjectController;
            var _local_2:int;
            var _local_3:IRoomObjectManager = this.getObjectManager(k);
            if (_local_3 != null)
            {
                _local_2 = _local_3.getObjectCount();
                _local_4 = 0;
                while (_local_4 < _local_2)
                {
                    _local_5 = (_local_3.getObjectWithIndex(_local_4) as IRoomObjectController);
                    if (_local_5 != null)
                    {
                        if (this._renderer)
                        {
                            this._renderer.removeRoomObject(_local_5);
                        }
                        _local_5.dispose();
                    }
                    _local_4++;
                }
                _local_3.reset();
            }
            return _local_2;
        }

        public function setRenderer(k:IRoomRendererBase):void
        {
            var _local_4:int;
            var _local_5:int;
            var _local_6:int;
            var _local_7:IRoomObjectController;
            if (k == this._renderer)
            {
                return;
            }
            if (this._renderer != null)
            {
                this._renderer.dispose();
            }
            this._renderer = k;
            if (this._renderer == null)
            {
                return;
            }
            this._renderer.reset();
            var _local_2:Array = this.getObjectManagerIds();
            var _local_3:int = (_local_2.length - 1);
            while (_local_3 >= 0)
            {
                _local_4 = int(_local_2[_local_3]);
                _local_5 = this.getObjectCount(_local_4);
                _local_6 = (_local_5 - 1);
                while (_local_6 >= 0)
                {
                    _local_7 = (this.getObjectWithIndex(_local_6, _local_4) as IRoomObjectController);
                    if (_local_7 != null)
                    {
                        this._renderer.feedRoomObject(_local_7);
                    }
                    _local_6--;
                }
                _local_3--;
            }
        }

        public function getRenderer():IRoomRendererBase
        {
            return this._renderer;
        }

        public function getObjectManagerIds():Array
        {
            return this._managers.getKeys();
        }

        protected function createObjectManager(k:int):IRoomObjectManager
        {
            var _local_2:String = String(k);
            if (this._managers.getValue(_local_2) != null)
            {
                return this._managers.getValue(_local_2) as IRoomObjectManager;
            }
            if (this._container == null)
            {
                return null;
            }
            var _local_3:IRoomObjectManager = this._container.createRoomObjectManager();
            if (_local_3 != null)
            {
                this._managers.add(_local_2, _local_3);
            }
            return _local_3;
        }

        protected function getObjectManager(k:int):IRoomObjectManager
        {
            return this._managers.getValue(String(k)) as IRoomObjectManager;
        }

        protected function disposeObjectManager(k:int):Boolean
        {
            var _local_3:IRoomObjectManager;
            var _local_2:String = String(k);
            this.disposeObjects(k);
            if (this._managers.getValue(_local_2) != null)
            {
                _local_3 = (this._managers.remove(_local_2) as IRoomObjectManager);
                if (_local_3 != null)
                {
                    _local_3.dispose();
                }
                return true;
            }
            return false;
        }

        public function hasUninitializedObjects():Boolean
        {
            var k:RoomObjectManager;
            var _local_2:int;
            var _local_3:int;
            for each (k in this._managers)
            {
                _local_2 = k.getObjectCount();
                _local_3 = 0;
                while (_local_3 < _local_2)
                {
                    if (!k.getObjectWithIndex(_local_3).isInitialized())
                    {
                        return true;
                    }
                    _local_3++;
                }
            }
            return false;
        }
    }
}

