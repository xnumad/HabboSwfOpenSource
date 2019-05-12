package com.sulake.core.window.graphics.renderer
{
    import com.sulake.core.window.utils.ChildEntityArray;
    import flash.geom.Rectangle;
    import com.sulake.core.window.utils.IChildEntity;

    public class SkinLayout extends ChildEntityArray implements ISkinLayout 
    {
        protected var _name:String;
        protected var _width:uint;
        protected var _height:uint;
        protected var _blendMode:String;
        protected var _transparent:Boolean;

        public function SkinLayout(k:String, _arg_2:Boolean, _arg_3:String)
        {
            this._name = k;
            this._width = 0;
            this._height = 0;
            this._blendMode = _arg_3;
            this._transparent = _arg_2;
        }

        public function get name():String
        {
            return this._name;
        }

        public function get width():uint
        {
            return this._width;
        }

        public function get height():uint
        {
            return this._height;
        }

        public function get blendMode():String
        {
            return this._blendMode;
        }

        public function get transparent():Boolean
        {
            return this._transparent;
        }

        public function dispose():void
        {
            var k:uint;
            var _local_2:uint = numChildren;
            k = 0;
            while (k < _local_2)
            {
                SkinLayoutEntity(this.removeChildAt(0)).dispose();
                k++;
            }
        }

        public function calculateActualRect(k:Rectangle):void
        {
            var _local_2:Rectangle;
            var _local_3:SkinLayoutEntity;
            var _local_5:uint;
            var _local_4:uint = numChildren;
            k.x = 0xFFFFFFFF;
            k.y = 0xFFFFFFFF;
            k.width = 0;
            k.height = 0;
            _local_5 = 0;
            while (_local_5 < _local_4)
            {
                _local_3 = (getChildAt(_local_5) as SkinLayoutEntity);
                _local_2 = _local_3.region;
                if (_local_2.left < k.left)
                {
                    k.left = _local_2.left;
                }
                if (_local_2.top < k.top)
                {
                    k.top = _local_2.top;
                }
                if (_local_2.right > k.right)
                {
                    k.right = _local_2.right;
                }
                if (_local_2.bottom > k.bottom)
                {
                    k.bottom = _local_2.bottom;
                }
                _local_5++;
            }
        }

        public function isFixedWidth():Boolean
        {
            var _local_2:uint;
            var k:uint = numChildren;
            if (k == 0)
            {
                return false;
            }
            _local_2 = 0;
            while (_local_2 < k)
            {
                if (SkinLayoutEntity(getChildAt(_local_2)).scaleH != SkinLayoutEntity.SCALE_TYPE_FIXED)
                {
                    return false;
                }
                _local_2++;
            }
            return true;
        }

        public function calculateWidth():uint
        {
            var _local_2:Rectangle;
            var _local_4:uint;
            var k:uint;
            var _local_3:uint = numChildren;
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_2 = SkinLayoutEntity(getChildAt(_local_4)).region;
                if (_local_2.right > k)
                {
                    k = _local_2.right;
                }
                _local_4++;
            }
            return k;
        }

        public function isFixedHeight():Boolean
        {
            var _local_2:uint;
            var k:uint = numChildren;
            if (k == 0)
            {
                return false;
            }
            _local_2 = 0;
            while (_local_2 < k)
            {
                if (SkinLayoutEntity(getChildAt(_local_2)).scaleV != SkinLayoutEntity.SCALE_TYPE_FIXED)
                {
                    return false;
                }
                _local_2++;
            }
            return true;
        }

        public function calculateHeight():uint
        {
            var _local_2:Rectangle;
            var _local_4:uint;
            var k:uint;
            var _local_3:uint = numChildren;
            _local_4 = 0;
            while (_local_4 < _local_3)
            {
                _local_2 = SkinLayoutEntity(getChildAt(_local_4)).region;
                if (_local_2.bottom > k)
                {
                    k = _local_2.bottom;
                }
                _local_4++;
            }
            return k;
        }

        public function getDefaultRegion(name:String, region:Rectangle):void
        {
            var childEntity:SkinLayoutEntity = (getChildByName(name) as SkinLayoutEntity);
            if (childEntity == null)
            {
                throw (new Error((("Entity not found: " + name) + "!")));
            }
            region.x = childEntity.region.x;
            region.y = childEntity.region.y;
            region.width = childEntity.region.width;
            region.height = childEntity.region.height;
        }

        override public function addChild(k:IChildEntity):IChildEntity
        {
            var _local_2:SkinLayoutEntity = SkinLayoutEntity(k);
            this._width = ((_local_2.region.right > this._width) ? _local_2.region.right : this._width);
            this._height = ((_local_2.region.bottom > this._height) ? _local_2.region.bottom : this._height);
            return super.addChild(k);
        }

        override public function addChildAt(k:IChildEntity, _arg_2:int):IChildEntity
        {
            var _local_3:SkinLayoutEntity = SkinLayoutEntity(k);
            this._width = ((_local_3.region.right > this._width) ? _local_3.region.right : this._width);
            this._height = ((_local_3.region.bottom > this._height) ? _local_3.region.bottom : this._height);
            return super.addChildAt(k, _arg_2);
        }

        override public function removeChild(k:IChildEntity):IChildEntity
        {
            super.removeChild(k);
            this._width = this.calculateWidth();
            this._height = this.calculateHeight();
            return k;
        }

        override public function removeChildAt(k:int):IChildEntity
        {
            var _local_2:IChildEntity = super.removeChildAt(k);
            this._width = this.calculateWidth();
            this._height = this.calculateHeight();
            return _local_2;
        }
    }
}
