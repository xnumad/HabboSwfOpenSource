package com.sulake.room.utils
{
    import com.sulake.core.utils.Map;
    import flash.geom.Point;

    public class RoomGeometry implements IRoomGeometry 
    {
        public static const SCALE_ZOOMED_IN:Number = 64;
        public static const SCALE_ZOOMED_OUT:Number = 32;

        private var _updateId:int = 0;
        private var _x:Vector3d;
        private var _y:Vector3d;
        private var _z:Vector3d;
        private var _directionAxis:Vector3d;
        private var _location:Vector3d;
        private var _direction:Vector3d;
        private var _depth:Vector3d;
        private var _scale:Number = 1;
        private var _x_scale:Number = 1;
        private var _y_scale:Number = 1;
        private var _z_scale:Number = 1;
        private var _x_scale_internal:Number = 1;
        private var _y_scale_internal:Number = 1;
        private var _z_scale_internal:Number = 1;
        private var _loc:Vector3d;
        private var _dir:Vector3d;
        private var _clipNear:Number = -500;
        private var _clipFar:Number = 500;
        private var _displacements:Map = null;

        public function RoomGeometry(k:Number, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d=null)
        {
            this.scale = k;
            this._x = new Vector3d();
            this._y = new Vector3d();
            this._z = new Vector3d();
            this._directionAxis = new Vector3d();
            this._location = new Vector3d();
            this._direction = new Vector3d();
            this._depth = new Vector3d();
            this._x_scale_internal = 1;
            this._y_scale_internal = 1;
            this.x_scale = 1;
            this.y_scale = 1;
            this._z_scale_internal = (Math.sqrt((1 / 2)) / Math.sqrt((3 / 4)));
            this.z_scale = 1;
            this.location = new Vector3d(_arg_3.x, _arg_3.y, _arg_3.z);
            this.direction = new Vector3d(_arg_2.x, _arg_2.y, _arg_2.z);
            if (_arg_4 != null)
            {
                this.setDepthVector(_arg_4);
            }
            else
            {
                this.setDepthVector(_arg_2);
            }
            this._displacements = new Map();
        }

        public static function getIntersectionVector(k:IVector3d, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d):IVector3d
        {
            var _local_5:Number = Vector3d.dotProduct(_arg_2, _arg_4);
            if (Math.abs(_local_5) < 1E-5)
            {
                return null;
            }
            var _local_6:Vector3d = Vector3d.dif(k, _arg_3);
            var _local_7:Number = (-(Vector3d.dotProduct(_arg_4, _local_6)) / _local_5);
            var _local_8:Vector3d = Vector3d.sum(k, Vector3d.product(_arg_2, _local_7));
            return _local_8;
        }


        public function get updateId():int
        {
            return this._updateId;
        }

        public function get scale():Number
        {
            return this._scale / Math.sqrt(0.5);
        }

        public function get directionAxis():IVector3d
        {
            return this._directionAxis;
        }

        public function get location():IVector3d
        {
            this._location.assign(this._loc);
            this._location.x = (this._location.x * this._x_scale);
            this._location.y = (this._location.y * this._y_scale);
            this._location.z = (this._location.z * this._z_scale);
            return this._location;
        }

        public function get direction():IVector3d
        {
            return this._direction;
        }

        public function set x_scale(k:Number):void
        {
            if (this._x_scale != (k * this._x_scale_internal))
            {
                this._x_scale = (k * this._x_scale_internal);
                this._updateId++;
            }
        }

        public function set y_scale(k:Number):void
        {
            if (this._y_scale != (k * this._y_scale_internal))
            {
                this._y_scale = (k * this._y_scale_internal);
                this._updateId++;
            }
        }

        public function set z_scale(k:Number):void
        {
            if (this._z_scale != (k * this._z_scale_internal))
            {
                this._z_scale = (k * this._z_scale_internal);
                this._updateId++;
            }
        }

        public function set scale(k:Number):void
        {
            if (k <= 1)
            {
                k = 1;
            }
            k = (k * Math.sqrt(0.5));
            if (k != this._scale)
            {
                this._scale = k;
                this._updateId++;
            }
        }

        public function set location(k:IVector3d):void
        {
            if (k == null)
            {
                return;
            }
            if (this._loc == null)
            {
                this._loc = new Vector3d();
            }
            var _local_2:Number = this._loc.x;
            var _local_3:Number = this._loc.y;
            var _local_4:Number = this._loc.z;
            this._loc.assign(k);
            this._loc.x = (this._loc.x / this._x_scale);
            this._loc.y = (this._loc.y / this._y_scale);
            this._loc.z = (this._loc.z / this._z_scale);
            if ((((!(this._loc.x == _local_2)) || (!(this._loc.y == _local_3))) || (!(this._loc.z == _local_4))))
            {
                this._updateId++;
            }
        }

        public function set direction(k:IVector3d):void
        {
            var _local_21:Number;
            var _local_22:Number;
            var _local_23:Vector3d;
            var _local_24:Vector3d;
            var _local_25:Vector3d;
            if (k == null)
            {
                return;
            }
            if (this._dir == null)
            {
                this._dir = new Vector3d();
            }
            var _local_2:Number = this._dir.x;
            var _local_3:Number = this._dir.y;
            var _local_4:Number = this._dir.z;
            this._dir.assign(k);
            this._direction.assign(k);
            if ((((!(this._dir.x == _local_2)) || (!(this._dir.y == _local_3))) || (!(this._dir.z == _local_4))))
            {
                this._updateId++;
            }
            var _local_5:Vector3d = new Vector3d(0, 1, 0);
            var _local_6:Vector3d = new Vector3d(0, 0, 1);
            var _local_7:Vector3d = new Vector3d(1, 0, 0);
            var _local_8:Number = ((k.x / 180) * Math.PI);
            var _local_9:Number = ((k.y / 180) * Math.PI);
            var _local_10:Number = ((k.z / 180) * Math.PI);
            var _local_11:Number = Math.cos(_local_8);
            var _local_12:Number = Math.sin(_local_8);
            var _local_13:Vector3d = Vector3d.sum(Vector3d.product(_local_5, _local_11), Vector3d.product(_local_7, -(_local_12)));
            var _local_14:Vector3d = new Vector3d(_local_6.x, _local_6.y, _local_6.z);
            var _local_15:Vector3d = Vector3d.sum(Vector3d.product(_local_5, _local_12), Vector3d.product(_local_7, _local_11));
            var _local_16:Number = Math.cos(_local_9);
            var _local_17:Number = Math.sin(_local_9);
            var _local_18:Vector3d = new Vector3d(_local_13.x, _local_13.y, _local_13.z);
            var _local_19:Vector3d = Vector3d.sum(Vector3d.product(_local_14, _local_16), Vector3d.product(_local_15, _local_17));
            var _local_20:Vector3d = Vector3d.sum(Vector3d.product(_local_14, -(_local_17)), Vector3d.product(_local_15, _local_16));
            if (_local_10 != 0)
            {
                _local_21 = Math.cos(_local_10);
                _local_22 = Math.sin(_local_10);
                _local_23 = Vector3d.sum(Vector3d.product(_local_18, _local_21), Vector3d.product(_local_19, _local_22));
                _local_24 = Vector3d.sum(Vector3d.product(_local_18, -(_local_22)), Vector3d.product(_local_19, _local_21));
                _local_25 = new Vector3d(_local_20.x, _local_20.y, _local_20.z);
                this._x.assign(_local_23);
                this._y.assign(_local_24);
                this._z.assign(_local_25);
                this._directionAxis.assign(this._z);
            }
            else
            {
                this._x.assign(_local_18);
                this._y.assign(_local_19);
                this._z.assign(_local_20);
                this._directionAxis.assign(this._z);
            }
        }

        public function dispose():void
        {
            this._x = null;
            this._y = null;
            this._z = null;
            this._loc = null;
            this._dir = null;
            this._directionAxis = null;
            this._location = null;
            if (this._displacements != null)
            {
                this._displacements.dispose();
                this._displacements = null;
            }
        }

        public function setDisplacement(k:IVector3d, _arg_2:IVector3d):void
        {
            var _local_3:String;
            var _local_4:Vector3d;
            if (((k == null) || (_arg_2 == null)))
            {
                return;
            }
            if (this._displacements != null)
            {
                _local_3 = ((((int(Math.round(k.x)) + "_") + int(Math.round(k.y))) + "_") + int(Math.round(k.z)));
                this._displacements.remove(_local_3);
                _local_4 = new Vector3d();
                _local_4.assign(_arg_2);
                this._displacements.add(_local_3, _local_4);
                this._updateId++;
            }
        }

        private function getDisplacement(k:IVector3d):IVector3d
        {
            var _local_2:String;
            if (this._displacements != null)
            {
                _local_2 = ((((int(Math.round(k.x)) + "_") + int(Math.round(k.y))) + "_") + int(Math.round(k.z)));
                return this._displacements.getValue(_local_2);
            }
            return null;
        }

        public function setDepthVector(k:IVector3d):void
        {
            var _local_18:Number;
            var _local_19:Number;
            var _local_20:Vector3d;
            var _local_21:Vector3d;
            var _local_22:Vector3d;
            var _local_2:Vector3d = new Vector3d(0, 1, 0);
            var _local_3:Vector3d = new Vector3d(0, 0, 1);
            var _local_4:Vector3d = new Vector3d(1, 0, 0);
            var _local_5:Number = ((k.x / 180) * Math.PI);
            var _local_6:Number = ((k.y / 180) * Math.PI);
            var _local_7:Number = ((k.z / 180) * Math.PI);
            var _local_8:Number = Math.cos(_local_5);
            var _local_9:Number = Math.sin(_local_5);
            var _local_10:Vector3d = Vector3d.sum(Vector3d.product(_local_2, _local_8), Vector3d.product(_local_4, -(_local_9)));
            var _local_11:Vector3d = new Vector3d(_local_3.x, _local_3.y, _local_3.z);
            var _local_12:Vector3d = Vector3d.sum(Vector3d.product(_local_2, _local_9), Vector3d.product(_local_4, _local_8));
            var _local_13:Number = Math.cos(_local_6);
            var _local_14:Number = Math.sin(_local_6);
            var _local_15:Vector3d = new Vector3d(_local_10.x, _local_10.y, _local_10.z);
            var _local_16:Vector3d = Vector3d.sum(Vector3d.product(_local_11, _local_13), Vector3d.product(_local_12, _local_14));
            var _local_17:Vector3d = Vector3d.sum(Vector3d.product(_local_11, -(_local_14)), Vector3d.product(_local_12, _local_13));
            if (_local_7 != 0)
            {
                _local_18 = Math.cos(_local_7);
                _local_19 = Math.sin(_local_7);
                _local_20 = Vector3d.sum(Vector3d.product(_local_15, _local_18), Vector3d.product(_local_16, _local_19));
                _local_21 = Vector3d.sum(Vector3d.product(_local_15, -(_local_19)), Vector3d.product(_local_16, _local_18));
                _local_22 = new Vector3d(_local_17.x, _local_17.y, _local_17.z);
                this._depth.assign(_local_22);
            }
            else
            {
                this._depth.assign(_local_17);
            }
            this._updateId++;
        }

        public function adjustLocation(k:IVector3d, _arg_2:Number):void
        {
            if (((k == null) || (this._z == null)))
            {
                return;
            }
            var _local_3:Vector3d = Vector3d.product(this._z, -(_arg_2));
            var _local_4:Vector3d = new Vector3d((k.x + _local_3.x), (k.y + _local_3.y), (k.z + _local_3.z));
            this.location = _local_4;
        }

        public function getCoordinatePosition(k:IVector3d):IVector3d
        {
            if (k == null)
            {
                return null;
            }
            var _local_2:Number = Vector3d.scalarProjection(k, this._x);
            var _local_3:Number = Vector3d.scalarProjection(k, this._y);
            var _local_4:Number = Vector3d.scalarProjection(k, this._z);
            var _local_5:Vector3d = new Vector3d(_local_2, _local_3, _local_4);
            return _local_5;
        }

        public function getScreenPosition(k:IVector3d):IVector3d
        {
            var _local_2:Vector3d = Vector3d.dif(k, this._loc);
            _local_2.x = (_local_2.x * this._x_scale);
            _local_2.y = (_local_2.y * this._y_scale);
            _local_2.z = (_local_2.z * this._z_scale);
            var _local_3:Number = Vector3d.scalarProjection(_local_2, this._depth);
            if (((_local_3 < this._clipNear) || (_local_3 > this._clipFar)))
            {
                return null;
            }
            var _local_4:Number = Vector3d.scalarProjection(_local_2, this._x);
            var _local_5:Number = -(Vector3d.scalarProjection(_local_2, this._y));
            _local_4 = (_local_4 * this._scale);
            _local_5 = (_local_5 * this._scale);
            var _local_6:IVector3d = this.getDisplacement(k);
            if (_local_6 != null)
            {
                _local_2 = Vector3d.dif(k, this._loc);
                _local_2.add(_local_6);
                _local_2.x = (_local_2.x * this._x_scale);
                _local_2.y = (_local_2.y * this._y_scale);
                _local_2.z = (_local_2.z * this._z_scale);
                _local_3 = Vector3d.scalarProjection(_local_2, this._depth);
            }
            _local_2.x = _local_4;
            _local_2.y = _local_5;
            _local_2.z = _local_3;
            return _local_2;
        }

        public function getScreenPoint(k:IVector3d):Point
        {
            var _local_2:IVector3d = this.getScreenPosition(k);
            if (_local_2 == null)
            {
                return null;
            }
            var _local_3:Point = new Point(_local_2.x, _local_2.y);
            return _local_3;
        }

        public function getPlanePosition(k:Point, _arg_2:IVector3d, _arg_3:IVector3d, _arg_4:IVector3d):Point
        {
            var _local_15:Number;
            var _local_16:Number;
            var _local_5:Number = (k.x / this._scale);
            var _local_6:Number = (-(k.y) / this._scale);
            var _local_7:Vector3d = Vector3d.product(this._x, _local_5);
            _local_7.add(Vector3d.product(this._y, _local_6));
            var _local_8:Vector3d = new Vector3d((this._loc.x * this._x_scale), (this._loc.y * this._y_scale), (this._loc.z * this._z_scale));
            _local_8.add(_local_7);
            var _local_9:IVector3d = this._z;
            var _local_10:Vector3d = new Vector3d((_arg_2.x * this._x_scale), (_arg_2.y * this._y_scale), (_arg_2.z * this._z_scale));
            var _local_11:Vector3d = new Vector3d((_arg_3.x * this._x_scale), (_arg_3.y * this._y_scale), (_arg_3.z * this._z_scale));
            var _local_12:Vector3d = new Vector3d((_arg_4.x * this._x_scale), (_arg_4.y * this._y_scale), (_arg_4.z * this._z_scale));
            var _local_13:IVector3d = Vector3d.crossProduct(_local_11, _local_12);
            var _local_14:Vector3d = new Vector3d();
            _local_14.assign(RoomGeometry.getIntersectionVector(_local_8, _local_9, _local_10, _local_13));
            if (_local_14 != null)
            {
                _local_14.sub(_local_10);
                _local_15 = ((Vector3d.scalarProjection(_local_14, _arg_3) / _local_11.length) * _arg_3.length);
                _local_16 = ((Vector3d.scalarProjection(_local_14, _arg_4) / _local_12.length) * _arg_4.length);
                return new Point(_local_15, _local_16);
            }
            return null;
        }

        public function performZoom():void
        {
            if (this.isZoomedIn())
            {
                this.scale = SCALE_ZOOMED_OUT;
            }
            else
            {
                this.scale = SCALE_ZOOMED_IN;
            }
        }

        public function isZoomedIn():Boolean
        {
            return this.scale == SCALE_ZOOMED_IN;
        }

        public function performZoomOut():void
        {
            this.scale = SCALE_ZOOMED_OUT;
        }

        public function performZoomIn():void
        {
            this.scale = SCALE_ZOOMED_IN;
        }
    }
}
