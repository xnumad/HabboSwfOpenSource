package com.sulake.room.object
{
    import com.sulake.room.utils.Vector3d;
    import com.sulake.room.object.visualization.IRoomObjectVisualization;
    import com.sulake.room.object.logic.IRoomObjectEventHandler;
    import com.sulake.room.utils.IVector3D;
    import com.sulake.room.object.logic.IRoomObjectMouseHandler;
    import com.sulake.room.utils.*;

    public class RoomObject implements IRoomObjectController 
    {
        private static var _Str_3822:int = 0;

        private var _Str_576:int;
        private var _Str_578:String = "";
        private var _Str_2416:Vector3d;
        private var _Str_2589:Vector3d;
        private var _Str_17023:Vector3d;
        private var _Str_18908:Vector3d;
        private var _Str_6775:Array;
        private var _roomObjectModel:RoomObjectModel;
        private var _visualization:IRoomObjectVisualization;
        private var _roomObjectLogic:IRoomObjectEventHandler;
        private var _Str_2542:int;
        private var _Str_4848:int = 0;
        private var _Str_2367:Boolean = false;

        public function RoomObject(k:int, _arg_2:int, _arg_3:String)
        {
            this._Str_576 = k;
            this._Str_2416 = new Vector3d();
            this._Str_2589 = new Vector3d();
            this._Str_17023 = new Vector3d();
            this._Str_18908 = new Vector3d();
            this._Str_6775 = new Array(_arg_2);
            var _local_4:Number = (_arg_2 - 1);
            while (_local_4 >= 0)
            {
                this._Str_6775[_local_4] = 0;
                _local_4--;
            }
            this._Str_578 = _arg_3;
            this._roomObjectModel = new RoomObjectModel();
            this._visualization = null;
            this._roomObjectLogic = null;
            this._Str_2542 = 0;
            this._Str_4848 = _Str_3822++;
        }

        public function dispose():void
        {
            this._Str_2416 = null;
            this._Str_2589 = null;
            this._Str_6775 = null;
            this._Str_14063(null);
            this._Str_8711(null);
            if (this._roomObjectModel != null)
            {
                this._roomObjectModel.dispose();
                this._roomObjectModel = null;
            }
        }

        public function _Str_17972(k:Boolean):void
        {
            this._Str_2367 = k;
        }

        public function _Str_3022():Boolean
        {
            return this._Str_2367;
        }

        public function getId():int
        {
            return this._Str_576;
        }

        public function getInstanceId():int
        {
            return this._Str_4848;
        }

        public function getType():String
        {
            return this._Str_578;
        }

        public function getLocation():IVector3D
        {
            this._Str_17023._Str_2427(this._Str_2416);
            return this._Str_17023;
        }

        public function getDirection():IVector3D
        {
            this._Str_18908._Str_2427(this._Str_2589);
            return this._Str_18908;
        }

        public function getModel():IRoomObjectModel
        {
            return this._roomObjectModel;
        }

        public function getModelController():IRoomObjectModelController
        {
            return this._roomObjectModel;
        }

        public function getState(k:int):int
        {
            if (((k >= 0) && (k < this._Str_6775.length)))
            {
                return this._Str_6775[k];
            }
            return -1;
        }

        public function _Str_5222():IRoomObjectVisualization
        {
            return this._visualization;
        }

        public function setLocation(k:IVector3D):void
        {
            if (k == null)
            {
                return;
            }
            if ((((!(this._Str_2416.x == k.x)) || (!(this._Str_2416.y == k.y))) || (!(this._Str_2416.z == k.z))))
            {
                this._Str_2416.x = k.x;
                this._Str_2416.y = k.y;
                this._Str_2416.z = k.z;
                this._Str_2542++;
            }
        }

        public function setDirection(k:IVector3D):void
        {
            if (k == null)
            {
                return;
            }
            if ((((!(this._Str_2589.x == k.x)) || (!(this._Str_2589.y == k.y))) || (!(this._Str_2589.z == k.z))))
            {
                this._Str_2589.x = (((k.x % 360) + 360) % 360);
                this._Str_2589.y = (((k.y % 360) + 360) % 360);
                this._Str_2589.z = (((k.z % 360) + 360) % 360);
                this._Str_2542++;
            }
        }

        public function setState(k:int, _arg_2:int):Boolean
        {
            if (((_arg_2 >= 0) && (_arg_2 < this._Str_6775.length)))
            {
                if (this._Str_6775[_arg_2] != k)
                {
                    this._Str_6775[_arg_2] = k;
                    this._Str_2542++;
                }
                return true;
            }
            return false;
        }

        public function _Str_14063(k:IRoomObjectVisualization):void
        {
            if (k != this._visualization)
            {
                if (this._visualization != null)
                {
                    this._visualization.dispose();
                }
                this._visualization = k;
                if (this._visualization != null)
                {
                    this._visualization.object = this;
                }
            }
        }

        public function _Str_8711(k:IRoomObjectEventHandler):void
        {
            if (k == this._roomObjectLogic)
            {
                return;
            }
            var _local_2:IRoomObjectEventHandler = this._roomObjectLogic;
            if (_local_2 != null)
            {
                this._roomObjectLogic = null;
                _local_2.object = null;
            }
            this._roomObjectLogic = k;
            if (this._roomObjectLogic != null)
            {
                this._roomObjectLogic.object = this;
            }
        }

        public function _Str_2377():IRoomObjectEventHandler
        {
            return this._roomObjectLogic;
        }

        public function _Str_3273():int
        {
            return this._Str_2542;
        }

        public function _Str_11182():IRoomObjectMouseHandler
        {
            return this._Str_2377();
        }

        public function tearDown():void
        {
            if (this._roomObjectLogic)
            {
                this._roomObjectLogic.tearDown();
            }
        }
    }
}
